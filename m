From: Pierre-Hugues Husson <phh-8tEavu1zA38@public.gmane.org>
Subject: Re: Add Allwinner Q8 tablets hardware manager
Date: Thu, 27 Oct 2016 21:04:15 +0200
Message-ID: <CAJ-oXjS_=k4qE25t2b9eNnuqvVHf-1g7CZr81pPJx==aftF4xw@mail.gmail.com>
References: <20161014075337.10452-1-hdegoede@redhat.com> <20161024173900.GP15620@leverpostej>
 <4cfbedb2-0249-e881-3577-dda0b0d4cabe@redhat.com> <9B288597-7812-459D-A5C7-B61107751DA6@konsulko.com>
 <CAJ-oXjT=eVwEk7t5WoZAhjMhiZZkq0NN5tFLidSnUNO97D62zQ@mail.gmail.com> <D75CB7DE-4165-4D2F-B40B-D2B6875C0172@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <D75CB7DE-4165-4D2F-B40B-D2B6875C0172-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

2016-10-27 19:11 GMT+02:00 Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/HQFizaE/u3fw@public.gmane.org=
m>:
>
> Hi Pierre,
>
> > On Oct 27, 2016, at 19:59 , Pierre-Hugues Husson <phh-8tEavu1zA38@public.gmane.org> wrote:
> >
> > 2016-10-27 17:52 GMT+02:00 Pantelis Antoniou <pantelis.antoniou@konsulk=
o.com>:
> >> Yes there is no EEPROM but you might be able to map probing results to
> >> a fake =E2=80=98model=E2=80=99 number.
> >>
> >> Let me expand a bit:
> >>
> >> Assume that you have a number of probing steps, for example A, B, C ea=
ch
> >> returning true or false, and C being executed only when B is =E2=80=98=
true=E2=80=99 you
> >> could do this to generate a bit field that identifies it.
> >>
> >> For example let=E2=80=99s assume that model FOO=E2=80=99s probing step=
s are
> >>
> >> A false, B true, C false -> 010
> >>
> >> Model=E2=80=99s BAR
> >>
> >> A true, B false, C don=E2=80=99t care -> 10x
> >>
> >> Mapping these to models could be
> >>
> >> Model FOO, (010 & 111) =3D=3D 010 (all three probing steps must match)
> >>
> >> Model BAR, (10x & 110) =3D 100 (the first two probing steps must match=
)
> >
> > This method looks too complex on multiple grounds.
> > Assuming your method, I'm not too sure how this would actually be
> > described in a DTS.
> > Such probing steps should include reading/matching IDs in an EEPROM/on
> > an ADC, but it should also include the result of a driver's probe.
> > Also, drivers should have a way to report an ID/OTP instead of just a
> > boolean.
> >
>
> Err, I don=E2=80=99t think you got the point.
>
> The probing steps are done by a board specific probe driver.
> This driver performs the probing steps (which is exactly what Hans=E2=80=
=99s
> method now does) but instead of applying changes to the device tree
> programmatically generates a model string.
>
> This model string can be used by a general purpose overlay manager to app=
ly
> the overlay(s) for the specific board. The plural part is important - rea=
d
> below.

Ok, I agree I didn't get the point, and I'm not sure I do now.
If I understand correctly, the difference between your method and
Hans', is that instead of manipulating directly OF properties based on
heuristics, there will be a heuristic to determine model revision, and
THEN apply overlays based on determined model revision.

If this is the correct interpretation, this means that for boards with
two possible accelerometers, a new driver is required, while something
as simple as i2c-probe-stop-at-first-match wouldn't require a new
driver.

> > As you mentioned, it is a way to distinguish models, not just a set of
> > parameters.
> > Does this mean that this DT would lead to loading various DT based on
> > the matching model, which would look like a FIT?
> > Also there is a modularity problem there. If I have phones with either
> > screen A or screen B, and with either accelerometer A or accelerometer
> > B, I would have to implement all four combinations.
> >
>
> The model lookup need not result in a simple overlay to apply.
>
> So for your case it would be:
>
> model corp,0 -> overlay screen A + overlay accel A
> model corp,1 -> overlay screen A + overlay accel B
> model corp,2 -> overlay screen B + overlay accel A
> model corp,3 -> overlay screen B + overlay accel B
>
> You don=E2=80=99t need the combinatorial number of overlays.

My worry initially was that all 4 "model corp" are needed, while with
using a simple approach like i2c-probe-stop-at-first-match, this
wouldn't be needed.
But now that I'm thinking of it again, for such a case to happen, this
would require to have OEMs picking random components for tablets of
one production batch. This wouldn't make any sense.
So I agree a model-based method should cover sufficient cases to be worthwh=
ile.
I think it covers every device I've met.

Regards,
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
