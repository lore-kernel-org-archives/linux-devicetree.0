From: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM64: dts: rockchip: enable eMMC for rk3399 EVB
Date: Tue, 10 May 2016 18:19:19 -0700
Message-ID: <20160511011919.GB77327@google.com>
References: <1462924975-69072-1-git-send-email-briannorris@chromium.org>
 <1462924975-69072-2-git-send-email-briannorris@chromium.org>
 <d8dc5609-3cf6-80ce-462b-d46f0ea6dcff@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <d8dc5609-3cf6-80ce-462b-d46f0ea6dcff-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, May 11, 2016 at 08:59:24AM +0800, Shawn Lin wrote:
> On 2016/5/11 8:02, Brian Norris wrote:
> >The 'mmc-hs400-enhanced-strobe' property has been acked by Rob Herring,
> >though it's still not merged.
> >
> 
> Hi Brain,
> 
> I'm not sure whether it's acceptable to upstream new property which
> isn't merged yet. My major concern is that as the patchset supporting
> h400es will go through mmc tree, so if Ulf should want to shorten the
> name (e.g mmc-hs400-es), you would respin this patch.


Well, Heiko can determine when to accept this. I wanted to post it to
get things moving, but I can drop that property for now if it's going to
cause difficulty.

> Thanks.
> 
> >Signed-off-by: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >---

BTW, I meant to note here that I haven't personally tested this EVB. I
have tested other boards. This patch mostly serves the purpose of an
example user, for my purposes.

Brian

> > arch/arm64/boot/dts/rockchip/rk3399-evb.dts | 12 ++++++++++++
> > 1 file changed, 12 insertions(+)
> >
> >diff --git a/arch/arm64/boot/dts/rockchip/rk3399-evb.dts b/arch/arm64/boot/dts/rockchip/rk3399-evb.dts
> >index 1a3eb1482050..ccfd2bcf02e1 100644
> >--- a/arch/arm64/boot/dts/rockchip/rk3399-evb.dts
> >+++ b/arch/arm64/boot/dts/rockchip/rk3399-evb.dts
> >@@ -89,6 +89,18 @@
> > 	status = "okay";
> > };
> >
> >+&emmc_phy {
> >+	status = "okay";
> >+};
> >+
> >+&sdhci {
> >+	bus-width = <8>;
> >+	mmc-hs400-1_8v;
> >+	non-removable;
> >+	mmc-hs400-enhanced-strobe;
> >+	status = "okay";
> >+};
> >+
> > &uart2 {
> > 	status = "okay";
> > };
> >
> 
> 
> -- 
> Best Regards
> Shawn Lin
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
