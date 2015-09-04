From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: st_fdma: Firmware filename in DT?
Date: Fri, 4 Sep 2015 14:04:55 -0500
Message-ID: <CAL_Jsq+bw1TcXt0c8L4BSvwWK82L2cG-qdw369EkvxWe-5RXbQ@mail.gmail.com>
References: <20150903144944.GC7093@griffinp-ThinkPad-X1-Carbon-2nd>
 <CAL_JsqKQqbAQCPR6xuR2Ke5gEdX4kQYb29-W3qNaZqjM_JBoYg@mail.gmail.com>
 <20150904065916.GZ4796@x1> <20150904092005.GA2990@griffinp-ThinkPad-X1-Carbon-2nd>
 <20150904102130.GA4796@x1> <5E0DCAA5-DB90-4682-92F2-061A07FE973E@bsdimp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5E0DCAA5-DB90-4682-92F2-061A07FE973E-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Warner Losh <imp-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 4, 2015 at 9:27 AM, Warner Losh <imp-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org> wrote:
>
>> On Sep 4, 2015, at 4:21 AM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>>
>>>>>> We could do it by parsing the node name e.g. fdma0-audio, or by =
adding
>>>>>> a "instance" DT property to the node?
>>>>>
>>>>> Generally we try to avoid caring about node names. Having some in=
dex
>>>>> or numbering also comes up which we also try to avoid. Generally,=
 if
>>>>> you care about which instance you use for something, then there i=
s
>>>>> some property you care about and should add.
>>>>
>>>> Right, the alternative is a property like the ones already used.
>>>> However, as these are becoming more prevalent I suggested
>>>> standardising the property to avoid all these vendor specific firm=
ware
>>>> properties cluttering up the place.
>>>
>>> I agree a proliferation of vendor specific firmware properties isn'=
t
>>> s good way forward.
>>>
>>>>  firmware =3D "firmwarename.fw";
>>>> OR
>>>>  firmware-name =3D "firmwarename.fw";
>>>>
>>>> ... seems appropriate.
>>>
>>> Either of those is fine with me.
>>
>> Just need a DT nod and I'll happily code it up.
>
> From a FreeBSD perspective, having a filename for the firmware to
> load for this node is fine. It doesn=E2=80=99t impose a substantial b=
urden on
> the OS so long as the choices of where that file lives is up to the O=
S
> and not encoded in the property. A note saying =E2=80=98this firmware=
 should
> be loaded=E2=80=99 seems a reasonable description of the hardware sin=
ce
> the DT tells us many things about the device, and those things may
> well be dependent on which firmware is loaded. Having an explicit
> name is good since it helps insulate from DT and doesn=E2=80=99t forc=
e vendors
> to do silly renames. It also allows for multiple devices of the same
> type to have different firmware loaded.
>
> FreeBSD would generally put these things in /boot/firmware and
> it has a generalized mechanism to load the firmware at run time
> that=E2=80=99s based on this. While the path names are flexible, havi=
ng
> the firmware live in a central place is useful from an automation
> point of view. Having just a name, and not a full path, enables
> this policy, while still allowing others to have other policies.
>
> Linux distributions would be free to do whatever they wanted
> and implement other policies than FreeBSD.
>
> So a property like this, with the semantics discussed, seems to
> meet the OS independent test.

Good. I'll await a binding to review...

I would suggest "firmware-names" to be consistent with other naming
convention and because their can be more than one (either at the same
time or as fallback). It also leaves "firmware" available if we want
to have phandle's to firmware embedded in the DT at some point later.

Rob
