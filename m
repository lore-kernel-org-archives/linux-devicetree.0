Return-Path: <atull@opensource.altera.com>
Message-ID: <53EA6830.1010600@opensource.altera.com>
Date: Tue, 12 Aug 2014 14:17:04 -0500
From: Alan Tull <atull@opensource.altera.com>
MIME-Version: 1.0
Subject: Re: [RFC PATCH 1/3] fpga manager framework core
References: <1406843944-7780-1-git-send-email-atull@opensource.altera.com> <1406843944-7780-2-git-send-email-atull@opensource.altera.com> <CAL_JsqLBfjNrphkLF95v==4+4VRNn-bht+kruMpPMyEKCyQcBA@mail.gmail.com>
In-Reply-To: <CAL_JsqLBfjNrphkLF95v==4+4VRNn-bht+kruMpPMyEKCyQcBA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
To: Rob Herring <robherring2@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "H. Peter Anvin  <hpa@zytor.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jason Gunthorpe" <jgunthorpe@obsidianresearch.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pavel Machek <pavel@denx.de>, Mark Brown <broonie@kernel.org>, Philip Balister <philip@balister.org>, "Alessandro Rubini  <rubini@gnudd.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Jason Cooper" <jason@lakedaemon.net>, Kyle Teske <kyle.teske@ni.com>, "Nicolas Pitre  <nico@linaro.org>, Felipe Balbi <balbi@ti.com>, Mauro Carvalho Chehab" <m.chehab@samsung.com>, David Brown <davidb@codeaurora.org>, Rob Landley <rob@landley.net>, "David S. Miller" <davem@davemloft.net>, Joe Perches <joe@perches.com>, Cesar Eduardo Barros <cesarb@cesarb.net>, Samuel Ortiz <sameo@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, "Michal Simek  <monstr@monstr.eu>, Michal Simek <michal.simek@xilinx.com>, Alan Tull" <delicious.quinoa@gmail.com>, Dinh Nguyen <dinguyen@opensource.altera.com>, Yves Vandervennet <yvanderv@opensource.altera.com>
List-ID: <devicetree@vger.kernel.org>


On 08/08/2014 04:16 PM, Rob Herring wrote:
> On Thu, Jul 31, 2014 at 4:59 PM, Alan Tull <atull@opensource.altera.com> wrote:
>> This core exports methods of doing operations on FPGAs.
> I'm sticking to some high-level comments for the moment...
>
>> EXPORT_SYMBOL_GPL(fpga_mgr_write);
>>   Write FPGA given a buffer and count.
>>
>> EXPORT_SYMBOL_GPL(fpga_mgr_firmware_write);
>>   Request firmware and write that to a fpga
>>
>> EXPORT_SYMBOL_GPL(fpga_mgr_status_get);
>>   Get a status string, including failure information
>>
>> EXPORT_SYMBOL_GPL(fpga_mgr_name);
>>   Get name of FPGA manager
>>
>> EXPORT_SYMBOL_GPL(register_fpga_manager);
>> EXPORT_SYMBOL_GPL(remove_fpga_manager);
>>   Register/unregister low level fpga driver
> I understand these 2 being for low-level drivers, but ...
>
>> All userspace interfaces are in separate files so that
>> they can be compiled out on production builds where
>> appropriate.
> How do you envision the other functions to be used besides by
> userspace? 

fpga_mgr_firmware_write() can by used in a driver's probe function.  Not much more complicated than the current firmware interface.  It requires one other function - of_fpga_mgr_dev_lookup() which is in the third patch, should move it to the core patch probably.  Eliminating the error checking, a driver probe could add this:

struct device_node *np = pdev->dev.of_node;

/* find the fpga pointed to by this driver's 'fpgamgr' device tree property */
struct fpga_manager *mgr = of_fpga_mgr_dev_lookup(np, "fpgamgr", &ret);

/* request the bitstream file from firmware layer and write it to fpga */
fpga_mgr_firmware_write(mgr, "driver-fpga-image.rbf");

/* then enable the fpga bridges */

Also these low level functions can be used by various interfaces that could put programming in userspace control.  My two main points for this set of patches are: separating the kernel core stuff from the interface, and enabling DT control.  So I want to have enough here that any higher level interface will have what it needs.

> Automatically loading bit files embedded in your DT?

Yes.  There's an example device tree fragment in the third patch.   Usually multiple soft ip blocks are included in a single fpga image, so the example in the third patch has the device drivers one level below the fpga manager bus (the example only shows one gpio driver).  The fpga image will get loaded, then the drivers get probed due to Pantelis's dynamic DT code.

The fpga bus adds two DT properties: 'fpgamgr' and 'fpga-firmware' properties.  The 'fpgamgr' property is the phandle for the fpga to load (so multiple fpgas are supported, but not hard coded anywhere).  The 'fpga-firmware' property is the name of the firmware file to load.

The part I want to add to the next version is enabling bridges, which has to happen between loading the fpga image and probing the drivers.

>> Signed-off-by: Alan Tull <atull@opensource.altera.com>
> [...]
>
>> +const char *state_str[] = {
>> +       "default",
>> +       "firmware_request",
>> +       "write_init",
>> +       "write",
>> +       "write_complete",
>> +       "write_success",
>> +       "read_init",
>> +       "read",
>> +       "read_complete",
>> +       "read_done",
>> +};
>> +
>> +/*
>> + * Provide status as: [state] [fail] [busy] such as
>> + *  'firmware_request fail' = failed to load firmware image from filesystem
>> + *  'write fail'            = failed while writing to FPGA
>> + *  'write_success'         = after writing, low level driver returns success
> I would combine the sysfs patch with this as they are clearly related.

Yeah, this limited read-only sysfs could be merged to the core.  There was some thinking behind having it separate that I want to be clear about.

Some users of the fpga manager need to have the load sequence tightly controlled by userspace.   I want to have that type of interface as a separate C file and enabled by defconfig.  That way people with really complicated use cases can have the interface that will suit them.

The use case I am most aware of can be pretty simple: ARM with a single tightly coupled FPGA.  I don't want to make any initial decisions that get in the way of something that will work for PCI FPGAs or other use cases that are a lot more complicated.  On the other hand, I don't want to saddle this with an interface that is driven by the most complicated scenario, especially when there could be production cases where the firmware can be loaded by the DT and won't need a lot of userspace interaction.

So this strategy is separating core, bus, and interface(s) that put the fpga manager under userspace control.

> You seem to mix state and status here. For example, "write_success
> fail" makes no sense. 

I could have state and status as two separate sysfs entries.  The goal is to give enough useful information to know what what stage of things went wrong.

> I think you are exposing to many low level
> details both to userspace and perhaps specific to Altera.

Hmm OK, will need to revisit that and keep it usable for everybody.  I still am not adamantly opposed to having status be a string reported by the lower level driver.  Although that can be more manufacturor-specific, that might make sense at that point since we want to know what (in this specific FPGA's write sequence) went wrong.

> How is read used?

Errr by the fpga_mgr_read function that I need to add.
> Rob
