From: Federico Vaga <federico.vaga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: DeviceTree FPGA bitstream
Date: Tue, 9 Jun 2015 16:49:14 +0200
Message-ID: <20150609144901.GC12677@pcbe13110.cern.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

I'm evaluating the DeviceTree to describe the content of an FPGA.
I noticed that Xilinx is already doing it:

https://www.kernel.org/doc/Documentation/devicetree/bindings/xilinx.txt

I admit that I didn't read the code yet, but before doing it I want to
ask you some simple questions that may save me a lot of time.
My questions are:

- is there any reccomandation about DeviceTree for FPGA content description?
If yes, are they documented somewhere?

- it looks like the DeviceTree is disable for x86 architecture except for
some specific platform. Is it possible to enable it for the entire x86
architecture? Are there any reason to disable it by default?

- I read that since versione 3.17 it should be possible to dynamically add
portion of DeviceTree from configfs. Is it possible on all architecture?

- I'm working on x86_64 and my FPGA can be on a pluggable board (e.g. PCIe).
Is there a way to describe this situation with DeviceTree? Is there any tool
that dynamically computes the addresses (interrupts) translation to use
(e.g. on PCIe) ?

Thank you :)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
