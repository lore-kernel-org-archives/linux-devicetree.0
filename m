From: Federico Vaga <federico.vaga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: DeviceTree FPGA bitstream
Date: Mon, 15 Jun 2015 10:55:46 +0200
Message-ID: <20150615085546.GA19162@pcbe13110.cern.ch>
References: <20150609144901.GC12677@pcbe13110.cern.ch>
 <55796021.7010402@home.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55796021.7010402-CmkmPbn3yAE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Walter Goossens <waltergoossens-CmkmPbn3yAE@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Walter,

On Thu, Jun 11, 2015 at 12:17:05PM +0200, Walter Goossens wrote:
> On 06/09/2015 04:49 PM, Federico Vaga wrote:
>> - it looks like the DeviceTree is disable for x86 architecture except for
>> some specific platform. Is it possible to enable it for the entire x86
>> architecture? Are there any reason to disable it by default?
>>
>> - I read that since versione 3.17 it should be possible to dynamically
>> add
>> portion of DeviceTree from configfs. Is it possible on all architecture?
>>
>> - I'm working on x86_64 and my FPGA can be on a pluggable board (e.g.
>> PCIe).
>> Is there a way to describe this situation with DeviceTree? Is there
>> any tool
>> that dynamically computes the addresses (interrupts) translation to use
>> (e.g. on PCIe) ?
>>
>
> I've been using this scheme on PPC for quite some time (before
> devicetree overlays) by creating a custom pcie driver (that knows the
> bar addresses and irqs) which then instantiates a "virtual platformbus"
> at the pcie bar the fpga is located in.
> You can adopt this scheme for x86 by creating a bus and using the
> devicetree code to probe the inside of your FPGA but this is all a bit
> hackish.
> The correct approach (in my opinion) would be to use an overlay
> describing the contents of the FPGA and loading that when probing the
> pcie-device.

This is more or less what I thought

> This would however require a base devicetree to apply the
> overlay to, and I'm not sure how much effort this is going to be on x86_64

Not sure but I fear that is not enough to make it stable. The compilation of
the DeviceTree is allowed only on x86 and on some specific platform.

Of course, I can modify the Kconfig to allow the compilation of the
DeviceTree but then I don't know if it will work and how it will work.
I mean are there particular reasons to keep the DeviceTree away from x86 ?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
