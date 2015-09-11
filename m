From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: st_fdma: Firmware filename in DT?
Date: Fri, 11 Sep 2015 13:31:08 +0100
Message-ID: <20150911123108.GA15908@griffinp-ThinkPad-X1-Carbon-2nd>
References: <20150903144944.GC7093@griffinp-ThinkPad-X1-Carbon-2nd>
 <201509051125.43527.arnd@arndb.de>
 <55ED6733.7050807@linaro.org>
 <1638322.iN3qcjUCN8@wuerfel>
 <55EDA0EB.1040501@linaro.org>
 <20150910141809.GA21497@griffinp-ThinkPad-X1-Carbon-2nd>
 <20150911091700.GI3260@x1>
 <20150911094621.GA9865@griffinp-ThinkPad-X1-Carbon-2nd>
 <20150911102516.GA18779@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150911102516.GA18779@x1>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Warner Losh <imp-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Lee,

On Fri, 11 Sep 2015, Lee Jones wrote:

> On Fri, 11 Sep 2015, Peter Griffin wrote:
> > On Fri, 11 Sep 2015, Lee Jones wrote:
> > > On Thu, 10 Sep 2015, Peter Griffin wrote:
> > > > On Mon, 07 Sep 2015, Daniel Thompson wrote:
> > > > > On 07/09/15 13:33, Arnd Bergmann wrote:
> > > > > >On Monday 07 September 2015 11:30:11 Daniel Thompson wrote:
> > > > > >>>>
> > > > > >>>>I would suggest "firmware-names" to be consistent with other naming
> > > > > >>>>convention and because their can be more than one (either at the same
> > > > > >>>>time or as fallback). It also leaves "firmware" available if we want
> > > > > >>>>to have phandle's to firmware embedded in the DT at some point later.
> > > > > >>>
> > > > > >>>Having list of strings would certainly make this more flexible than
> > > > > >>>just a single string, for the same reason as taking the list of
> > > > > >>>compatible values as the base, so +1 for "firmware-names" over "firmware".
> > > > > >>
> > > > > >>I was recently thinking about how DT filenames would interact with
> > > > > >>incompatible ABI changes to the firmware's register and/or wire protocol.
> > > > > >>
> > > > > >>Just for example we start with f/ware ABI A and we create a mainline
> > > > > >>kernel X that supported it.
> > > > > >>
> > > > > >>Vendor now releases a new firmware with ABI B and we update the mainline
> > > > > >>driver to support ABI A (to avoid breaking old userspaces) and B,
> > > > > >>eventually releasing kernel Y.
> > > > > >>
> > > > > >>The question now is how kernels X and Y should use the DT to generate
> > > > > >>the filename. It is very desirable that kernels X and Y use *different*
> > > > > >>filenames because otherwise a single userspace could not support the new
> > > > > >>feature *and* boot with both X and Y.
> > > > > >
> > > > > >Generally speaking, the kernel should shield user space from ABI
> > > > > >differences in the firmware and still provide the same user space ABI
> > > > > >(possibly emulated, when the newer firmware removes features of the
> > > > > >old one). Can you think of a case where a device firmware directly
> > > > > >defines the user ABI without having kernel visible changes?
> > > > > 
> > > > > I don't mean that the firmware ABI is exposed to userspace.
> > > > > 
> > > > > I mean if you use the same filename for both ABIs (in /lib/firmware)
> > > > > then kernel X with lose functionality if it is booted with a
> > > > > userspace that has updated to the new firmware (maybe even crash if
> > > > > I can't detect at runtime the version of the firmware is has
> > > > > loaded). That sort of thing is the pain for distros which support
> > > > > booting with multiple kernels (apt-get/dnf simply won't know when it
> > > > > is safe to update the firmware binary).
> > > > > 
> > > > > 
> > > > > >>Having lists of firmwares can certainly help solve this (providing the
> > > > > >>list can be used to allow a driver to select for an ABI is supports).
> > > > > >>However I afraid I find this example argues against having filenames in
> > > > > >>DT at all because it seems odd to me that, for kernel and userspace to
> > > > > >>adopt ABI B that must wait until the DT is updated to include support
> > > > > >>for ABI B. The hardware didn't change...
> > > > 
> > > > This is a really good point and one I'd not considered.
> > > > 
> > > > > >
> > > > > >This is not what I was thinking of for a list of file names: I would not
> > > > > >want a case where the kernel might pick between multiple incompatible
> > > > > >files without knowing what they are, especially if the differences
> > > > > >are ABI relevant.
> > > > > 
> > > > > Nor me.
> > > > > 
> > > > > Personally I prefer an "assertive" driver that imposes a filename
> > > > > for the firmwares it needs. Thus if there is an ABI change the
> > > > > driver writer can load a completely different firmware file without
> > > > > needing a DT update. That said I'm not especially invested either
> > > > > way.
> > > > > 
> > > > > However whatever solution is reached I would quite like to be able
> > > > > to boot kernels from either side of an ABI break from a single
> > > > > userspace (and get the new features when the kernel supports them).
> > > > 
> > > > So to summarise, I think given Daniels good points about ABI
> > > > compatability, and also David and Arnd PoV, it would be best to leave
> > > > the generation of the firmware filename to the individual driver and
> > > > not put the filename in DT.
> > > 
> > > <hijacking>
> > > 
> > > That doesn't work for middle-layer drivers such as Remoteproc, where
> > > it doesn't have its own associated firmwares.  Remoteproc's job is
> > > simply to load the firmware.  It doesn't care which version of the ABI
> > > that particular binary uses, and has no reason to.  Ideally, I guess
> > > the Remoteproc client should be providing the firmware name, but why
> > > should the client care who or what was used to load the firmware?
> > 
> > I believe you answered your own question...
> > 
> > In your case, I believe it should be the client driver which wishes to
> > use rproc to boot the co-processor which provides the name.
> > 
> > For example a v4l2 driver which wishes to use the st231-deltamu
> > co-processor, and requests rproc to boot that CPU with a supplied
> > firmware name. The v4l2 driver has the knowledge to know it wishes to
> > use the st231 for video decoding, and can provide a unique name based
> > on its compatible (what SoC etc) it is with an approriate suffix / prefix.
> > 
> > This nicely also handles the
> > 
> > "The hardware is identical, and different firmware is used to apply
> >    it in different ways."
> > 
> > which David pointed out.
> > 
> > Say you now wish to use that st231 for some other general
> > accelerator usecase, and have client driver X, then X can provide
> > a suitable unique name to rproc.
> > 
> > To accomodate that usecase with the filename in DT would require changing DT
> > to provide a new filename. Obviously the hardware hasn't changed, just the
> > way in which you wish to apply it.
> > 
> > This also solves the issue Daniel pointed out about the name being
> > sufficiently unique to allow multiple STi SoC's to use the same
> > userspace, which your current approach does not.
> > 
> > To answer your question, the client should care about the filename
> > because it is the client which wishes to use the services of the firimware
> > and is in a unique position to know what that firmware is called.
> > As you point out, rproc is not in that position.
> 
> You're preaching to the converted.  I agree with all of this, which is
> why I said:

