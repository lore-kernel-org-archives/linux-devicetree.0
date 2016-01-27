From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3] pstore-ram: add Device Tree bindings
Date: Wed, 27 Jan 2016 11:31:49 -0600
Message-ID: <CAL_JsqLVsBh8yu7bB_c2MPo8yHRG4ZpCzBqM5X1F31xpURwnag@mail.gmail.com>
References: <1452210056-14436-1-git-send-email-ghackmann@google.com> <20160127104440.GC17933@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160127104440.GC17933@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>
Cc: Greg Hackmann <ghackmann@google.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Kees Cook <keescook@chromium.org>, Tony Luck <tony.luck@intel.com>, John Stultz <john.stultz@linaro.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 27, 2016 at 4:44 AM, Markus Pargmann <mpa@pengutronix.de> wrote:
> Hi,
>
> sorry for the late response.
>
> On Thu, Jan 07, 2016 at 03:40:56PM -0800, Greg Hackmann wrote:
>> ramoops is one of the remaining places where ARM vendors still rely on
>> board-specific shims.  Device Tree lets us replace those shims with
>> generic code.
>>
>> These bindings mirror the ramoops module parameters, with two small
>> differences:
>>
>> (1) dump_oops becomes an optional "no-dump-oops" property, since ramoops
>>     sets dump_oops=1 by default.
>>
>> (2) mem_type=1 becomes the more self-explanatory "unbuffered" property.
>
> I thought about the same patch at the end of last year but decided
> against this for several reasons.
>
> 1) ramoops is a memory region, not hardware or any hardware description.

Yes, but...

> 2) A suitable location for the ramoops depends on many factors. It is
> not restricted to a specific board. For example the boot ROM of a SoC
> may work differently for different boot mechanisms (usb, nand, SD-Card,
> ...) and may by accident overwrite the ramoops area given in the
> devicetree.

How RAM is used is a hardware constraint especially when the bootROM
can't be changed.

> 3) Different bootloaders use the available memory differently which may
> conflict with the definition in the devicetree and some data is placed
> in memory before the devicetree is even accessible, for example if we
> are running in sram before switching to a bootloader running in sdram.

Then the bootloader would need to update the default location.

> These were the reasons why I decided to implement ramoops support in
> the bootloader instead. The bootloader is the component that has
> knowledge about used memory and it can inform other system components
> (kernel) about the ramoops area. This way the ramoops area can be set
> where it is not overwritten by any other component.

That is fine. I could imagine wanting to read the ramoops in the
bootloader as well.

Your questioning is really about when you configure ramoops, not how.
I assume the how in your case is using the kernel command line.
Putting ramoops in DT is just the how it is communicated to the
kernel, not the when. The bootloader could just as easily setup the
ramoops node in DT rather than statically defining it in the dts. We
already have various properties that can be passed either way
(console, memory, CMA size, etc.) and are frequently setup by the
bootloader.

Also, the kernel command line should override whatever is in DT, so
your use would still work even if the DT had ramoops entry.

Rob
