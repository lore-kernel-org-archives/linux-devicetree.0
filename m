MIME-Version: 1.0
Date: Fri, 21 Dec 2018 11:11:45 -0600
References: <cover.1544235317.git.thinhn@synopsys.com>
	<83adc98adc1760a0fad87d81d171e1dac783e7e5.1544235317.git.thinhn@synopsys.com>
	<20181218163858.GA12336@bogus>
	<30102591E157244384E984126FC3CB4F639AB1BC@us01wembx1.internal.synopsys.com>
	<CAL_JsqKiRHwRYXqJmADpRXp8zpqrPTPtgbmG8aB-2=_SW358Fw@mail.gmail.com>
	<30102591E157244384E984126FC3CB4F639AB64F@us01wembx1.internal.synopsys.com>
	<87va3ou21i.fsf@linux.intel.com>
	<30102591E157244384E984126FC3CB4F639ABA8B@us01wembx1.internal.synopsys.com>
In-Reply-To: <30102591E157244384E984126FC3CB4F639ABA8B@us01wembx1.internal.synopsys.com>
Message-ID: <CAL_JsqKkeLHtJ_6ZXwftGAxfwQmA_HcwrhnrPec2uT1fSfWrdg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] usb: dwc3: Add property snps,refclk-period-ns
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Thinh Nguyen <thinh.nguyen@synopsys.com>
Cc: Felipe Balbi <balbi@kernel.org>, Linux USB List <linux-usb@vger.kernel.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, John Youn <john.youn@synopsys.com>
List-ID: <devicetree@vger.kernel.org>

On Thu, Dec 20, 2018 at 6:22 PM Thinh Nguyen <thinh.nguyen@synopsys.com> wrote:
>
> Hi,
>
> On 12/19/2018 10:48 PM, Felipe Balbi wrote:
> > Hi,
> >
> > Thinh Nguyen <thinh.nguyen@synopsys.com> writes:
> >>>> On 12/18/2018 8:39 AM, Rob Herring wrote:
> >>>>> On Fri, Dec 07, 2018 at 06:27:30PM -0800, Thinh Nguyen wrote:
> >>>>>> This patch introduces property "snps,refclk-period-ns" to inform the
> >>>>>> controller of the reference clock period. If the reference clock period
> >>>>>> is different from the default Core Consultant setting, then this
> >>>>>> property can be set to the reference clock period.
> >>>>>>
> >>>>>> This property does not control the reference clock rate. The controller
> >>>>>> uses this value to perform internal timing calculations that are based
> >>>>>> on the reference clock.
> >>>>>>
> >>>>>> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
> >>>>>> ---
> >>>>>> Changes in v2:
> >>>>>> - Split from "usb: dwc3: Add reference clock properties"
> >>>>>> - Revise commit message and property description
> >>>>>>
> >>>>>>  Documentation/devicetree/bindings/usb/dwc3.txt | 2 ++
> >>>>>>  1 file changed, 2 insertions(+)
> >>>>>>
> >>>>>> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
> >>>>>> index 8e5265e9f658..b7e67edff9b2 100644
> >>>>>> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> >>>>>> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> >>>>>> @@ -99,6 +99,8 @@ Optional properties:
> >>>>>>                      this and tx-thr-num-pkt-prd to a valid, non-zero value
> >>>>>>                      1-16 (DWC_usb31 programming guide section 1.2.3) to
> >>>>>>                      enable periodic ESS TX threshold.
> >>>>>> + - snps,refclk-period-ns: if set, this value informs the controller of the
> >>>>>> +                    reference clock period in nanoseconds.
> >>>>> Shouldn't you be able to retrieve the refclk frequency and then
> >>>>> calculate the period?
> >>>> The thing is we cannot determine the ref_clk frequency for some devices
> >>>> that don't specify their clocks. So I think we should have an option to
> >>>> inform the controller of the ref_clk period for those devices.
> >>> Specifying the clock should be mandatory (if you want/need this
> >>> feature). It just requires a fixed-clock node at a minimum.
> >> Depending on the design of the controller, the ref_clk frequency is not
> >> something that the OS can read/control. So we cannot make it mandatory
> >> for every device to have a clock node.
> > We can make it mandatory to everyone who wants to use the feature. It's
> > no different than making snps,refclk-period-ns mandatory to everyone who
> > wants to use the feature you're introducing.
> >
>
> But not every design has access to the clock with an actual address for
> the OS to read. Only the developers will know the frequency of the
> ref_clk, and they can inform the controller via this property.

Then you use the flxed-clock binding.

Rob
