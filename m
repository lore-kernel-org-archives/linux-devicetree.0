From: Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 0/2] Add dwmac-sun8i on A83T DT
Date: Thu,  9 Nov 2017 09:29:48 +0100
Message-ID: <20171109082950.21124-1-clabbe.montjoie@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello

This patch series add some device node for dwmac-sun8i on A83T.

Changes since v1:
- reworked commit log of patch #1
- added comment on drive strength

Corentin Labbe (2):
  ARM: sun8i: a83t: add dwmac-sun8i device node
  ARM: sun8i: bananapi-m3: Enable dwmac-sun8i

 arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts | 18 +++++++++++++++
 arch/arm/boot/dts/sun8i-a83t.dtsi            | 33 ++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

-- 
2.13.6

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
