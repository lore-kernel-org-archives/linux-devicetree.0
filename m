From: Iztok Jeras <iztok.jeras-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: device tree overlays
Date: Fri, 3 Nov 2017 20:43:59 +0100
Message-ID: <CAAk4mkZNjQ-TA06mrYh_ZU0L4UQp9sLg58V1MGqWJWj=ZR8vMA@mail.gmail.com>
References: <CAAk4mkZcBEb7o0BA3gh2rEsQiEW18XKUqHUMN1fTf+h5WAXkyA@mail.gmail.com>
 <CAAk4mkbBvjB4CJq_oeXvJFibus06LF83BF3D2Nw5BuSHLdn+xA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAk4mkbBvjB4CJq_oeXvJFibus06LF83BF3D2Nw5BuSHLdn+xA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Frank,

I work for Red Pitaya as Verilog, C, Python, ... coder:
https://github.com/RedPitaya/RedPitaya
I will move to another job this month, but I might still code for Red
Pitaya of maybe PYNQ in my spare time.
http://www.pynq.io/

We have been experimenting with device tree overlays on ZYNQ FPGA for
about a year now.

I would like to share our experience with you and ask you a few questions.

We started with a patchset for kerner 4.4 this is still part of our
public release.
Recently we switched internally to kernel 4.9 patched with a newer patchset.
https://github.com/RedPitaya/linux-xlnx/commits/branch-redpitaya-v2017.2
The patchset was easy to apply to Xilinx kernel 2017.1,
but with the latest Xilinx release 2017.3 there are many conflicts,
apparently Xilinx started something there and did not finish.
I will check if the drivers I need are already upstream so I could
avoid using Xilinx provided kernels.

There are two reasons I would like to use overlays:
1. switching between FPGA bitstream which require kernel drivers,
2. I2C/SPI/1-wire drivers over GPIO, I would like to configure them at
runtime (we are not doing this yet).

We are switching FPGA bitstreams and we currently handled the next
Xilinx IP related drivers:
1. UIO drivers
Work well if loaded at boot or as overlay, we have user space drivers
with IRQ support.
2. Xilinx AXI IRQ
Does not work if loaded as overlay, a kernel developer contractor
described the issue
as driver initialization not being compatible with overlay code,
something about driver init running early.
He improvised an ugly and hard coded patch:
https://github.com/RedPitaya/linux-xlnx/commit/592b9c711f11fcfc14100094896fbabf08009f4b
The driver can now be loaded as overlay, but I would not recommend the
patch to anyone.
3. Xilinx AXI DMA
This driver had many non overlay related bugs in 4.4 but it is fine in 4.9.
In kernel 4.4 we could not load it entirely from an overlay, so we
improvised an ugly solution.
We load the driver in the boot DT but with the status=disabled.
This prevents the driver code from loading and crashing at boot and
between FPGA image reloads.
Then we load an overlay with status=OK to actually enable the driver.
I might try to load the driver entirely from an overlay next week.
4. XADC
I did not test this drivers with overlays yet.
5. We had a branch, where the overlay was used to load the FPGA bistream,
it worked, but it meant disabling support for /dev/xdevcfg which would
need explaining to users.
Additionally our kernel developer was kind of slow making the changes
ad we run out of time.
So now we use overlays but load the FPGA through xdevcfg.
For my own project I might try loading with fpga_region again.

Questions:
1. Could you point me to the latest overlay patchset
or even better a Xilinx kernel repo with overlay patches already applied.
2. You mentioned in your 2017 talk that dtsi files can be compiled into overlay,
I understand how, but am not sure I am using the correct dtc:
https://github.com/RedPitaya/dtc/archive/overlays.tar.gz at some point
forked from
https://github.com/pantoniou/dtc/archive/overlays.tar.gz
How can I check if it works properly, a coworker mentioned that converting dtb
back into dtc should show fragments, there were no fragments when I tried.
Which dtc should I use?
3. Do you know a better approach for loading the AXI IRQ driver with overlays?

I will probably remember further questions later.

Regards,
Iztok Jeras
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
