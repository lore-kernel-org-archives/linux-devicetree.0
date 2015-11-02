From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 1/2] usb: dwc2: optionally assert phy "full reset" when
 waking up
Date: Mon, 2 Nov 2015 08:22:08 -0800
Message-ID: <CAD=FV=XdPK8YOimepgcOfcyHf+MkuxX9jT9YhVh6FV3Snq5aUg@mail.gmail.com>
References: <1446236275-12698-1-git-send-email-dianders@chromium.org>
	<1446236275-12698-2-git-send-email-dianders@chromium.org>
	<CAL_JsqKCEC3=PmD27zZ2KMY-UwZTjoZrwnEimWOvgqLeJ6wRjg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKCEC3=PmD27zZ2KMY-UwZTjoZrwnEimWOvgqLeJ6wRjg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: John Youn <johnyoun@synopsys.com>, Felipe Balbi <balbi@ti.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, lyz <lyz@rock-chips.com>, wulf <wulf@rock-chips.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Paul Zimmerman <paulz@synopsys.com>, Gregory Herrero <gregory.herrero@intel.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux USB List <linux-usb@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Rob,

On Mon, Nov 2, 2015 at 8:12 AM, Rob Herring <robh+dt@kernel.org> wrote:
> On Fri, Oct 30, 2015 at 3:17 PM, Douglas Anderson <dianders@chromium.org> wrote:
>> From: Doug Anderson <dianders@chromium.org>
>>
>> On the rk3288 USB host-only port (the one that's not the OTG-enabled
>> port) the PHY can get into a bad state when a wakeup is asserted (not
>> just a wakeup from full system suspend but also a wakeup from
>> autosuspend).
>
> I would think re-enumerating means autosuspend is broken.

Yes, it is broken on this port.  I've been trying to figure out how to
disable autosuspend at the driver level.  Until then we can do it with
udev rules but that's much less ideal.

On our current system we have autosuispend turned off for most things
via udev and laptop-mode-tools.  ...so really the only case we see
this reset happen is if an empty hub is plugged in and then you plug
something into the hub.  The reset isn't terrible and is much better
than the device getting stuck.

You can also see the reset doing its thing if you fully suspend the
system and try to wake up from a keyboard or a mouse attached to the
port.  Being able to wake up (and then seeing a reset) is still better
than not being able to wake up.


>> We can get the PHY out of its bad state by asserting its "port reset",
>> but unfortunately that seems to assert a reset onto the USB bus so it
>> could confuse things if we don't actually deenumerate / reenumerate the
>> device.
>>
>> We can also get the PHY out of its bad state by fully resetting it using
>> the reset from the CRU (clock reset unit), which does a more full
>> reset.  The CRU-based reset appears to actually cause devices on the bus
>> to be removed and reinserted, which fixes the problem (albeit in a hacky
>> way).
>
> The reset from the CRU goes to the PHY, correct? Therefore, the
> binding should reflect that. Connecting it to the host controller is a
> hack.
>
> So describe the reset connection properly and then add a .phy_reset()
> hook to the phy subsystem. Then call that when flag property you added
> is set.

As per previous email, I disagree.  The fact that there may be more
than one reset exposed from the PHY and that there is not a tightly
coupled relationship between a PHY driver and a USB driver means that
we would need to re-invent the reset API on top of the PHY API.  In my
case I am exposing a single reset at the moment, but there may be
reasons to expose additional "PHY" resets in the future.

http://www.gossamer-threads.com/lists/linux/kernel/2289780#2289780

...using the existing reset API seems better.
