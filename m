From: James Pettigrew <james-Rly9TSIBl47vnOemgxGiVw@public.gmane.org>
Subject: [PATCH v4 2/2] devicetree: Add vendor prefix for FriendlyARM
Date: Tue,  6 Sep 2016 08:15:57 +1000
Message-ID: <eb935b967af437ed40b7efe9e4e3d7bf6fd93724.1473112593.git.james@innovum.com.au>
References: <1472701734-1837-1-git-send-email-james@innovum.com.au>
 <cover.1473112593.git.james@innovum.com.au>
Reply-To: james-Rly9TSIBl47vnOemgxGiVw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDJMVRGPPMIMTXNXXYCRUBB62P462-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <cover.1473112593.git.james-Rly9TSIBl47vnOemgxGiVw@public.gmane.org>
In-Reply-To: <cover.1473112593.git.james-Rly9TSIBl47vnOemgxGiVw@public.gmane.org>
References: <cover.1473112593.git.james-Rly9TSIBl47vnOemgxGiVw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, james-Rly9TSIBl47vnOemgxGiVw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Guangzhou FriendlyARM Computer Tech Co., Ltd is a Chinese ARM board vendor.

Signed-off-by: James Pettigrew <james-Rly9TSIBl47vnOemgxGiVw@public.gmane.org>
Reviewed-by: Rask Ingemann Lambertsen <ccc94453-1EA3ORoCGBhoJ7GROcy7lA@public.gmane.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 1992aa9..7b6bda3 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -98,6 +98,7 @@ ezchip	EZchip Semiconductor
 fcs	Fairchild Semiconductor
 firefly	Firefly
 focaltech	FocalTech Systems Co.,Ltd
+friendlyarm	Guangzhou FriendlyARM Computer Tech Co., Ltd
 fsl	Freescale Semiconductor
 ge	General Electric Company
 geekbuying	GeekBuying
-- 
1.9.1
