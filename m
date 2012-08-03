From: Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: <Query> How to read arguments from a gpio handle
Date: Fri, 03 Aug 2012 06:40:03 +0200
Message-ID: <501B5623.7050209@gmail.com>
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

Hi,

On 03.08.2012 05:39, Leela Krishna Amudala wrote:
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
> 
> If somebody knows how to parse those values please throw some pointers on this.

The mux functions, pull-up/down and driver strength are not part of the
GPIO spec but belong the the pinctrl driver. The mux of the pin you are
using has to be configured to GPIO of course, but how that is done and
all other details is not something the GPIO chip driver is in charge for,

of_get_named_gpio_flags() is the right funtion to use, and the flags are
currently only used to denote whether a pin is considered inverted. See
of_gpio_flags in include/linux/of_gpio.h.


HTH,
Daniel
