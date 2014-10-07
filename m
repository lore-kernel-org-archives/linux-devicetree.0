From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 2/2] ARM: dts: enable init rate for clock
Date: Tue, 7 Oct 2014 10:03:19 -0700
Message-ID: <CAD=FV=UNXUuJbRpECV0Ay0hR02Dg=rBw+XScvMdfngzWfCqp4w@mail.gmail.com>
References: <1412674438-26160-1-git-send-email-kever.yang@rock-chips.com>
	<1412674438-26160-3-git-send-email-kever.yang@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1412674438-26160-3-git-send-email-kever.yang@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kever Yang <kever.yang@rock-chips.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Mike Turquette <mturquette@linaro.org>, Sonny Rao <sonnyrao@chromium.org>, Addy Ke <addy.ke@rock-chips.com>, Eddie Cai <cf@rock-chips.com>, Jianqun Xu <xjq@rock-chips.com>, han jiang <hj@rock-chips.com>, Tao Huang <huangtao@rock-chips.com>, =?UTF-8?B?5oi05YWL6ZyWIChKYWNrKQ==?= <dkl@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-rockchip@lists.infradead.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Kever,

On Tue, Oct 7, 2014 at 2:33 AM, Kever Yang <kever.yang@rock-chips.com> wrote:
> We need to initialize PLL rate and some of bus clock rate while
> kernel init, for there is no other module will do that.
>
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> ---
>
>  arch/arm/boot/dts/rk3288.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
> index 874e66d..2f4519b 100644
> --- a/arch/arm/boot/dts/rk3288.dtsi
> +++ b/arch/arm/boot/dts/rk3288.dtsi
> @@ -455,6 +455,16 @@
>                 rockchip,grf = <&grf>;
>                 #clock-cells = <1>;
>                 #reset-cells = <1>;
> +               assigned-clocks = <&cru PLL_GPLL>, <&cru PLL_CPLL>,
> +                                 <&cru PLL_NPLL>, <&cru ACLK_CPU>,
> +                                 <&cru HCLK_CPU>, <&cru PCLK_CPU>,
> +                                 <&cru ACLK_PERI>, <&cru HCLK_PERI>,
> +                                 <&cru PCLK_PERI>;
> +               assigned-clock-rates = <594000000>, <400000000>,
> +                                      <500000000>, <300000000>,

When I boot up, I see that ACLK_CPU was 297000000.  You specified
300000000.  Did you expect to get 300?  If you expected 297, I think
you should put 297.  If you expected 300 then we have some debugging
to do.  Note: I'm not quite sure how you'd expect to get 300 given
that none of the PLLs divide evenly to 300...


> +                                      <150000000>, <75000000>,

Similarly, I see 148500000, 74250000

> +                                      <300000000>, <150000000>,

297000000, 148500000

> +                                      <75000000>;

74250000

>         };
>
>         grf: syscon@ff770000 {
> --
> 1.9.1
>
