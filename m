From: Xinliang Liu <xinliang.liu@linaro.org>
Subject: [PATCH v8 10/10] MAINTAINERS: Add maintainer for hisilicon DRM driver
Date: Mon, 11 Apr 2016 16:55:43 +0800
Message-ID: <1460364943-76135-11-git-send-email-xinliang.liu@linaro.org>
References: <1460364943-76135-1-git-send-email-xinliang.liu@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1460364943-76135-1-git-send-email-xinliang.liu@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, daniel@ffwll.ch, robh@kernel.org, daniel@fooishbar.org, architt@codeaurora.org, airlied@linux.ie, corbet@lwn.net, catalin.marinas@arm.com, will.deacon@arm.com, emil.l.velikov@gmail.com, mark.rutland@arm.com
Cc: linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com, andy.green@linaro.org, haojian.zhuang@linaro.org, liguozhu@hisilicon.com, xuwei5@hisilicon.com, w.f@huawei.com, puck.chen@hisilicon.com, bintian.wang@huawei.com, benjamin.gaignard@linaro.org, xuyiping@hisilicon.com, kong.kongxinwei@hisilicon.com, zourongrong@huawei.com, lijianhua@huawei.com, sumit.semwal@linaro.org, guodong.xu@linaro.org, Xinliang Liu <xinliang.liu@linaro.org>
List-Id: devicetree@vger.kernel.org

Add maintainer and reviewer for hisilicon DRM driver.

v8: None.
v7: None.
v6: None.
v5: None.
v4:
- Add Chen Feng <puck.chen@hisilicon.com> as Designated reviewer.
v3: First version.

Signed-off-by: Xinliang Liu <xinliang.liu@linaro.org>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 61a323a6b2cf..a2ef58860689 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3840,6 +3840,16 @@ S:	Maintained
 F:	drivers/gpu/drm/gma500
 F:	include/drm/gma500*
=20
+DRM DRIVERS FOR HISILICON
+M:	Xinliang Liu <z.liuxinliang@hisilicon.com>
+R:	Xinwei Kong <kong.kongxinwei@hisilicon.com>
+R:	Chen Feng <puck.chen@hisilicon.com>
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
2.8.0

