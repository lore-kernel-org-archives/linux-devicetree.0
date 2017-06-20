From: Dongwoo Lee <dwoo08.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/2] Enable USB dual-role operation for TM2 and TM2E
Date: Tue, 20 Jun 2017 16:12:22 +0900
Message-ID: <1497942745-8607-1-git-send-email-dwoo08.lee@samsung.com>
References: <CGME20170620071229epcas1p4076c72c941527ef3073e4036a7421cfb@epcas1p4.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Dongwoo Lee <dwoo08.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Since commit 9840354ff429 ("usb: dwc3: Add dual-role support") USB
dual-role operation on TM2 and TM2E can be enabled by simply adding
extcon property. However, exynos5433 dt has the mislabeled dwc3 node,
and thus we should resolve it first to apply the property.

This patchset fixes up the device tree fault and adds extcon property
to activate dual-role operation.

Dongwoo Lee (2):
  arm64: dts: exynos: Fix wrong label for USB 3.0 controller node
  arm64: dts: exynos: Add extcon property for TM2 and TM2E

 arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 3 ++-
 arch/arm64/boot/dts/exynos/exynos5433.dtsi            | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
