From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCHv2 1/4] Documentation: Add memory mapped ARM architected
 timer binding
Date: Mon, 15 Apr 2013 14:33:37 -0700
Message-ID: <516C7231.6060305@codeaurora.org>
References: <1365812863-5367-1-git-send-email-sboyd@codeaurora.org>
 <1365812863-5367-2-git-send-email-sboyd@codeaurora.org>
 <516C6F12.5020208@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <516C6F12.5020208-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 04/15/13 14:20, Rob Herring wrote:
> On Fri, Apr 12, 2013 at 7:27 PM, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
>> @@ -26,3 +30,52 @@ Example:
>>                              <1 10 0xf08>;
>>                 clock-frequency = <100000000>;
>>         };
>> +
>> +** Memory mapped timer node properties
>> +
>> +- compatible : Should at least contain "arm,armv7-timer-mem".
> Everything about this timer is architecturally defined? If not, let's
> use a more specific name.

I'm not sure I'm following you, but everything described here is part of
the ARM definition. What would be a more specific name?

>
>> +
>> +- clock-frequency : The frequency of the main counter, in Hz. Optional.
>> +
>> +- reg : The control frame base address.
>> +
>> +Note that #address-cells, #size-cells, and ranges shall be present to ensure
>> +the CPU can address a frame's registers.
>> +
>> +Frame:
>> +
>> +- frame-number: 0 to 7.
> I'd really like to get rid of the frame numbers and sub-nodes. Is the
> frame number significant to software?

We need the frame number to read and write registers in the control
frame (the first base in the parent node). We currently use it to
determine if a frame has support for the virtual timer by reading the
CNTTIDR (a register with 4 bits per frame describing capabilities). If
we wanted to control access to the second view of a frame we would also
need to configure the CNTPL0ACRn register that pertains to the frame
we're controlling. Without a frame number we wouldn't know which
register to write.

>
>> +- interrupts : Interrupt list for physical and virtual timers in that order.
>> +  The virtual timer interrupt is optional.
> Is that optional per frame?

Yes the virtual and physical timer interrupt is per-frame and the
virtual interrupt is optional.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
