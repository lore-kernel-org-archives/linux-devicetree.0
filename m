From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Query on pinctrl usage for DT nodes
Date: Wed, 03 Apr 2013 10:44:38 -0600
Message-ID: <515C5C76.3080009@wwwdotorg.org>
References: <CA+V-a8uiPwsAD--OHFAE=i2ed+-wbXm4p2deZXr92+Zv6GDS1w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CA+V-a8uiPwsAD--OHFAE=i2ed+-wbXm4p2deZXr92+Zv6GDS1w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Prabhakar Lad <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, device-tree <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, LAK <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 04/03/2013 03:16 AM, Prabhakar Lad wrote:
> Hi Linus/Stephen,
> 
> I am working adding  DT nodes for DA850.
> 
> Following is the pin control snippet of da850.dtsi:-
> 
> 		pmx_core: pinmux@1c14120 {
...
>                         i2c0_pins: pinmux_i2c0_pins {
>                                 pinctrl-single,bits = <
>                                         /* I2C0_SDA,I2C0_SCL */
>                                         0x10 0x00002200 0x0000ff00
>                                 >;
>                         };
>                         mdio_pins: pinmux_mdio_pins {
>                                 pinctrl-single,bits = <
>                                         /* MDIO_CLK, MDIO_D */
>                                         0x10 0x00000088 0x000000ff
>                                 >;
>                         };
>                 }
> 
> And following is the code snippet for dts:-
> 
> 		i2c0: i2c@1c22000 {
> 			status = "okay";
> 			clock-frequency = <100000>;
> 			pinctrl-names = "default";
> 			pinctrl-0 = <&i2c0_pins>;
> 		};
> 		mdio: mdio@1e24000 {
> 			status = "okay";
> 			bus_freq = <2200000>;
> 			pinctrl-names = "default";

I assume there's also the following there:

			pinctrl-0 = <&mdio_pins>;

>               };
> 		
> But while booting I see the following boot log:-
> ...
> cpuidle: using governor menu
> TCP: cubic registered
> NET: Registered protocol family 17
> pinctrl-single 1c14120.pinmux: pin 1c14130 already requested by
> davinci_mdio.0; cannot claim for i2c_davinci.1
> pinctrl-single 1c14120.pinmux: pin-4 (i2c_davinci.1) status -22
> pinctrl-single 1c14120.pinmux: could not request pin 4 on device pinctrl-single
> console [netcon0] enabled
> ....
> 
> This is because the mdio and i2c are using same pin 0x10,

How can two devices use the same pin? I mean physically, in hardware?

Is this because pinctrl-single uses the register address as the pin
number, whereas you have registers which configure multiple pins at
once? If so, your hardware isn't something that can be represented by
pinctrl-single.

> Is there any
> alternative way to handle if the two node's are using same pins any
> pointers could be very much helpful ?
