From: Xinliang Liu <xinliang.liu@linaro.org>
Subject: [PATCH v3 10/10] MAINTAINERS: Add maintainer for hisilicon DRM driver
Date: Sat, 30 Jan 2016 16:54:35 +0800
Message-ID: <1454144075-74361-11-git-send-email-xinliang.liu@linaro.org>
References: <1454144075-74361-1-git-send-email-xinliang.liu@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1804792554=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1454144075-74361-1-git-send-email-xinliang.liu@linaro.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, daniel@ffwll.ch, robh@kernel.org, daniel@fooishbar.org, architt@codeaurora.org, airlied@linux.ie, corbet@lwn.net, catalin.marinas@arm.com, will.deacon@arm.com, emil.l.velikov@gmail.com
Cc: andy.green@linaro.org, xuyiping@hisilicon.com, guodong.xu@linaro.org, linux-doc@vger.kernel.org, w.f@huawei.com, zourongrong@huawei.com, linuxarm@huawei.com, xuwei5@hisilicon.com, bintian.wang@huawei.com, haojian.zhuang@linaro.org, benjamin.gaignard@linaro.org, puck.chen@hisilicon.com, liguozhu@hisilicon.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============1804792554==
Content-Type: text/plain; charset=n
Content-Transfer-Encoding: quoted-printable

Add maintainer and reviewer for hisilicon DRM driver.

Signed-off-by: Xinliang Liu <xinliang.liu@linaro.org>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 30aca4aa5467..92353c6afc66 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3777,6 +3777,15 @@ S:	Maintained
 F:	drivers/gpu/drm/gma500
 F:	include/drm/gma500*
=20
+DRM DRIVERS FOR HISILICON
+M:	Xinliang Liu <z.liuxinliang@hisilicon.com>
+R:	Xinwei Kong <kong.kongxinwei@hisilicon.com>
+L:	dri-devel@lists.freedesktop.org
+T:	git git://github.com/xin3liang/linux.git
+S:	Maintained
+F:	drivers/gpu/drm/hisilicon
+F:	Documentation/devicetree/bindings/display/hisilicon
+
 DRM DRIVERS FOR NVIDIA TEGRA
 M:	Thierry Reding <thierry.reding@gmail.com>
 M:	Terje Bergstr=C3=B6m <tbergstrom@nvidia.com>
--=20
1.9.1


--===============1804792554==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============1804792554==--
