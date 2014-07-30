From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/4] Documentation: dt-bindings: add dt binding info for
 Rockchip dwc2
Date: Wed, 30 Jul 2014 08:46:52 -0700
Message-ID: <CAD=FV=X2ZZkK=18T=c40a3ZkwaoDk5Vf0hCir_OdC7r888hwUw@mail.gmail.com>
References: <1406683873-18194-1-git-send-email-kever.yang@rock-chips.com>
 <1406683873-18194-2-git-send-email-kever.yang@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1406683873-18194-2-git-send-email-kever.yang@rock-chips.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Randy Dunlap <rdunlap@infradead.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Jianqun Xu <xjq@rock-chips.com>, Russell King <linux@arm.linux.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, Kishon Vijay Abraham I <kishon@ti.com>, lyz <lyz@rock-chips.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Addy Ke <addy.ke@rock-chips.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Matt Porter <mporter@linaro.org>, Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, wulf <wulf@rock-chips.com>, Sonny Rao <sonnyrao@chromium.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Kever,

On Tue, Jul 29, 2014 at 6:31 PM, Kever Yang <kever.yang@rock-chips.com> wrote:
> This add necessary dwc2 binding documentation for Rockchip socs:
> rk3066, rk3188 and rk3288
>
> add dr_mode as optional properties.
>
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> ---
>  Documentation/devicetree/bindings/usb/dwc2.txt |    5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
> index aa91034..eb80d7b 100644
> --- a/Documentation/devicetree/bindings/usb/dwc2.txt
> +++ b/Documentation/devicetree/bindings/usb/dwc2.txt
> @@ -4,6 +4,9 @@ Platform DesignWare HS OTG USB 2.0 controller
>  Required properties:
>  - compatible : One of:
>    - brcm,bcm2835-usb: The DWC2 USB controller instance in the BCM2835 SoC.
> +  - rockchip,rk3066-usb: The DWC2 USB controller instance in the rk3066 Soc;
> +  - "rockchip,rk3188-usb","rockchip,rk3066-usb": for rk3188 Soc;
> +  - "rockchip,rk3288-usb","rockchip,rk3066-usb": for rk3288 Soc;
>    - snps,dwc2: A generic DWC2 USB controller with default parameters.
>  - reg : Should contain 1 register range (address and length)
>  - interrupts : Should contain 1 interrupt
> @@ -15,6 +18,8 @@ Optional properties:
>  - phys: phy provider specifier
>  - phy-names: shall be "usb2-phy"
>  Refer to phy/phy-bindings.txt for generic phy consumer properties
> +- dr_mode: shall be one of "host", "peripheral" and "otg"
> +  Refer to usb/generic.txt

One other note: Maybe we should break this series into two different
patch series'.  I think that the patches for doing "dr_mode" can be
totally separate from the ones adding support for rockchip, right?

-Doug
