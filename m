From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: [PATCH v3 9/9] MAINTAINERS: Add maintainer for arm komeda driver
Date: Fri, 21 Dec 2018 10:01:06 +0000
Message-ID: <20181221095757.15510-10-james.qian.wang@arm.com>
References: <20181221095757.15510-1-james.qian.wang@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181221095757.15510-1-james.qian.wang@arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Liviu Dudau <Liviu.Dudau@arm.com>
Cc: "Jonathan Chai (Arm Technology China)" <Jonathan.Chai@arm.com>, Brian Starkey <Brian.Starkey@arm.com>, "Julien Yin (Arm Technology China)" <Julien.Yin@arm.com>, "thomas Sun (Arm Technology China)" <thomas.Sun@arm.com>, Alexandru-Cosmin Gheorghe <Alexandru-Cosmin.Gheorghe@arm.com>, "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>, Ayan Halder <Ayan.Halder@arm.com>, "Tiannan Zhu (Arm Technology China)" <Tiannan.Zhu@arm.com>, "Jin Gao (Arm Technology China)" <Jin.Gao@arm.com>, "Yiqi Kang (Arm Technology China)" <Yiqi.Kang@arm.com>, nd <nd@arm.com>, "malidp@foss.arm.com" <malidp@foss.arm.com>, "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>, "sean@poorly.run" <sean@poorly.run>, corbet
List-Id: devicetree@vger.kernel.org

v2: Adjusted the position of KOMEDA by alphabetical order

Signed-off-by: James (Qian) Wang <james.qian.wang@arm.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 254b7b267731..e48c2e5fd29f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1124,6 +1124,15 @@ S:	Supported
 F:	drivers/gpu/drm/arm/hdlcd_*
 F:	Documentation/devicetree/bindings/display/arm,hdlcd.txt
=20
+ARM KOMEDA DRM-KMS DRIVER
+M:	James (Qian) Wang <james.qian.wang@arm.com>
+M:	Mali DP Maintainers <malidp@foss.arm.com>
+S:	Supported
+F:	drivers/gpu/drm/arm/display/include/
+F:	drivers/gpu/drm/arm/display/komeda/
+F:	Documentation/devicetree/bindings/display/arm/arm,komeda.txt
+F:	Documentation/gpu/komeda-kms.rst
+
 ARM MALI-DP DRM DRIVER
 M:	Liviu Dudau <liviu.dudau@arm.com>
 M:	Brian Starkey <brian.starkey@arm.com>
--=20
2.17.1
