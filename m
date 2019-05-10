From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v8 7/9] EDAC: Add missing debugfs_create_x32 wrapper
Date: Fri, 10 May 2019 22:15:34 +1200
Message-ID: <20190510101536.6724-8-chris.packham@alliedtelesis.co.nz>
References: <20190510101536.6724-1-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190510101536.6724-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: linux@armlinux.org.uk, bp@alien8.de, mark.rutland@arm.com, robh+dt@kernel.org, mchehab@kernel.org, james.morse@arm.com, jlu@pengutronix.de, gregory.clement@bootlin.com
Cc: linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Borislav Petkov <bp@suse.de>, Chris Packham <chris.packham@alliedtelesis.co.nz>
List-Id: devicetree@vger.kernel.org

From: Jan Luebbe <jlu@pengutronix.de>

We already have wrappers for x8 and x16, so add the missing x32 one.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
Reviewed-by: Borislav Petkov <bp@suse.de>
Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/edac/debugfs.c     | 11 +++++++++++
 drivers/edac/edac_module.h |  5 +++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/edac/debugfs.c b/drivers/edac/debugfs.c
index 0a9277228c50..91b156b1f0c1 100644
--- a/drivers/edac/debugfs.c
+++ b/drivers/edac/debugfs.c
@@ -137,3 +137,14 @@ struct dentry *edac_debugfs_create_x16(const char *n=
ame, umode_t mode,
 	return debugfs_create_x16(name, mode, parent, value);
 }
 EXPORT_SYMBOL_GPL(edac_debugfs_create_x16);
+
+/* Wrapper for debugfs_create_x32() */
+struct dentry *edac_debugfs_create_x32(const char *name, umode_t mode,
+				       struct dentry *parent, u32 *value)
+{
+	if (!parent)
+		parent =3D edac_debugfs;
+
+	return debugfs_create_x32(name, mode, parent, value);
+}
+EXPORT_SYMBOL_GPL(edac_debugfs_create_x32);
diff --git a/drivers/edac/edac_module.h b/drivers/edac/edac_module.h
index dd7d0b509aa3..9822f1a7e194 100644
--- a/drivers/edac/edac_module.h
+++ b/drivers/edac/edac_module.h
@@ -82,6 +82,8 @@ struct dentry *
 edac_debugfs_create_x8(const char *name, umode_t mode, struct dentry *pa=
rent, u8 *value);
 struct dentry *
 edac_debugfs_create_x16(const char *name, umode_t mode, struct dentry *p=
arent, u16 *value);
+struct dentry *
+edac_debugfs_create_x32(const char *name, umode_t mode, struct dentry *p=
arent, u32 *value);
 #else
 static inline void edac_debugfs_init(void)					{ }
 static inline void edac_debugfs_exit(void)					{ }
@@ -98,6 +100,9 @@ edac_debugfs_create_x8(const char *name, umode_t mode,
 static inline struct dentry *
 edac_debugfs_create_x16(const char *name, umode_t mode,
 		       struct dentry *parent, u16 *value)			{ return NULL; }
+static inline struct dentry *
+edac_debugfs_create_x32(const char *name, umode_t mode,
+		       struct dentry *parent, u32 *value)			{ return NULL; }
 #endif
=20
 /*
--=20
2.21.0
