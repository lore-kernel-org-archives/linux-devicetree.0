From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: st_fdma: Firmware filename in DT?
Date: Thu, 10 Sep 2015 15:18:09 +0100
Message-ID: <20150910141809.GA21497@griffinp-ThinkPad-X1-Carbon-2nd>
References: <20150903144944.GC7093@griffinp-ThinkPad-X1-Carbon-2nd>
 <201509051125.43527.arnd@arndb.de>
 <55ED6733.7050807@linaro.org>
 <1638322.iN3qcjUCN8@wuerfel>
 <55EDA0EB.1040501@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55EDA0EB.1040501-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Warner Losh <imp-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, 07 Sep 2015, Daniel Thompson wrote:

> On 07/09/15 13:33, Arnd Bergmann wrote:
> >On Monday 07 September 2015 11:30:11 Daniel Thompson wrote:
> >>>>
> >>>>I would suggest "firmware-names" to be consistent with other naming
> >>>>convention and because their can be more than one (either at the same
> >>>>time or as fallback). It also leaves "firmware" available if we want
> >>>>to have phandle's to firmware embedded in the DT at some point later.
> >>>
> >>>Having list of strings would certainly make this more flexible than
> >>>just a single string, for the same reason as taking the list of
> >>>compatible values as the base, so +1 for "firmware-names" over "firmware".
> >>
> >>I was recently thinking about how DT filenames would interact with
> >>incompatible ABI changes to the firmware's register and/or wire protocol.
> >>
> >>Just for example we start with f/ware ABI A and we create a mainline
> >>kernel X that supported it.
> >>
> >>Vendor now releases a new firmware with ABI B and we update the mainline
> >>driver to support ABI A (to avoid breaking old userspaces) and B,
> >>eventually releasing kernel Y.
> >>
> >>The question now is how kernels X and Y should use the DT to generate
> >>the filename. It is very desirable that kernels X and Y use *different*
> >>filenames because otherwise a single userspace could not support the new
> >>feature *and* boot with both X and Y.
> >
> >Generally speaking, the kernel should shield user space from ABI
> >differences in the firmware and still provide the same user space ABI
> >(possibly emulated, when the newer firmware removes features of the
> >old one). Can you think of a case where a device firmware directly
> >defines the user ABI without having kernel visible changes?
> 
> I don't mean that the firmware ABI is exposed to userspace.
> 
> I mean if you use the same filename for both ABIs (in /lib/firmware)
> then kernel X with lose functionality if it is booted with a
> userspace that has updated to the new firmware (maybe even crash if
> I can't detect at runtime the version of the firmware is has
> loaded). That sort of thing is the pain for distros which support
> booting with multiple kernels (apt-get/dnf simply won't know when it
> is safe to update the firmware binary).
> 
> 
> >>Having lists of firmwares can certainly help solve this (providing the
> >>list can be used to allow a driver to select for an ABI is supports).
> >>However I afraid I find this example argues against having filenames in
> >>DT at all because it seems odd to me that, for kernel and userspace to
> >>adopt ABI B that must wait until the DT is updated to include support
> >>for ABI B. The hardware didn't change...

This is a really good point and one I'd not considered.

> >
> >This is not what I was thinking of for a list of file names: I would not
> >want a case where the kernel might pick between multiple incompatible
> >files without knowing what they are, especially if the differences
> >are ABI relevant.
> 
> Nor me.
> 
> Personally I prefer an "assertive" driver that imposes a filename
> for the firmwares it needs. Thus if there is an ABI change the
> driver writer can load a completely different firmware file without
> needing a DT update. That said I'm not especially invested either
> way.
> 
> However whatever solution is reached I would quite like to be able
> to boot kernels from either side of an ABI break from a single
> userspace (and get the new features when the kernel supports them).

So to summarise, I think given Daniels good points about ABI
compatability, and also David and Arnd PoV, it would be best to leave
the generation of the firmware filename to the individual driver and
not put the filename in DT.

The driver can then generate a unique filename based off of the
compatible string.

I will send an updated version of the fdma patches which generate
the filename in this way.

Many thanks to you all for your valuable input!

regards,

Peter.
