# nongchanpin
agriculture-sale-system

# 农产品销售系统

## 一、系统说明
本系统基于 **Spring Boot + Vue + MySQL8** 开发，分为前台购买和后台管理两部分。

- 前端：Vue (位于 `product/front`)
- 后端：Spring Boot (位于 `product/end`)
- 数据库：MySQL8 (脚本见 `0431.sql`)

## 二、运行环境
- JDK 8+
- Maven 3.3+
- Node.js 16+
- MySQL 8.0

## 三、数据库配置
在本地创建数据库：
```sql
CREATE DATABASE 0431 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
````

导入初始化数据：

```bash
mysql -u root -p 0431 < 0431.sql
```

修改 `application.yml` 数据库账号密码，或使用环境变量：

```yaml
spring:
  datasource:
    url: jdbc:mysql://localhost:3306/agriculture?useSSL=false&serverTimezone=UTC
    username: root
    password: root
```

## 四、前端启动

```bash
cd product/front
npm install --registry  https://registry.npmmirror.com
npm run serve
```

## 五、后端启动

使用 IDEA 打开 `product/end` 项目，运行 `Application.java`。

## 六、默认账号

* 管理员：admin / 123456
* 用户：user / 123456

```
