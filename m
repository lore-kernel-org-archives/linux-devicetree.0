From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: st_fdma: Firmware filename in DT?
Date: Fri, 11 Sep 2015 11:25:16 +0100
Message-ID: <20150911102516.GA18779@x1>
References: <20150903144944.GC7093@griffinp-ThinkPad-X1-Carbon-2nd>
 <201509051125.43527.arnd@arndb.de>
 <55ED6733.7050807@linaro.org>
 <1638322.iN3qcjUCN8@wuerfel>
 <55EDA0EB.1040501@linaro.org>
 <20150910141809.GA21497@griffinp-ThinkPad-X1-Carbon-2nd>
 <20150911091700.GI3260@x1>
 <20150911094621.GA9865@griffinp-ThinkPad-X1-Carbon-2nd>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150911094621.GA9865@griffinp-ThinkPad-X1-Carbon-2nd>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Warner Losh <imp-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 11 Sep 2015, Peter Griffin wrote:
> On Fri, 11 Sep 2015, Lee Jones wrote:
> > On Thu, 10 Sep 2015, Peter Griffin wrote:
> > > On Mon, 07 Sep 2015, Daniel Thompson wrote:
> > > > On 07/09/15 13:33, Arnd Bergmann wrote:
> > > > >On Monday 07 September 2015 11:30:11 Daniel Thompson wrote:
> > > > >>>>
> > > > >>>>I would suggest "firmware-names" to be consistent with othe=
r naming
> > > > >>>>convention and because their can be more than one (either a=
t the same
> > > > >>>>time or as fallback). It also leaves "firmware" available i=
f we want
> > > > >>>>to have phandle's to firmware embedded in the DT at some po=
int later.
> > > > >>>
> > > > >>>Having list of strings would certainly make this more flexib=
le than
> > > > >>>just a single string, for the same reason as taking the list=
 of
> > > > >>>compatible values as the base, so +1 for "firmware-names" ov=
er "firmware".
> > > > >>
> > > > >>I was recently thinking about how DT filenames would interact=
 with
> > > > >>incompatible ABI changes to the firmware's register and/or wi=
re protocol.
> > > > >>
> > > > >>Just for example we start with f/ware ABI A and we create a m=
ainline
> > > > >>kernel X that supported it.
> > > > >>
> > > > >>Vendor now releases a new firmware with ABI B and we update t=
he mainline
> > > > >>driver to support ABI A (to avoid breaking old userspaces) an=
d B,
> > > > >>eventually releasing kernel Y.
> > > > >>
> > > > >>The question now is how kernels X and Y should use the DT to =
generate
> > > > >>the filename. It is very desirable that kernels X and Y use *=
different*
> > > > >>filenames because otherwise a single userspace could not supp=
ort the new
> > > > >>feature *and* boot with both X and Y.
> > > > >
> > > > >Generally speaking, the kernel should shield user space from A=
BI
> > > > >differences in the firmware and still provide the same user sp=
ace ABI
> > > > >(possibly emulated, when the newer firmware removes features o=
f the
> > > > >old one). Can you think of a case where a device firmware dire=
ctly
> > > > >defines the user ABI without having kernel visible changes?
> > > >=20
> > > > I don't mean that the firmware ABI is exposed to userspace.
> > > >=20
> > > > I mean if you use the same filename for both ABIs (in /lib/firm=
ware)
> > > > then kernel X with lose functionality if it is booted with a
> > > > userspace that has updated to the new firmware (maybe even cras=
h if
> > > > I can't detect at runtime the version of the firmware is has
> > > > loaded). That sort of thing is the pain for distros which suppo=
rt
> > > > booting with multiple kernels (apt-get/dnf simply won't know wh=
en it
> > > > is safe to update the firmware binary).
> > > >=20
> > > >=20
> > > > >>Having lists of firmwares can certainly help solve this (prov=
iding the
> > > > >>list can be used to allow a driver to select for an ABI is su=
pports).
> > > > >>However I afraid I find this example argues against having fi=
lenames in
> > > > >>DT at all because it seems odd to me that, for kernel and use=
rspace to
> > > > >>adopt ABI B that must wait until the DT is updated to include=
 support
> > > > >>for ABI B. The hardware didn't change...
> > >=20
> > > This is a really good point and one I'd not considered.
> > >=20
> > > > >
> > > > >This is not what I was thinking of for a list of file names: I=
 would not
> > > > >want a case where the kernel might pick between multiple incom=
patible
> > > > >files without knowing what they are, especially if the differe=
nces
> > > > >are ABI relevant.
> > > >=20
> > > > Nor me.
> > > >=20
> > > > Personally I prefer an "assertive" driver that imposes a filena=
me
> > > > for the firmwares it needs. Thus if there is an ABI change the
> > > > driver writer can load a completely different firmware file wit=
hout
> > > > needing a DT update. That said I'm not especially invested eith=
er
> > > > way.
> > > >=20
> > > > However whatever solution is reached I would quite like to be a=
ble
> > > > to boot kernels from either side of an ABI break from a single
> > > > userspace (and get the new features when the kernel supports th=
em).
> > >=20
> > > So to summarise, I think given Daniels good points about ABI
> > > compatability, and also David and Arnd PoV, it would be best to l=
eave
> > > the generation of the firmware filename to the individual driver =
and
> > > not put the filename in DT.
> >=20
> > <hijacking>
> >=20
> > That doesn't work for middle-layer drivers such as Remoteproc, wher=
e
> > it doesn't have its own associated firmwares.  Remoteproc's job is
> > simply to load the firmware.  It doesn't care which version of the =
ABI
> > that particular binary uses, and has no reason to.  Ideally, I gues=
s
> > the Remoteproc client should be providing the firmware name, but wh=
y
> > should the client care who or what was used to load the firmware?
>=20
> I believe you answered your own question...
>=20
> In your case, I believe it should be the client driver which wishes t=
o
> use rproc to boot the co-processor which provides the name.
>=20
> For example a v4l2 driver which wishes to use the st231-deltamu
> co-processor, and requests rproc to boot that CPU with a supplied
> firmware name. The v4l2 driver has the knowledge to know it wishes to
> use the st231 for video decoding, and can provide a unique name based
> on its compatible (what SoC etc) it is with an approriate suffix / pr=
efix.
>=20
> This nicely also handles the
>=20
> "The hardware is identical, and different firmware is used to apply
>    it in different ways."
>=20
> which David pointed out.
>=20
> Say you now wish to use that st231 for some other general
> accelerator usecase, and have client driver X, then X can provide
> a suitable unique name to rproc.
>=20
> To accomodate that usecase with the filename in DT would require chan=
ging DT
> to provide a new filename. Obviously the hardware hasn't changed, jus=
t the
> way in which you wish to apply it.
>=20
> This also solves the issue Daniel pointed out about the name being
> sufficiently unique to allow multiple STi SoC's to use the same
> userspace, which your current approach does not.
>=20
> To answer your question, the client should care about the filename
> because it is the client which wishes to use the services of the firi=
mware
> and is in a unique position to know what that firmware is called.
> As you point out, rproc is not in that position.

You're preaching to the converted.  I agree with all of this, which is
why I said:

"Ideally, I guess the Remoteproc client should be providing the
firmware name"

=2E.. but you missed the critical part of my query:

"but why should the client care who or what was used to load the
firmware?"

At the moment the client has no other way (besides DT) to tell
Remoteproc (or any other firmware loader) which firmware binary to
load.  To solve this, we would have to call load_firmware(name)
[which doesn't exist yet], from the client, into either the core or
the vendor driver.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
