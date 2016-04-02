From: Joachim Eastwood <manabian@gmail.com>
Subject: Re: [PATCH] ARM: dts: armv7-m: add address to unit name
Date: Sat, 2 Apr 2016 15:41:24 +0200
Message-ID: <CAGhQ9VyW4YNUGrgw1d5HBXutyBqjxP=+0ZGuYrtmnguC=MwMMA@mail.gmail.com>
References: <1459577299-2818-1-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459577299-2818-1-git-send-email-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, kernel@pengutronix.de, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 2 April 2016 at 08:08, Stefan Agner <stefan@agner.ch> wrote:
> Add address to unit name to remove the following warning:
>  Warning (unit_address_vs_reg): Node /nv-interrupt-controller has a
>  reg or ranges property, but no unit name
>
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
> Hi Arnd,
>
> Not sure through which tree this should go but an earlier patch
> seemd to be applied directly by you...
>
> --
> Stefan
>
>  arch/arm/boot/dts/armv7-m.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/armv7-m.dtsi b/arch/arm/boot/dts/armv7-m.dtsi
> index b1ad7cf..8126bec 100644
> --- a/arch/arm/boot/dts/armv7-m.dtsi
> +++ b/arch/arm/boot/dts/armv7-m.dtsi
> @@ -1,7 +1,7 @@
>  #include "skeleton.dtsi"
>
>  / {
> -       nvic: nv-interrupt-controller  {
> +       nvic: nv-interrupt-controller@0xe000e100 {

While changing the line it might be good idea to use the standard
'interrupt-controller' name instead.

I posted the same patch couple of days ago, btw.
http://marc.info/?l=devicetree&m=145929088915714&w=2


But I don't care which one that is applied.

regards,
Joachim Eastwood
