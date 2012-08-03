From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: <Query> How to read arguments from a gpio handle
Date: Fri, 03 Aug 2012 09:34:57 -0600
Message-ID: <501BEFA1.8030303@wwwdotorg.org>
References: <CAL1wa8fdYCmTNpO=7v5S7o-Oi3nRD_7uUgCCVpM5TEP9ZUXedw@mail.gmail.com>
 <501B6190.9060101@wwwdotorg.org>
 <CAL1wa8cJpcnNZ_p6Ueu07GQ=m2zP6MpQHKqC4dKGDFVO7zRY2w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAL1wa8cJpcnNZ_p6Ueu07GQ=m2zP6MpQHKqC4dKGDFVO7zRY2w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

On 08/03/2012 02:47 AM, Leela Krishna Amudala wrote:
> Hello,
> 
> On Fri, Aug 3, 2012 at 10:58 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>> On 08/02/2012 09:39 PM, Leela Krishna Amudala wrote:
>>> Hello,
>>>
>>> Can some one please tell me how to read the args from the gpio handle
>>>
>>> For example:
>>> Consider    lcd-reset-gpio = <&gpx0 1 2 3 4>; as my phandle.
>>>
>>> The 4 args in the above handle denotes
>>>
>>> <[phandle of the gpio controller node]
>>>       [pin number within the gpio controller]
>>>       [mux function]
>>>       [pull up/down]
>>>       [drive strength]>
>>>
>>> My intention is to read the "mux function" and "pull up/down" values
>>> from the above handle and do the corresponding operations on that
>>> particular gpio.
>>>
>>> I tried using   of_get_named_gpio_flags(struct device_node *np, const
>>> char *propname,
>>>                            int index, enum of_gpio_flags *flags);
>>> function and I always gets the flags value as '0' irrespective of the
>>> values present in phandle of GPIO.
...
> I got the required values using of_parse_phandle_with_args() function.

OK, you can certainly do that, but I fully expect pushback on such code
if you try and upstream it. Also, it's most likely fragile if your DT
property needs to represent a list of GPIOs rather than just 1, given
that of_get_named_gpio_flags() doesn't do what you'd expect.
