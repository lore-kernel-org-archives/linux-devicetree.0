From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 4/5] gpio: of: Add support to have multiple gpios in
 gpio-hog
Date: Wed, 9 Mar 2016 10:17:29 -0700
Message-ID: <56E05AA9.8000503@wwwdotorg.org>
References: <1457438528-29054-1-git-send-email-ldewangan@nvidia.com>
 <1457438528-29054-5-git-send-email-ldewangan@nvidia.com>
 <20160309062849.GB10454@pengutronix.de> <56E02335.6020901@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56E02335.6020901-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 03/09/2016 06:20 AM, Laxman Dewangan wrote:
>
> On Wednesday 09 March 2016 11:58 AM, Markus Pargmann wrote:
>> * PGP Signed by an unknown key
>>
>> Hi,
>>
>> On Tue, Mar 08, 2016 at 05:32:07PM +0530, Laxman Dewangan wrote:
>>> The child node for gpio hogs under gpio controller's node
>>> provide the mechanism to automatic GPIO request and
>>> configuration as part of the gpio-controller's driver
>>> probe function.
>>>
>>> Currently, property "gpio" takes one gpios for such
>>> configuration. Add support to have multiple GPIOs in
>>> this property so that multiple GPIOs of gpio-controller
>>> can be configured by this mechanism with one child node.
>> So if I read this correctly you want to have multiple GPIOs with the
>> same line name? Why don't you use multiple child nodes with individual
>> line names?
>>
> There is cases on which particular functional configuration needs sets
> of GPIO to set. On this case, making sub node for each GPIOs creates
> lots of sub-nodes and  add complexity on readability, usability and
> maintainability.
> Example: for my board, I wanted to set GPIO H2 to input and H0 and H1 to
> be output high.
> Instead of three nodes, I can have two here:
>         gpio@0,6000d000 {
>                 wlan_input {
>                         gpio-hog;
>                         gpios = <TEGRA_GPIO(H, 2) 0>;
>                         input;
>                 };
>
>                 wlan_output {
>                         gpio-hog;
>                         gpios = <TEGRA_GPIO(H, 0) 0 TEGRA_GPIO(H, 1) 0>;
>                         output-high;
>                 };
>         };
 >
> So here I am grouping the multiple output GPIO together.
>
> This looks much similar if we have many GPIOs for one type of
> configurations.
>
> Even it looks better if we have something:
>         gpio@0,6000d000 {
>                 wlan_control {
>                         gpio-hog;
>                         gpios-input = <TEGRA_GPIO(H, 2) 0>;
>                         gpios-output-high = <TEGRA_GPIO(H, 0) 0
> TEGRA_GPIO(H, 1) 0>;
>                 };
>         };

The problem with that is the description used when acquiring the GPIO is 
just "wlan_input", "wlan_output", or "wlan_control". There's nothing to 
indicate what those individual pins do (perhaps one is a reset signal, 
one is a regulator enable, etc.?) By requiring separate nodes for each 
GPIO, then the node name can provide a meaningful semantic 
name/description for each GPIO, which provides much more information.

If the approach in this patch is acceptable though, I think you want to 
update the description of "gpios" (in the GPIO hog definition section) 
in Documentation/devicetree/bindings/gpio/gpio.txt to mention that 
multiple GPIO entries are legal. Right now it says that property much 
contain exactly #gpio-cells, not a multiple of #gpio-cells.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
