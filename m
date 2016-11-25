From: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: Question regarding clocks in the DW-HDMI DT bindings
Date: Fri, 25 Nov 2016 10:56:53 +0800
Message-ID: <0bd7dab3-b51c-2c88-dacf-24ba588349bc@rock-chips.com>
References: <2778019.JJI4Lz6scm@avalon>
 <CAOMZO5CZ-c=1zos=6ovY9Tfkz-UeUq0c1sUQ_Fa8t-TjW6k6hw@mail.gmail.com>
 <831329ae-1c16-07ba-3eca-95f6ff8dbae2@mentor.com> <4461318.dYHS3nW9CP@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4461318.dYHS3nW9CP@avalon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: DRI mailing list <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-cGfAhawkTDLHbOjZJNBcug@public.gmane.org>, nickey.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi:


On 2016年11月25日 07:26, Laurent Pinchart wrote:
> Hello Fabio and Vladimir,
>
> Thank you for your quick responses.
>
> On Friday 25 Nov 2016 00:16:00 Vladimir Zapolskiy wrote:
>> On 11/25/2016 12:07 AM, Fabio Estevam wrote:
>>> On Thu, Nov 24, 2016 at 7:16 PM, Laurent Pinchart wrote:
>>>> Hi Andy,
>>>>
>>>> As the author of the DW-HDMI DT bindings this question is addressed to
>>>> you, but information from anyone is more than welcome.
>>>>
>>>> The DT bindings specify two clocks named "iahb" and "isfr" but don't
>>>> describe them. While I assume that the "isfr" clock corresponds to the
>>>> "isfrclk" input signal of the DW HDMI, there is no "iahb" clock
>>>> described in the IP core datasheet.
>>> i.MX6Q has a DW-HDMI IP block.
>>>
>>> The names in the devicetree binding matches the ones listed at the
>>> i.MX6Q Reference Manual - Table 33-1. HDMI Clocks
>> correct, for your convenience the table is copied below:
>>
>> Clock name |     Clock Root     | Description
>> -----------+--------------------+---------------------------------------
>>     iahbclk  | ahb_clk_root       | Bus clock
>>     icecclk  | ckil_sync_clk_root | CEC low-frequency clock (32kHZ)
>>     ihclk    | ahb_clk_root       | Module clock
>>     isfrclk  | video_27m_clk_root | Internal SFR clock (video clock 27MHz)
>>
>> Here AHB stands for ARM Advanced High-performance Bus.
> That's what I suspected. I believe the "iahb" name is wrong, as the DW HDMI TX
> IP core clearly documents the bus clock as being called "iapbclk". We could
> rename that in the DT bindings (with compatibility code in the driver to keep
> supporting the old name) but it might not be worth it. The bindings should
> however document that the "iahb" clock is the IP core's "iapbclk" bus clock.


     I got the clock name from I.MX6Q TRM, I also checked the name again 
with Rockchip IC design team now, hope to get some new information soon.
>
> Another question I have about the bus clock (CC'ing the devicetree mailing
> list as well as the clock maintainers) is whether it should be made optional.
> The clock is obviously mandatory from a hardware point of view (given that APB
> is a synchronous bus and thus requires a clock), but in some SoCs
> (specifically for the Renesas SoCs) that clock is always on and can't be
> controlled. We already omit bus clocks in DT for most IP cores when the clock
> can never be controlled (and we also omit a bunch of other clocks that we
> don't even know exist), so it could make sense to make the clock optional.
> Otherwise there would be runtime overhead trying to handle a clock that can't
> be controlled.

     If this is the case on Renesas SOCs, we can consider make the clock 
as optional. Or move all the clock operations to platform specific 
code(dw_hdmi-rockchip.c/dw_hdmi-imx.c)?

>> By the way while we're discussing DW HDMI bindings specific to iMX,
>> I would recommend to remove utterly hackish and iMX only "gpr"
>> property from the example in bindings/display/bridge/dw_hdmi.txt


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
