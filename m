From: Iztok Jeras <iztok.jeras-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: device tree overlays
Date: Thu, 9 Nov 2017 14:34:02 +0100
Message-ID: <CAAk4mkYiGehkQPy=HLUGjOfd5JwZZB49s2bfnrrMsxV6khUOoA@mail.gmail.com>
References: <CAAk4mkZcBEb7o0BA3gh2rEsQiEW18XKUqHUMN1fTf+h5WAXkyA@mail.gmail.com>
 <CAAk4mkbBvjB4CJq_oeXvJFibus06LF83BF3D2Nw5BuSHLdn+xA@mail.gmail.com>
 <CAAk4mkZNjQ-TA06mrYh_ZU0L4UQp9sLg58V1MGqWJWj=ZR8vMA@mail.gmail.com> <be15f78a-2393-7dbd-9ff6-996a3ec7f63b@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <be15f78a-2393-7dbd-9ff6-996a3ec7f63b-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Frank,

I checked a list of Xilinx drivers which are not upstreamed, and the
only one important to me is xdevcfg, which is used to program the
FPGA.
But there is a FPGA manager driver available upstream, so I could use that one.
For now I will try to use this branch, you mentioned it in a patchset ...
https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/log/?h=dt/next

Regarding DTC, based on your recomendation, I found a proper dtc
(v1.4.5) is already packaged for Debian:
https://packages.debian.org/buster/device-tree-compiler

Regards,
Iztok Jeras

