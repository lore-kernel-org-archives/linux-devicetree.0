From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 5/5] arm64: dts: rockchip: Fix nanopi4 uSD card detect
Date: Thu, 10 Jan 2019 14:26:15 +0100
Message-ID: <6110368.KK4K1XCW2x@phil>
References: <cover.1546981251.git.robin.murphy@arm.com>
 <6925511.AQqqGbhmY3@phil> <c2c40662-f7aa-75d5-572e-c58b21170b59@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <c2c40662-f7aa-75d5-572e-c58b21170b59-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 9. Januar 2019, 00:22:01 CET schrieb Robin Murphy:
> On 2019-01-08 10:42 pm, Heiko Stuebner wrote:
> > Am Dienstag, 8. Januar 2019, 22:57:27 CET schrieb Robin Murphy:
> >> For whatever reason, the sdmmc_dectn function isn't working properly
> >> as-is, and microSD insertion and removal goes unnoticed. Flipping the
> >> pin into GPIO mode, however, does do the job, so let's just handle it
> >> that way for now until someone feels inclined to figure out what GRF
> >> voodoo or otherwise is needed for correct 'native' operation.
> >>
> >> Signed-off-by: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
> >> ---
> >>   arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi | 7 ++++++-
> >>   1 file changed, 6 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi
> >> index 9c723038d8f8..2a183a6af150 100644
> >> --- a/arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi
> >> +++ b/arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi
> >> @@ -505,6 +505,10 @@
> >>   		sdmmc0_pwr_h: sdmmc0-pwr-h {
> >>   			rockchip,pins = <0 RK_PA1 RK_FUNC_GPIO &pcfg_pull_none>;
> >>   		};
> >> +
> >> +		sdmmc0_det_l: sdmmc0-det-l {
> > 
> > alphabetically by node-name please,
> > aka sdmmc0-det-* should be above sdmmc0-pwr-*
> 
> Right you are, not sure how that one slipped through.
> 
> > If you're respinning the whole series this should be fixed,
> > otherwise I can also do that when applying.
> 
> I've fixed it up locally, although it might be worth holding off on this 
> particular patch for the moment now that I've taken another look through 
> the TRM and noticed those smoking-gun-looking bits in 
> GRF_SIG_DETECT_CON{0,1} - I'll investigate...

Personally I'm very much fine with using a cd-gpio instead of trying
to bring order to the GRF "chaos" ;-) as I'm also not really sure
if we gain anything with the IP-internal detect mechanism.

But then do as you like :-D

> [ side note - do you reckon there'd be any value in bolting a debugfs 
> interface onto the GRF driver, or is the realistic answer to just use 
> /dev/mem like everyone else and stop having silly ideas? ]

I don't think it would help much ... especially when it really only outputs
the register contents in the same way as mem or so does.

Having to fiddle with GRF bits really should only happen in rare cases,
so I guess mem should do the trick for that.

And the GRF driver also was a bit controversial anyway, with the title
of "dumping ground" looming over it ... so I'd like to keep it small
and simple ;-) .

Heiko
