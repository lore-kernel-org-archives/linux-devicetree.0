From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v9 6/8] EDAC: Add missing debugfs_create_x32 wrapper
Date: Fri, 12 Jul 2019 15:49:02 +1200
Message-ID: <20190712034904.5747-7-chris.packham@alliedtelesis.co.nz>
References: <20190712034904.5747-1-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190712034904.5747-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: bp@alien8.de, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, patches@armlinux.org.uk, mchehab@kernel.org, james.morse@arm.com, jlu@pengutronix.de
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, Borislav Petkov <bp@suse.de>, Chris Packham <chris.packham@alliedtelesis.co.nz>
List-Id: devicetree@vger.kernel.org

From: Jan Luebbe <jlu@pengutronix.de>

We already have wrappers for x8 and x16, so add the missing x32 one.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
Reviewed-by: Borislav Petkov <bp@suse.de>
Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v9:
    - Adapt debugfs_create_x32 to account for recent changes to debugfs a=
pis

 drivers/edac/debugfs.c     | 11 +++++++++++
 drivers/edac/edac_module.h |  4 ++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/edac/debugfs.c b/drivers/edac/debugfs.c
index 1f943599a8ac..4804332d9946 100644
--- a/drivers/edac/debugfs.c
+++ b/drivers/edac/debugfs.c
@@ -138,3 +138,14 @@ void edac_debugfs_create_x16(const char *name, umode=
_t mode,
 	debugfs_create_x16(name, mode, parent, value);
 }
 EXPORT_SYMBOL_GPL(edac_debugfs_create_x16);
+
+/* Wrapper for debugfs_create_x32() */
+void edac_debugfs_create_x32(const char *name, umode_t mode,
+			     struct dentry *parent, u32 *value)
+{
+	if (!parent)
+		parent =3D edac_debugfs;
+
+	debugfs_create_x32(name, mode, parent, value);
+}
+EXPORT_SYMBOL_GPL(edac_debugfs_create_x32);
diff --git a/drivers/edac/edac_module.h b/drivers/edac/edac_module.h
index b2f59ee76c22..388427d378b1 100644
--- a/drivers/edac/edac_module.h
+++ b/drivers/edac/edac_module.h
@@ -82,6 +82,8 @@ void edac_debugfs_create_x8(const char *name, umode_t m=
ode,
 			    struct dentry *parent, u8 *value);
 void edac_debugfs_create_x16(const char *name, umode_t mode,
 			     struct dentry *parent, u16 *value);
+void edac_debugfs_create_x32(const char *name, umode_t mode,
+			     struct dentry *parent, u32 *value);
 #else
 static inline void edac_debugfs_init(void)					{ }
 static inline void edac_debugfs_exit(void)					{ }
@@ -96,6 +98,8 @@ static inline void edac_debugfs_create_x8(const char *n=
ame, umode_t mode,
 					  struct dentry *parent, u8 *value)	{ }
 static inline void edac_debugfs_create_x16(const char *name, umode_t mod=
e,
 					   struct dentry *parent, u16 *value)	{ }
+static inline void edac_debugfs_create_x32(const char *name, umode_t mod=
e,
+		       struct dentry *parent, u32 *value)			{ }
 #endif
=20
 /*
--=20
2.22.0
