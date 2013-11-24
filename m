From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH] ARM: dove: Fix typo in device_type property of phy node
Date: Sun, 24 Nov 2013 11:54:53 -0500
Message-ID: <20131124165453.GF29241@titan.lakedaemon.net>
References: <1384440899-3622-1-git-send-email-srinivas.kandagatla@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1384440899-3622-1-git-send-email-srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 14, 2013 at 02:54:59PM +0000, Srinivas Kandagatla wrote:
> This patch fixes a typo for device_type property of phy node.
> This can work as of today but once a checks are added in generic code
> this typo will stop phy from working.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
> ---
>  arch/arm/boot/dts/dove.dtsi |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Applied to mvebu/dt with Andrew's Ack.  I had to hand add it due to the
reworking of dove.dtsi last time around.  I've attached my version, let
me know if it looks amiss.

thx,

Jason.

----------->8---------------------
commit 9e52c63992c19b1d2e9a6b6b8ba61aaf35e9fd17
Author: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
Date:   Sun Nov 24 16:47:51 2013 +0000

    ARM: dove: Fix typo in device_type property of phy node
    
    This patch fixes a typo for device_type property of phy node.
    This can work as of today but once a checks are added in generic code
    this typo will stop phy from working.
    
    Acked-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
    Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>

diff --git a/arch/arm/boot/dts/dove.dtsi b/arch/arm/boot/dts/dove.dtsi
index 113a8bc7bee7..abd7a6fd77f1 100644
--- a/arch/arm/boot/dts/dove.dtsi
+++ b/arch/arm/boot/dts/dove.dtsi
@@ -559,7 +559,7 @@
 				status = "disabled";
 
 				ethphy: ethernet-phy {
-					device-type = "ethernet-phy";
+					device_type = "ethernet-phy";
 					/* set phy address in board file */
 				};
 			};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
