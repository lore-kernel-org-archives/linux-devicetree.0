From: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/3] dts: Updated devicetree bindings for Zynq 7000
 platform
Date: Wed, 14 Oct 2015 09:03:23 +0200
Message-ID: <561DFE3B.80901@xilinx.com>
References: <1444344307-22509-1-git-send-email-moritz.fischer@ettus.com>
 <1444344307-22509-3-git-send-email-moritz.fischer@ettus.com>
 <561B7E3C.4060908@xilinx.com>
 <CAAtXAHfRt-6+Hs=DTUDg1_2vxHo213ut_DWgH8Uq2xMuRp+e_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAtXAHfRt-6+Hs=DTUDg1_2vxHo213ut_DWgH8Uq2xMuRp+e_A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: =?UTF-8?Q?S=c3=b6ren_Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org" <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/14/2015 04:50 AM, Moritz Fischer wrote:
> Hi Michal,
> 
> On Mon, Oct 12, 2015 at 2:32 AM, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
>> On 10/09/2015 12:45 AM, Moritz Fischer wrote:
>>> Added addtional bindings required for FPGA Manager operation
>>> of the Xilinx Zynq Devc configuration interface.
>>>
>>> Signed-off-by: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
>>> ---
>>>  arch/arm/boot/dts/zynq-7000.dtsi | 5 +++++
>>>  1 file changed, 5 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zynq-7000.dtsi
>>> index dc0457e..1a5220e 100644
>>> --- a/arch/arm/boot/dts/zynq-7000.dtsi
>>> +++ b/arch/arm/boot/dts/zynq-7000.dtsi
>>> @@ -294,6 +294,11 @@
>>>               devcfg: devcfg@f8007000 {
>>>                       compatible = "xlnx,zynq-devcfg-1.0";
>>>                       reg = <0xf8007000 0x100>;
>>> +                     interrupt-parent = <&intc>;
>>> +                     interrupts = <0 8 4>;
>>> +                     clocks = <&clkc 12>;
>>> +                     clock-names = "ref_clk";
>>> +                     syscon = <&slcr>;
>>>               };
>>>
>>>               global_timer: timer@f8f00200 {
>>>
>>
>> This patch should go via arm-soc tree. That's why please remove it from
>> this patchset.
> 
> Just to clarify, you want this as a separate patch?

yes when binding is ACKed.

Thanks,
Michal


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
