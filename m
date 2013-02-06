From: James Hogan <james.hogan@imgtec.com>
Subject: Re: Heads up on a device tree change
Date: Wed, 6 Feb 2013 13:32:06 +0000
Message-ID: <51125B56.9050407@imgtec.com>
References: <CACxGe6sCBCGfLDAGVRgP3cnmE+oyXBDdPeVXVCqrsvCh13yPiw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <CACxGe6sCBCGfLDAGVRgP3cnmE+oyXBDdPeVXVCqrsvCh13yPiw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linux-next <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, Rob Herring <rob.herring@calxeda.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 06/02/13 13:11, Grant Likely wrote:
> Hi Stephen,
> 
> I've just pushed out a change which cleans up platform device
> registration to use the same path whether or not the device tree is
> used. It should be safe, but there is a risk of breakage on powerpc
> platforms.
> 
> The patch has two effects of note:
> - DT generated platform devices move from /sys/devices to under
> /sys/devices/platform. Userspace *should* be okay with this, but if
> there are any problems then I can post a workaround patch that keeps
> DT generiated platform_devices in the current location.
> - Resources on platform_devices get registered so they appear in
> /proc/iomem and /proc/ioports and so that device drivers get the added
> protection of request_region. This will cause breakage on device trees
> nodes with partially overlapping memory regions. (ie. 0x100..0x1ff and
> 0x180..0x27f). I also have a workaround for this, but I doubt that it
> will be necessary.

Hi Grant,

If I understand you correctly, the non-overlapping memory regions thing
could be a problem for me. We have a Meta based SoC that has various SoC
registers grouped together for doing GPIOs and Pin control things. I'm
still in the process of converting it to device tree, but the way I've
been handling it is to provide overlapping registers to both the gpio
and pinctl DT nodes. Each GPIO bank's registers are also interleaved
with the others, so I've been providing overlapping register ranges
(offset by 4 for each bank) to the DT node for each gpio bank too, so
each bank can function independently and the driver doesn't have to
worry about multiple banks. Does that sound like a reasonable use case?

I guess I could cheat with the length, or specify each register in it's
own memory resource, but it seems like overkill.

Cheers
James
