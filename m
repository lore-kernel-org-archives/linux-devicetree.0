From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: Add Allwinner Q8 tablets hardware manager
Date: Thu, 27 Oct 2016 22:23:04 +0300
Message-ID: <220FACC3-52D3-42EB-A5B5-0F3625E002CA@konsulko.com>
References: <20161014075337.10452-1-hdegoede@redhat.com> <20161024173900.GP15620@leverpostej> <4cfbedb2-0249-e881-3577-dda0b0d4cabe@redhat.com> <9B288597-7812-459D-A5C7-B61107751DA6@konsulko.com> <CAJ-oXjT=eVwEk7t5WoZAhjMhiZZkq0NN5tFLidSnUNO97D62zQ@mail.gmail.com> <D75CB7DE-4165-4D2F-B40B-D2B6875C0172@konsulko.com> <CAJ-oXjS_=k4qE25t2b9eNnuqvVHf-1g7CZr81pPJx==aftF4xw@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJ-oXjS_=k4qE25t2b9eNnuqvVHf-1g7CZr81pPJx==aftF4xw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pierre-Hugues Husson <phh-8tEavu1zA38@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Pierre,

> On Oct 27, 2016, at 22:04 , Pierre-Hugues Husson <phh-8tEavu1zA38@public.gmane.org> wrote:
>=20
> 2016-10-27 19:11 GMT+02:00 Pantelis Antoniou =
<pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>:
>>=20
>> Hi Pierre,
>>=20
>>> On Oct 27, 2016, at 19:59 , Pierre-Hugues Husson <phh-8tEavu1zA38@public.gmane.org> wrote:
>>>=20
>>> 2016-10-27 17:52 GMT+02:00 Pantelis Antoniou =
<pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>:
>>>> Yes there is no EEPROM but you might be able to map probing results =
to
>>>> a fake =E2=80=98model=E2=80=99 number.
>>>>=20
>>>> Let me expand a bit:
>>>>=20
>>>> Assume that you have a number of probing steps, for example A, B, C =
each
>>>> returning true or false, and C being executed only when B is =
=E2=80=98true=E2=80=99 you
>>>> could do this to generate a bit field that identifies it.
>>>>=20
>>>> For example let=E2=80=99s assume that model FOO=E2=80=99s probing =
steps are
>>>>=20
>>>> A false, B true, C false -> 010
>>>>=20
>>>> Model=E2=80=99s BAR
>>>>=20
>>>> A true, B false, C don=E2=80=99t care -> 10x
>>>>=20
>>>> Mapping these to models could be
>>>>=20
>>>> Model FOO, (010 & 111) =3D=3D 010 (all three probing steps must =
match)
>>>>=20
>>>> Model BAR, (10x & 110) =3D 100 (the first two probing steps must =
match)
>>>=20
>>> This method looks too complex on multiple grounds.
>>> Assuming your method, I'm not too sure how this would actually be
>>> described in a DTS.
>>> Such probing steps should include reading/matching IDs in an =
EEPROM/on
>>> an ADC, but it should also include the result of a driver's probe.
>>> Also, drivers should have a way to report an ID/OTP instead of just =
a
>>> boolean.
>>>=20
>>=20
>> Err, I don=E2=80=99t think you got the point.
>>=20
>> The probing steps are done by a board specific probe driver.
>> This driver performs the probing steps (which is exactly what =
Hans=E2=80=99s
>> method now does) but instead of applying changes to the device tree
>> programmatically generates a model string.
>>=20
>> This model string can be used by a general purpose overlay manager to =
apply
>> the overlay(s) for the specific board. The plural part is important - =
read
>> below.
>=20
> Ok, I agree I didn't get the point, and I'm not sure I do now.
> If I understand correctly, the difference between your method and
> Hans', is that instead of manipulating directly OF properties based on
> heuristics, there will be a heuristic to determine model revision, and
> THEN apply overlays based on determined model revision.
>=20
> If this is the correct interpretation, this means that for boards with
> two possible accelerometers, a new driver is required, while something
> as simple as i2c-probe-stop-at-first-match wouldn't require a new
> driver.
>=20

It does require a new driver, but the driver is simple a probing method
driver; it does not require to modify the actual drivers that are going
to be instantiated.

In DT terms for a board specific probe driver:

bpm: board_probe_method {
	compatible =3D =E2=80=9Cfoocorp,bar-board-probe=E2=80=9D;
};

genm: generic_model_manager {
	compatible =3D =E2=80=9Cgeneric-model-manager=E2=80=9D;
=09
	probe-method =3D <&bpm>;

	/* list of models and overlays to apply in sequence */
	models {
		foo-model-0 =3D =E2=80=9Cfoo,bar,screen-A=E2=80=9D, =
=E2=80=9Cfoo,bar,accel-A=E2=80=9D;
		foo-model-1 =3D =E2=80=9Cfoo,bar,screen-A=E2=80=9D, =
=E2=80=9Cfoo,bar,accel-B=E2=80=9D;
		foo-model-2 =3D =E2=80=9Cfoo,bar,screen-B=E2=80=9D, =
=E2=80=9Cfoo,bar,accel-A=E2=80=9D;
		foo-model-3 =3D =E2=80=9Cfoo,bar,screen-B=E2=80=9D, =
=E2=80=9Cfoo,bar,accel-B=E2=80=9D;
	};
};

The manager can call the single exported method which could be as simple
as:

const char *probe_identify();

In fact for things like i2c probe a generic probe method might suffice.

i2c_generic_bpm: generic_i2c_probe_method {
	compatible =3D =E2=80=9Ci2c-generic-probe-method=E2=80=9D;

	models {
		model@0 {
			result =3D =E2=80=9Cfoo-model-0=E2=80=9D;
			/* match when read at address 12 returns 5 */
			/* and read at address 14 returns 0 */
			/* format is command, bus, address, argument */
			match =3D <MATCH_READ &i2c0 12 5>, <MATCH_READ =
&i2c0 0 14 0>;
			=E2=80=A6 etc ...
		};
	};
};


>>> As you mentioned, it is a way to distinguish models, not just a set =
of
>>> parameters.
>>> Does this mean that this DT would lead to loading various DT based =
on
>>> the matching model, which would look like a FIT?
>>> Also there is a modularity problem there. If I have phones with =
either
>>> screen A or screen B, and with either accelerometer A or =
accelerometer
>>> B, I would have to implement all four combinations.
>>>=20
>>=20
>> The model lookup need not result in a simple overlay to apply.
>>=20
>> So for your case it would be:
>>=20
>> model corp,0 -> overlay screen A + overlay accel A
>> model corp,1 -> overlay screen A + overlay accel B
>> model corp,2 -> overlay screen B + overlay accel A
>> model corp,3 -> overlay screen B + overlay accel B
>>=20
>> You don=E2=80=99t need the combinatorial number of overlays.
>=20
> My worry initially was that all 4 "model corp" are needed, while with
> using a simple approach like i2c-probe-stop-at-first-match, this
> wouldn't be needed.
> But now that I'm thinking of it again, for such a case to happen, this
> would require to have OEMs picking random components for tablets of
> one production batch. This wouldn't make any sense.
> So I agree a model-based method should cover sufficient cases to be =
worthwhile.
> I think it covers every device I've met.
>=20

Yeah, model number in this case means both model and revision.
If components change you change the internal model number.

> Regards,

Regards

=E2=80=94 Pantelis

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