Oh I thought you were un-converted as you said it wouldn't work for rproc.

> 
> "Ideally, I guess the Remoteproc client should be providing the
> firmware name"
> 
> ... but you missed the critical part of my query:
> 
> "but why should the client care who or what was used to load the
> firmware?"

Most drivers in the kernel if they need a firmware call request_firmware
or request_firmware_nowait directly, i.e. they care about loading the
firmware that they need and call the correct kernel API to do so.

If your client driver wishes to use rproc to load the firmware instead of
request_firmware directly, then it seems obvious that it needs to care
about rproc API's so it can call them.

> 
> At the moment the client has no other way (besides DT) to tell
> Remoteproc (or any other firmware loader) which firmware binary to
> load.

Um yes it does, using the compatible strings like we've already
discussed to generate a unique filename.

>
>  To solve this, we would have to call load_firmware(name)
> [which doesn't exist yet], from the client, into either the core or
> the vendor driver.

I'm not sure what your getting at here (or maybe I've misunderstood you)
anyways...

The API for loading a firmware in the kernel is request_firmware, or
request_firmware_nowait, and you pass it the name of the firmware you
wish to load. So the API exists, and is used throughout the kernel.

The client driver then generates a unique name based on the compatible
and calls request_firmware(name).

>From what I can see rproc then adds another level of abstraction on
top of the request_firmware API. But the ability to pass
a name to request_firmware still exists. Maybe it will require changes
in rproc to propogate the name down properly to the request_firmware call,
but that is just a rproc implementation detail.

regards,

Peter.
