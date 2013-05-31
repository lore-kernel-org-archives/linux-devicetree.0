From: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: ux500: register LP5521 LEDs in the device tree
Date: Fri, 31 May 2013 10:37:08 -0700
Message-ID: <CAK5ve-+oJL0fbtM=5xRSBjCztX1fP-fcwUvZurnj42hiXR5X+Q@mail.gmail.com>
References: <1369210331-18545-1-git-send-email-linus.walleij@stericsson.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1369210331-18545-1-git-send-email-linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>
Cc: Milo Kim <Milo.Kim-l0cyMroinI0@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Gabriel Fernandez <gabriel.fernandez.st-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 22, 2013 at 1:12 AM, Linus Walleij
<linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org> wrote:
> From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
> Based on pending device tree support in the LP55xx drivers
> we can add the correct LED and channel configuration from the
> ux500 device tree for all HREF variants.
>
> Cc: Milo Kim <Milo.Kim-l0cyMroinI0@public.gmane.org>
> Cc: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  arch/arm/boot/dts/href.dtsi | 38 ++++++++++++++++++++++++++++++++------
>  1 file changed, 32 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm/boot/dts/href.dtsi b/arch/arm/boot/dts/href.dtsi
> index 62523f6..e315429 100644
> --- a/arch/arm/boot/dts/href.dtsi
> +++ b/arch/arm/boot/dts/href.dtsi
> @@ -63,16 +63,42 @@
>                 };
>
>                 i2c@80128000 {
> -                       lp5521@0x33 {
> -                               compatible = "lp5521";
> +                       lp5521@33 {

Is this right, I guess it should be still "lp5521@0x33", although it's
just a name.

-Bryan

> +                               compatible = "national,lp5521";
>                                 reg = <0x33>;
> +                               label = "lp5521_pri";
> +                               clock-mode = /bits/ 8 <2>;
> +                               chan0 {
> +                                       led-cur = /bits/ 8 <0x2f>;
> +                                       max-cur = /bits/ 8 <0x5f>;
> +                               };
> +                               chan1 {
> +                                       led-cur = /bits/ 8 <0x2f>;
> +                                       max-cur = /bits/ 8 <0x5f>;
> +                               };
> +                               chan2 {
> +                                       led-cur = /bits/ 8 <0x2f>;
> +                                       max-cur = /bits/ 8 <0x5f>;
> +                               };
>                         };
> -
> -                       lp5521@0x34 {
> -                               compatible = "lp5521";
> +                       lp5521@34 {
> +                               compatible = "national,lp5521";
>                                 reg = <0x34>;
> +                               label = "lp5521_sec";
> +                               clock-mode = /bits/ 8 <2>;
> +                               chan0 {
> +                                       led-cur = /bits/ 8 <0x2f>;
> +                                       max-cur = /bits/ 8 <0x5f>;
> +                               };
> +                               chan1 {
> +                                       led-cur = /bits/ 8 <0x2f>;
> +                                       max-cur = /bits/ 8 <0x5f>;
> +                               };
> +                               chan2 {
> +                                       led-cur = /bits/ 8 <0x2f>;
> +                                       max-cur = /bits/ 8 <0x5f>;
> +                               };
>                         };
> -
>                         bh1780@0x29 {
>                                 compatible = "rohm,bh1780gli";
>                                 reg = <0x33>;
> --
> 1.7.11.3
>
