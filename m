From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: <Query> How to read arguments from a gpio handle
Date: Thu, 02 Aug 2012 23:28:48 -0600
Message-ID: <501B6190.9060101@wwwdotorg.org>
References: <CAL1wa8fdYCmTNpO=7v5S7o-Oi3nRD_7uUgCCVpM5TEP9ZUXedw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAL1wa8fdYCmTNpO=7v5S7o-Oi3nRD_7uUgCCVpM5TEP9ZUXedw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Leela Krishna Amudala <leelakrishna.a-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/02/2012 09:39 PM, Leela Krishna Amudala wrote:
> Hello,
> 
> Can some one please tell me how to read the args from the gpio handle
> 
> For example:
> Consider    lcd-reset-gpio = <&gpx0 1 2 3 4>; as my phandle.
> 
> The 4 args in the above handle denotes
> 
> <[phandle of the gpio controller node]
>       [pin number within the gpio controller]
>       [mux function]
>       [pull up/down]
>       [drive strength]>
> 
> My intention is to read the "mux function" and "pull up/down" values
> from the above handle and do the corresponding operations on that
> particular gpio.
> 
> I tried using   of_get_named_gpio_flags(struct device_node *np, const
> char *propname,
>                            int index, enum of_gpio_flags *flags);
> function and I always gets the flags value as '0' irrespective of the
> values present in phandle of GPIO.

Perhaps the GPIO controller referenced by &gpx0 has #gpio-cells=1?

Alternatively, the GPIO controller's xlate function may simply be
setting the flags value to 0, rather than deriving the value from the
extra cells in the GPIO specifier.

Either way, the mux function, pull, and driver strength should be
represented using the pinctrl bindings not as part of the GPIO
specifier. See Documentation/devicetree/bindings/pinctrl/pinctrl.txt for
the basics.
