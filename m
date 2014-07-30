From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 2/4] ARM: dts: add rk3288 dwc2 controller support
Date: Tue, 29 Jul 2014 21:03:28 -0700
Message-ID: <CAD=FV=VrFpQ_-1Dzk1kMypDjtj7ZFihEVjbt5sNETg=-Fc5jNg@mail.gmail.com>
References: <1406683873-18194-1-git-send-email-kever.yang@rock-chips.com>
 <1406684075-18271-1-git-send-email-kever.yang@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1406684075-18271-1-git-send-email-kever.yang@rock-chips.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kever Yang <kever.yang@rock-chips.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Randy Dunlap <rdunlap@infradead.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Jianqun Xu <xjq@rock-chips.com>, Russell King <linux@arm.linux.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, Kishon Vijay Abraham I <kishon@ti.com>, lyz@rock-chips.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Addy Ke <addy.ke@rock-chips.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, mporter@linaro.org, Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, wulf@rock-chips.com, Sonny Rao <sonnyrao@chromium.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Kever,

On Tue, Jul 29, 2014 at 6:34 PM, Kever Yang <kever.yang@rock-chips.com> wrote:
> rk3288 has two kind of usb controller, this add the dwc2 controller
> for otg and host1.
>
> Controller can works with usb PHY default setting and Vbus on.
>
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> ---
>  arch/arm/boot/dts/rk3288.dtsi |   20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
> index abc51f5..4309c4f 100644
> --- a/arch/arm/boot/dts/rk3288.dtsi
> +++ b/arch/arm/boot/dts/rk3288.dtsi

Maybe move the dtsi patch to the 3rd or 4th patch in the series?
Things won't work super well without patch #3, right?

Also: do you want to add a 5th patch in the series that enables the
ports like <https://chromium-review.googlesource.com/#/c/210066/>


> @@ -646,5 +646,25 @@
>                         clock-names = "baudclk", "apb_pclk";
>                         status = "disabled";
>                 };
> +
> +               usb_otg: dwc2@ff580000 {
> +                       compatible = "rockchip,rk3288-usb", "rockchip,rk3066-usb",
> +                                       "snps,dwc2";

You included the snps,dwc2 (at my request) here.  ...but you didn't
add it to the bindings (patch #1).  You should probably add it to the
bindings in the next version unless someone else thinks it shouldn't
be here.


> +                       reg = <0xff580000 0x40000>;
> +                       interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cru HCLK_OTG0>;
> +                       clock-names = "otg";
> +                       status = "disabled";
> +               };
> +
> +               usb_host1: dwc2@ff540000 {

Please sort by base address.  ...and if Heiko Acks my EHCI device tree
patches maybe rebase atop my patches to avoid merge conflicts?


> +                       compatible = "rockchip,rk3288-usb", "rockchip,rk3066-usb",
> +                                       "snps,dwc2";
> +                       reg = <0xff540000 0x40000>;
> +                       interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cru HCLK_USBHOST1>;
> +                       clock-names = "otg";
> +                       status = "disabled";
> +               };
>         };
>  };
