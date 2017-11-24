From: "sudeep kumar" <sudeepkumar-/0wLYENt7sWikuSvNLsyVV6hYfS7NtTn@public.gmane.org>
Subject: RE: [PATCH 1/3] dt-bindings: Add vendor prefix for Allo.com
Date: Fri, 24 Nov 2017 09:31:58 +0530
Message-ID: <00d801d364d8$fcd8da60$f68a8f20$@cem-solutions.net>
References: <20171114180114.26408-1-afaerber@suse.de> <20171114180114.26408-2-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171114180114.26408-2-afaerber-l3A5Bk7waGM@public.gmane.org>
Content-Language: en-us
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?utf-8?Q?'Andreas_F=C3=A4rber'?= <afaerber-l3A5Bk7waGM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: 'Thomas Liau' <thomas.liau-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>, 'Jeff Chen' <jeff.chen-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>, =?utf-8?B?J+W8oOS4nOmjjic=?= <zhangdf-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>, =?utf-8?B?J+WImOeCnCc=?= <liuwei-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>, =?utf-8?B?J+W8oOWkqeebiic=?= <tyzhang-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>, =?utf-8?B?J+aiheWIqSc=?= <harrymei-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>, 'Ioan B' <ioan-HmMszb9TTf4@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 'Rob Herring' <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, 'Mark Rutland' <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Acked-by : sudeep <sudeepkumar-/0wLYENt7sWikuSvNLsyVV6hYfS7NtTn@public.gmane.org>

-----Original Message-----
From: Andreas Färber [mailto:afaerber-l3A5Bk7waGM@public.gmane.org] 
Sent: Tuesday, November 14, 2017 11:31 PM
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Thomas Liau <thomas.liau-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>; Jeff Chen <jeff.chen-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>; 张东风 <zhangdf-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>; 刘炜 <liuwei-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>; 张天益 <tyzhang-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>; 梅利 <harrymei-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>; Ioan B <ioan-HmMszb9TTf4@public.gmane.org>; Sudeep Kumar <sudeepkumar-/0wLYENt7sWikuSvNLsyVV6hYfS7NtTn@public.gmane.org>; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org>; Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>; Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Subject: [PATCH 1/3] dt-bindings: Add vendor prefix for Allo.com

ALLO is a Canadian-Indian manufacturer of telecommunications hardware.

Cc: Ioan B. <ioan-HmMszb9TTf4@public.gmane.org>
Signed-off-by: Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 0994bdd82cd3..9bce76f3118d 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -15,6 +15,7 @@ adi	Analog Devices, Inc.
 advantech	Advantech Corporation
 aeroflexgaisler	Aeroflex Gaisler AB
 al	Annapurna Labs
+allo	Allo.com
 allwinner	Allwinner Technology Co., Ltd.
 alphascale	AlphaScale Integrated Circuits Systems, Inc.
 altr	Altera Corp.
-- 
2.13.6


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
