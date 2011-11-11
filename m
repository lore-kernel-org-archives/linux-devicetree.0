From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mach-ux500: add devicetree compat nodes
Date: Fri, 11 Nov 2011 10:13:26 -0600
Message-ID: <4EBD49A6.2020306@gmail.com>
References: <1321023902-18870-1-git-send-email-niklas.hernaeus@linaro.org>
 <4EBD3C85.1010508@gmail.com>
 <CACRpkda-9OVP8E1qO3Nc5znw_v7cKFiv8T5HHwTCnY2C9Fg7iA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CACRpkda-9OVP8E1qO3Nc5znw_v7cKFiv8T5HHwTCnY2C9Fg7iA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Nicolas.Pitre.nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant.Likely.grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/11/2011 09:59 AM, Linus Walleij wrote:
> On Fri, Nov 11, 2011 at 4:17 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 
>>>  MACHINE_START(U8500, "ST-Ericsson MOP500 platform")
>>>       /* Maintainer: Srinidhi Kasagar <srinidhi.kasagar-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org> */
>>>       .boot_params    = 0x100,
>>> @@ -651,6 +666,7 @@ MACHINE_START(U8500, "ST-Ericsson MOP500 platform")
>>>       /* we re-use nomadik timer here */
>>>       .timer          = &ux500_timer,
>>>       .init_machine   = mop500_init_machine,
>>> +     .dt_compat      = mop500_dt_board_compat,
>>>  MACHINE_END
>>>
>>>  MACHINE_START(HREFV60, "ST-Ericsson U8500 Platform HREFv60+")
>>> @@ -659,6 +675,7 @@ MACHINE_START(HREFV60, "ST-Ericsson U8500 Platform HREFv60+")
>>>       .init_irq       = ux500_init_irq,
>>>       .timer          = &ux500_timer,
>>>       .init_machine   = mop500_init_machine,
>>> +     .dt_compat      = hrefv60_dt_board_compat,
>>>  MACHINE_END
>>>
>>>  MACHINE_START(SNOWBALL, "Calao Systems Snowball platform")
>>> @@ -668,4 +685,5 @@ MACHINE_START(SNOWBALL, "Calao Systems Snowball platform")
>>>       /* we re-use nomadik timer here */
>>>       .timer          = &ux500_timer,
>>>       .init_machine   = mop500_init_machine,
>>> +     .dt_compat      = snowball_dt_board_compat,
>>>  MACHINE_END
>>
>> These all look very similar and should be combined. Why do you not have
>> 1 machine for all DT platforms as other SOCs are doing?
> 
> This needs to be rebased for the latest kernel.
> Which looks like this:
> 
> MACHINE_START(U8500, "ST-Ericsson MOP500 platform")
>         /* Maintainer: Srinidhi Kasagar <srinidhi.kasagar-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org> */
>         .atag_offset    = 0x100,
>         .map_io         = u8500_map_io,
>         .init_irq       = ux500_init_irq,
>         /* we re-use nomadik timer here */
>         .timer          = &ux500_timer,
>         .init_machine   = mop500_init_machine,
> MACHINE_END
> 
> MACHINE_START(HREFV60, "ST-Ericsson U8500 Platform HREFv60+")
>         .atag_offset    = 0x100,
>         .map_io         = u8500_map_io,
>         .init_irq       = ux500_init_irq,
>         .timer          = &ux500_timer,
>         .init_machine   = hrefv60_init_machine,
> MACHINE_END
> 
> MACHINE_START(SNOWBALL, "Calao Systems Snowball platform")
>         .atag_offset    = 0x100,
>         .map_io         = u8500_map_io,
>         .init_irq       = ux500_init_irq,
>         /* we re-use nomadik timer here */
>         .timer          = &ux500_timer,
>         .init_machine   = snowball_init_machine,
> MACHINE_END
> 
> So - different .init_machine() calls, needed to simplify the board
> files as of now. (Patch from Lee Jones.)
> 

But ultimately I would expect that the init_machine calls to be the same
with a DT based machine. This goes back to do we add DT to existing
boards or create a new clean DT machine and add to it as boards are
converted?

Rob
