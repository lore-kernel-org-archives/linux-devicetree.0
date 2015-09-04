From: Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: st_fdma: Firmware filename in DT?
Date: Fri, 4 Sep 2015 17:19:40 +0100
Message-ID: <55E9C49C.6020107@linaro.org>
References: <20150903144944.GC7093@griffinp-ThinkPad-X1-Carbon-2nd>
 <CAL_JsqKQqbAQCPR6xuR2Ke5gEdX4kQYb29-W3qNaZqjM_JBoYg@mail.gmail.com>
 <20150904065916.GZ4796@x1>
 <20150904092005.GA2990@griffinp-ThinkPad-X1-Carbon-2nd>
 <20150904102130.GA4796@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150904102130.GA4796@x1>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 04/09/15 11:21, Lee Jones wrote:
>>> Absolutely not.  Firmwares have no direct link to DT or platforms t=
hat
>>> run DT specifically.  They are carried by most platforms these days=
=2E
>>> Insisting on firmwares using a DT compatible string format is way o=
ff.
>>>
>>> If we flip it the other way round, some subsystems derive the firmw=
are
>>> name from the 'node name'.  For instance, our zeroth General Purpos=
e
>>> Co-Processor RemoteProc driver has a corresponding node called
>>> 'st231-gp0@40000000'.  RemoteProc adds an 'rproc-' prefix and a '-f=
w'
>>> suffix and et voil=C3=A0, we load file:
>>>
>>>    lib/firmware/rproc-st231-gp0-fw
>>
>> IMO deriving from the node name seems fragile. Also imposing a linux=
'ism
>> "rproc" prefix on the firmware name doesn't seem correct as the firm=
wares
>> can be shared across OS's. Although this is how remoteproc subsys co=
re
>> is currently working. It seems a generic DT firmware binding would a=
ctually
>> be most useful for the remoteproc subsystem.
>
> The "rproc-%s-fw", where %s =3D=3D driver name, is only a fall-back. =
 The
> RProc driver is welcome to supply a different firmware name if it
> desires.  This is where I think a generic 'firmware' property would b=
e
> of use.

Hmnnn... That default looks really inappropriate for the ST platforms!

Different generations of the hardware have co-processors with similar=20
roles (and hence all with names like st231-gp0) but its very rare for=20
the co-processors to have the same firmware binary.

Thus if the default were applied naively we will end up with a bizarre=20
situation where the kernel is multi-platform but because the kernel doe=
s=20
not select a unique name for the different firmwares, it becomes=20
needlessly difficult for the userspace to support multiple platforms.

If there was a generic firmware property for this kind of situation it=20
is fairly natural to note in the bindings docs the importance of=20
uniqueness through the generations regarding of the choice of name.

There are other ways a driver can generate a unique name as the=20
generations of chip develop (compatible strings actually very good for=20
this) but I don't see it fitting quite so naturally into the binding=20
docs where it can help future adventurers.


>> I guess I should also comment about this on the ST remoteproc thread=
=2E
>>
>> I'm curious though as to how the ST remoteproc driver then loads the=
 firmware,
>> as that name doesn't look like a video or audio firmware filename th=
at I've
>> seen shipped from ST. IIRC Usually it is named something like
>>
>> vid_firmware-stih407.elf or audio_firmware-bd-stih407.elf
>
> This driver came direct from ST.  I'm using their conventions as a
> default, although I would be happy to conduct some investigation into
> how this works for releases and suggest a better interface.  The only
> reason I mentioned it here was because this is how others are using
> other SS which are similar in some way.  Same for the Firmware SS I
> guess.
>
> In my unbiased PoV, I'd much prefer the name was derived from a
> predefined propertly.
>
>> IMO we should be treating the firmware as a blackbox, and for me tha=
t also
>> includes the filename it is shipped with. Linux drivers making up th=
eir own
>> firmware names based on the name of their subsystem doesn't seem lik=
e a
>> good way forward to me.
>
> I guess the driver author was just using the fall-back convention for
> testing.  I'm pretty sure RemoteProc isn't being shipped in products
> yet.

Both for fdma and co-processors, it is important that the kernel (or=20
kernel informed by DT properties/compatible strings) is "assertive"=20
enough to choose names that are sufficiently unique.

That is far more important than honoring vendor filenames.

Vendor filenames could easily be both too simple ("firmware.bin") or to=
o=20
detailed ("fdma-foo+bar-v1.8_20140811.fw"; the DT should not be encodin=
g=20
the version number of a firmware loaded from userspace since its not a=20
fixed property of the platform).


Daniel.
