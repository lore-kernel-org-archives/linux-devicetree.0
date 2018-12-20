MIME-Version: 1.0
Date: Thu, 20 Dec 2018 09:19:28 -0600
References: <cover.1544235317.git.thinhn@synopsys.com>
	<a156d9779fe56ea7b5cc628c90b52d0162b5ae68.1544235317.git.thinhn@synopsys.com>
	<20181218164128.GA14552@bogus>
	<87sgysu1uc.fsf@linux.intel.com>
In-Reply-To: <87sgysu1uc.fsf@linux.intel.com>
Message-ID: <CAL_JsqKVfRM1n4OqM+==ZBtNOcDr8dz4yYC8h56HfmYZHBjk-w@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] usb: dwc3: Add property snps,enable-refclk-sof
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Felipe Balbi <balbi@kernel.org>
Cc: Thinh Nguyen <thinh.nguyen@synopsys.com>, Linux USB List <linux-usb@vger.kernel.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, John Youn <john.youn@synopsys.com>
List-ID: <devicetree@vger.kernel.org>

On Thu, Dec 20, 2018 at 12:52 AM Felipe Balbi <balbi@kernel.org> wrote:
>
>
> Hi,
>
> Rob Herring <robh@kernel.org> writes:
> > On Fri, Dec 07, 2018 at 06:27:43PM -0800, Thinh Nguyen wrote:
> >> This patch adds a property to enable the controller to track the
> >> frame number based on the reference clock.
> >>
> >> When operating in USB 2.0 mode, the peripheral controller uses the USB2
> >> PHY clocks to track the frame number. This prevents the controller from
> >> suspending the USB2 PHY when the device goes into low power. Version
> >> 1.80a of the DWC_usb31 peripheral controller introduces a way to track
> >> frame number based on the reference clock instead. This feature allows
> >> the controller to suspend the USB2 PHY when the device goes into low
> >> power. This improves power saving for devices that have isochronous
> >> endpoints.
> >>
> >> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
> >> ---
> >> Changes in v2:
> >> - Revise property description
> >> - Rename property from snps,enable-refclk-lpm to snps,enable-refclk-sof
> >>
> >>  Documentation/devicetree/bindings/usb/dwc3.txt | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
> >> index b7e67edff9b2..01b948fff0eb 100644
> >> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> >> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> >> @@ -101,6 +101,9 @@ Optional properties:
> >>                      enable periodic ESS TX threshold.
> >>   - snps,refclk-period-ns: if set, this value informs the controller of the
> >>                      reference clock period in nanoseconds.
> >> + - snps,enable-refclk-sof: set to enable reference clock based frame number
> >> +                    tracking while in low power, allowing the controller to
> >> +                    suspend the PHY during low power states.
> >
> > This should be implied by the compatible string.
>
> Two problems with this:
>
> 1) Won't work for PCI-based systems

For PCI, you would decide this based on VID/PID, wouldn't you?
Compatible is basically equivalent to that.

> 2) If we start having many users of this we will end up with:
>
>         if (of_device_is_compatible("a") ||
>                 of_device_is_compatible("b") ||
>                 of_device_is_compatible("c") ||
>                 of_device_is_compatible("d") ||
>                 ...)
>                 foo();
>
> Conversely, if we just pass a flag, this branch will never change. We
> won't need changes to the kernel because a new platform needing refclk
> based frame number tracking is, now, supported upstream.

Things are implied based on compatible frequently and this is not how
the code ends up looking like. Normally, match data would have the
flag setting and that variable will get passed to whatever needs it.

USB blocks and their integration quirks are complicated enough that
I'm not really worried about needing to update the kernel for a new
platform. If a new platform is so similar to an existing one, then a
fallback compatible can be used and the kernel doesn't need a change.

A property like this makes more sense when it is board-specific, not
SoC specific. I may be wrong, but this looked more like a SoC
integration decision than board level.

Rob