On Tue, Nov 7, 2017 at 2:23 AM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Iztok,
>
> On 11/03/17 12:43, Iztok Jeras wrote:
>> Hi Frank,
>>
>> I work for Red Pitaya as Verilog, C, Python, ... coder:
>> https://github.com/RedPitaya/RedPitaya
>> I will move to another job this month, but I might still code for Red
>> Pitaya of maybe PYNQ in my spare time.
>> http://www.pynq.io/
>>
>> We have been experimenting with device tree overlays on ZYNQ FPGA for
>> about a year now.
>>
>> I would like to share our experience with you and ask you a few questions.
>>
>> We started with a patchset for kerner 4.4 this is still part of our
>> public release.
>> Recently we switched internally to kernel 4.9 patched with a newer patchset.
>> https://github.com/RedPitaya/linux-xlnx/commits/branch-redpitaya-v2017.2
>> The patchset was easy to apply to Xilinx kernel 2017.1,
>> but with the latest Xilinx release 2017.3 there are many conflicts,
>> apparently Xilinx started something there and did not finish.
>> I will check if the drivers I need are already upstream so I could
>> avoid using Xilinx provided kernels.
>>
>> There are two reasons I would like to use overlays:
>> 1. switching between FPGA bitstream which require kernel drivers,
>> 2. I2C/SPI/1-wire drivers over GPIO, I would like to configure them at
>> runtime (we are not doing this yet).
>>
>> We are switching FPGA bitstreams and we currently handled the next
>> Xilinx IP related drivers:
>> 1. UIO drivers
>> Work well if loaded at boot or as overlay, we have user space drivers
>> with IRQ support.
>> 2. Xilinx AXI IRQ
>> Does not work if loaded as overlay, a kernel developer contractor
>> described the issue
>> as driver initialization not being compatible with overlay code,
>> something about driver init running early.
>> He improvised an ugly and hard coded patch:
>> https://github.com/RedPitaya/linux-xlnx/commit/592b9c711f11fcfc14100094896fbabf08009f4b
>> The driver can now be loaded as overlay, but I would not recommend the
>> patch to anyone.
>> 3. Xilinx AXI DMA
>> This driver had many non overlay related bugs in 4.4 but it is fine in 4.9.
>> In kernel 4.4 we could not load it entirely from an overlay, so we
>> improvised an ugly solution.
>> We load the driver in the boot DT but with the status=disabled.
>> This prevents the driver code from loading and crashing at boot and
>> between FPGA image reloads.
>> Then we load an overlay with status=OK to actually enable the driver.
>> I might try to load the driver entirely from an overlay next week.
>> 4. XADC
>> I did not test this drivers with overlays yet.
>> 5. We had a branch, where the overlay was used to load the FPGA bistream,
>> it worked, but it meant disabling support for /dev/xdevcfg which would
>> need explaining to users.
>> Additionally our kernel developer was kind of slow making the changes
>> ad we run out of time.
>> So now we use overlays but load the FPGA through xdevcfg.
>> For my own project I might try loading with fpga_region again.
>>
>> Questions:
>> 1. Could you point me to the latest overlay patchset
>> or even better a Xilinx kernel repo with overlay patches already applied.
>
> I don't follow any of the out of mainline patch sets that various projects
> are using, so I don't have any pointers.
>
>
>> 2. You mentioned in your 2017 talk that dtsi files can be compiled into overlay,
>> I understand how, but am not sure I am using the correct dtc:
>> https://github.com/RedPitaya/dtc/archive/overlays.tar.gz at some point
>> forked from
>> https://github.com/pantoniou/dtc/archive/overlays.tar.gz
>
> If the dtc repo has commit c1e55a5513e9 "checks: fix handling of unresolved
> phandles for dts plugins", then it will be recent enough.  I expect this
> version of dtc to appear in the Linux kernel tree in v4.15-rc1.
>
>
>> How can I check if it works properly, a coworker mentioned that converting dtb
>> back into dtc should show fragments, there were no fragments when I tried.
>
> Your coworker is correct (though the fragment nodes are an implementation detail
> of the current version of dtc).  As an example, using the files from:
>
>    https://elinux.org/images/d/dc/Elce_2017_dt_bof.pdf
>
> If you compile and de-compile fpga_overlay.dts from slide 21, which includes
> fpga_plugin_or_dtsi.dts from slide 22, you will see a fragment node.  In the
> example dtx_diff is using the dtc that should appear in v4.15-rc1.
>
>
> $ scripts/dtc/dtx_diff fpga_overlay.dts
> /dts-v1/;
>
> / {
>
>         __fixups__ {
>                 fpga_region = "/fragment@0:target:0";
>                 intc = "/fragment@0/__overlay__/freeze_controller@100000450:interrupt-parent:0";
>         };
>
>         __local_fixups__ {
>
>                 fragment@0 {
>
>                         __overlay__ {
>
>                                 fpga_pr_region0 {
>                                         fpga-bridges = <0x0>;
>                                 };
>                         };
>                 };
>         };
>
>         fragment@0 {
>                 target = <0xffffffff>;
>
>                 __overlay__ {
>                         #address-cells = <0x2>;
>                         #size-cells = <0x1>;
>                         external-fpga-config;
>                         ranges = <0x0 0x0 0xc0000000 0x40000 0x1 0x0 0xff200000 0x1000>;
>
>                         fpga_pr_region0 {
>                                 compatible = "fpga-region";
>                                 fpga-bridges = <0x1>;
>                                 ranges;
>                         };
>
>                         freeze_controller_0: freeze_controller@100000450 {
>                                 compatible = "altr,freeze-bridge-controller";
>                                 interrupt-parent = <0xffffffff>;
>                                 interrupts = <0x0 0x15 0x4>;
>                                 phandle = <0x1>;
>                                 reg = <0x1 0x450 0x10>;
>                         };
>                 };
>         };
> };
>
>
>> Which dtc should I use?
>
> You can find a link to the upstream dtc project at:
>
>    https://elinux.org/Device_Tree_Reference#dtc_.28upstream_project.29
>
> I don't know if you need any other changes from the places you have been
> getting dtc from.
>
>
>> 3. Do you know a better approach for loading the AXI IRQ driver with overlays?
>
> Nope, sorry.  I don't follow the out of mainline projects.
>
>
>> I will probably remember further questions later.
>>
>> Regards,
>> Iztok Jeras
>>
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
