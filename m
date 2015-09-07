From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: st_fdma: Firmware filename in DT?
Date: Mon, 07 Sep 2015 14:33:35 +0200
Message-ID: <1638322.iN3qcjUCN8@wuerfel>
References: <20150903144944.GC7093@griffinp-ThinkPad-X1-Carbon-2nd> <201509051125.43527.arnd@arndb.de> <55ED6733.7050807@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55ED6733.7050807-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Warner Losh <imp-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday 07 September 2015 11:30:11 Daniel Thompson wrote:
> >>
> >> I would suggest "firmware-names" to be consistent with other naming
> >> convention and because their can be more than one (either at the same
> >> time or as fallback). It also leaves "firmware" available if we want
> >> to have phandle's to firmware embedded in the DT at some point later.
> >
> > Having list of strings would certainly make this more flexible than
> > just a single string, for the same reason as taking the list of
> > compatible values as the base, so +1 for "firmware-names" over "firmware".
> 
> I was recently thinking about how DT filenames would interact with 
> incompatible ABI changes to the firmware's register and/or wire protocol.
> 
> Just for example we start with f/ware ABI A and we create a mainline 
> kernel X that supported it.
> 
> Vendor now releases a new firmware with ABI B and we update the mainline 
> driver to support ABI A (to avoid breaking old userspaces) and B, 
> eventually releasing kernel Y.
> 
> The question now is how kernels X and Y should use the DT to generate 
> the filename. It is very desirable that kernels X and Y use *different* 
> filenames because otherwise a single userspace could not support the new 
> feature *and* boot with both X and Y.

Generally speaking, the kernel should shield user space from ABI
differences in the firmware and still provide the same user space ABI
(possibly emulated, when the newer firmware removes features of the
old one). Can you think of a case where a device firmware directly
defines the user ABI without having kernel visible changes?

> Having lists of firmwares can certainly help solve this (providing the 
> list can be used to allow a driver to select for an ABI is supports). 
> However I afraid I find this example argues against having filenames in 
> DT at all because it seems odd to me that, for kernel and userspace to 
> adopt ABI B that must wait until the DT is updated to include support 
> for ABI B. The hardware didn't change...

This is not what I was thinking of for a list of file names: I would not
want a case where the kernel might pick between multiple incompatible
files without knowing what they are, especially if the differences
are ABI relevant.

However, being very specific would let users intentionally install a
firmware that is only used on a particular instance of a device that
they want to behave differently, while the generic firmware would come
preinstalled with the normal linux-firmware package.

	Arnd
