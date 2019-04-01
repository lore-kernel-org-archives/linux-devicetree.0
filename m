From: megous via linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Subject: [PATCH v2 4/5] dt-bindings: gnss: Add u-blox,neo-6m compatible
Date: Mon,  1 Apr 2019 13:56:15 +0200
Message-ID: <20190401115616.21337-5-megous@megous.com>
References: <20190401115616.21337-1-megous@megous.com>
Reply-To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDXLF6FR5INBBZXYQ7SQKGQEON6X4OI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20190401115616.21337-1-megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>

Add compatible for u-blox NEO-6M GPS module.

Signed-off-by: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
---
 Documentation/devicetree/bindings/gnss/u-blox.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gnss/u-blox.txt b/Documentation/devicetree/bindings/gnss/u-blox.txt
index e475659cb85f..7cdefd058fe0 100644
--- a/Documentation/devicetree/bindings/gnss/u-blox.txt
+++ b/Documentation/devicetree/bindings/gnss/u-blox.txt
@@ -9,6 +9,7 @@ Required properties:
 
 - compatible	: Must be one of
 
+			"u-blox,neo-6m"
 			"u-blox,neo-8"
 			"u-blox,neo-m8"
 
-- 
2.21.0
