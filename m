From: Walter Goossens <waltergoossens-CmkmPbn3yAE@public.gmane.org>
Subject: Re: DeviceTree FPGA bitstream
Date: Thu, 11 Jun 2015 12:17:05 +0200
Message-ID: <55796021.7010402@home.nl>
References: <20150609144901.GC12677@pcbe13110.cern.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150609144901.GC12677-cpfkIQmgKd5FPxEMnUtzR+1GAupnlqi7@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Federico Vaga <federico.vaga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Federico,

On 06/09/2015 04:49 PM, Federico Vaga wrote:
> Hello,
>
> I'm evaluating the DeviceTree to describe the content of an FPGA.
> I noticed that Xilinx is already doing it:
>
> https://www.kernel.org/doc/Documentation/devicetree/bindings/xilinx.txt
>

So is Altera, both for the Nios2 and arm-soc architectures.
They're using this tool: https://github.com/wgoossens/sopc2dts to go
from their design software (qsys) to a dts file.
> I admit that I didn't read the code yet, but before doing it I want to
> ask you some simple questions that may save me a lot of time.
> My questions are:
>
> - is there any reccomandation about DeviceTree for FPGA content
> description?
> If yes, are they documented somewhere?
>

FPGA's are just like other "hardware" from the device-tree point of
view. If there's a UART in your FPGA, then you describe a UART in the
devicetree :)

For Altera FPGA's some info is described here:
http://rocketboards.org/foswiki/Documentation/DeviceTreeGenerator141 and
I think the xilinx flow is similar.

> - it looks like the DeviceTree is disable for x86 architecture except for
> some specific platform. Is it possible to enable it for the entire x86
> architecture? Are there any reason to disable it by default?
>
> - I read that since versione 3.17 it should be possible to dynamically
> add
> portion of DeviceTree from configfs. Is it possible on all architecture?
>
> - I'm working on x86_64 and my FPGA can be on a pluggable board (e.g.
> PCIe).
> Is there a way to describe this situation with DeviceTree? Is there
> any tool
> that dynamically computes the addresses (interrupts) translation to use
> (e.g. on PCIe) ?
>

I've been using this scheme on PPC for quite some time (before
devicetree overlays) by creating a custom pcie driver (that knows the
bar addresses and irqs) which then instantiates a "virtual platformbus"
at the pcie bar the fpga is located in.
You can adopt this scheme for x86 by creating a bus and using the
devicetree code to probe the inside of your FPGA but this is all a bit
hackish.
The correct approach (in my opinion) would be to use an overlay
describing the contents of the FPGA and loading that when probing the
pcie-device. This would however require a base devicetree to apply the
overlay to, and I'm not sure how much effort this is going to be on x86_64

Walter

> Thank you :)
> -- 
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
