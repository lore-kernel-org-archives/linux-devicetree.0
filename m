From: Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: rockchip: set TX PBL for rk3328-roc-cc gmac
Date: Sun, 21 Apr 2019 12:00:45 -0400
Message-ID: <8865b046-fb3a-4071-335c-66abb344d7f4@gmail.com>
References: <20190417210059.26262-1-papadakospan@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20190417210059.26262-1-papadakospan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Jose Abreu <jose.abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, "Leonidas P. Papadakos" <papadakospan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Thanks for sharing that thread, it's nice to finally have an answer to 
why we have these issues.
I've tested this on *my* Firefly rk3328-roc-cc, and while this patch 
succeeds in preventing the tx lockup, iperf3 drops to a delightful 15mbps.

It would seem we have significant differences between manufacturing runs 
of the various boards.
The auto adjustment feature that was discussed in that thread is 
probably the only thing that will solve this for all boards.
Until then I don't think we are going to get a solution that works for all.

On Wed, Apr 17, 2019 at 5:01 PM Leonidas P. Papadakos 
<papadakospan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> Some rockchip boards have issues with tx checksumming for packets
> larger than 1498 B.
>
> An iperf test will tell you that transmissions stop almost immediately.
>
> A workaround to this issue is disabling TX checksumming offload,
> and one of the ways to do that is snps,force_thresh_dma_mode.
>
> But after some discussion here it seems there is another path:
> https://lkml.org/lkml/2019/4/5/148
>
> Setting txpbl is a better-performing (maybe temporary) solution
> compared to disabling T offload.
>
> In my testing with a Libre Computer Renegade, this was the best
> all-around option, and increasing the MTU doesn't cause a queue timeout anymore.
>
> Signed-off-by: Leonidas P. Papadakos <papadakospan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dts b/arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dts
> index 5d499c908..974f2dcdf 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dts
> @@ -141,10 +141,10 @@
>         phy-mode = "rgmii";
>         pinctrl-names = "default";
>         pinctrl-0 = <&rgmiim1_pins>;
> -       snps,force_thresh_dma_mode;
>         snps,reset-gpio = <&gpio1 RK_PC2 GPIO_ACTIVE_LOW>;
>         snps,reset-active-low;
>         snps,reset-delays-us = <0 10000 50000>;
> +       snps,txpbl = <0x4>;
>         tx_delay = <0x24>;
>         rx_delay = <0x18>;
>         status = "okay";
> --
> 2.21.0
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
