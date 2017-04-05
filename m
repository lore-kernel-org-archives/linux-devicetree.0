From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/3] clk: vc5: Add structure to describe particular
 chip features
Date: Wed, 5 Apr 2017 16:20:07 +0200
Message-ID: <23dd9324-ee97-633d-129e-6063af757f47@gmail.com>
References: <1491392819-698-1-git-send-email-alexey_firago@mentor.com>
 <1491392819-698-2-git-send-email-alexey_firago@mentor.com>
 <CAMuHMdXEa=1__WMtsRphKbN6h+jVkP7szudENsM3hvGSzDfbwg@mail.gmail.com>
 <de978809-5bec-d675-1ea3-cc61804e2c61@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <de978809-5bec-d675-1ea3-cc61804e2c61-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexey Firago <alexey_firago-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 04/05/2017 02:36 PM, Alexey Firago wrote:
> Hi Geert,
> 
> On 05.04.2017 15:15, Geert Uytterhoeven wrote:
>> Hi Alexey,
>>
>> On Wed, Apr 5, 2017 at 1:46 PM, Alexey Firago
>> <alexey_firago-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org> wrote:
>>> Introduce vc5_chip_info structure to describe features of a particular
>>> VC5 chip (id, number of FODs, number of outputs, flags).
>>> For now flags are only used to indicate if chip has internal XTAL.
>>> vc5_chip_info is set on probe from the matched of_device_id->data.
>>>
>>> Also add defines to specify maximum number of FODs and clock outputs
>>> supported by the driver.
>>>
>>> With these changes it should be easier to extend driver to support
>>> more VC5 models.
>>>
>>> Signed-off-by: Alexey Firago <alexey_firago-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
>>
>> Thanks for your patch!
>>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
>>
>>> --- a/drivers/clk/clk-versaclock5.c
>>> +++ b/drivers/clk/clk-versaclock5.c
>>> @@ -113,12 +113,30 @@
>>>  #define VC5_MUX_IN_XIN         BIT(0)
>>>  #define VC5_MUX_IN_CLKIN       BIT(1)
>>>
>>> +/* Maximum number of clk_out supported by this driver */
>>> +#define VC5_MAX_CLK_OUT_NUM    3
>>> +
>>> +/* Maximum number of FODs supported by this driver */
>>> +#define VC5_MAX_FOD_NUM        2
>>> +
>>> +/* flags to describe chip features */
>>> +/* chip has built-in oscilator */
>>> +#define VC5_HAS_INTERNAL_XTAL  BIT(0)
>>
>> VC5_HAS_INTERNAL_OSC?
> 
> I'm fine with renaming it, but shouldn't it be consistent with the rest
> of the driver (see "internal-xtal", VC5_XTAL*, etc) and IDT datasheet?
> 

Do you have one with internal ring oscillator or with internal xtal ?
The one I had has internal xtal according to the datasheet.

-- 
Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
