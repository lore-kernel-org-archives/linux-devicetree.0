From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [U-Boot] Auto-detecting touchscreen controller and
 dealing with hw configuration differences on q8 tablets
Date: Mon, 20 Jun 2016 22:03:52 +0300
Message-ID: <13802A8D-F214-4D00-BA87-D3746D882317@konsulko.com>
References: <bc978925-46a4-c069-8793-903a87ec70b8@redhat.com> <5E70AD96-4E8E-4430-AF99-0AA0FCF5F8E7@konsulko.com> <17e69e9e-06be-dc4f-cd47-152f6290d2ec@redhat.com> <7FA186CB-9BF2-47A6-835C-06AD63CF8837@konsulko.com> <b16c2b42-5628-c0b9-6486-f8a4728a0a33@redhat.com> <19098CD8-6BC1-4FFE-858F-A6DF4BE655D5@konsulko.com> <20160620182026.GA14012@rob-hp-laptop>
Reply-To: pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCV5BG4UVENBBHP4UC5QKGQEQYC6H2Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20160620182026.GA14012@rob-hp-laptop>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org" <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

> On Jun 20, 2016, at 21:20 , Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>=20
> On Mon, Jun 20, 2016 at 04:08:47PM +0300, Pantelis Antoniou wrote:
>> Hi Hans,
>>=20
>>> On Jun 20, 2016, at 16:02 , Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>>>=20
>>> Hi,
>>>=20
>>> On 20-06-16 14:22, Pantelis Antoniou wrote:
>>>> Hi Hans,
>>>>=20
>>>>> On Jun 20, 2016, at 14:03 , Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote=
:
>>>>>=20
>>>>> Hi,
>>>>>=20
>>>>> On 20-06-16 11:27, Pantelis Antoniou wrote:
>>>=20
>>> <snip>
>>>=20
>>>>>> Yes, it=E2=80=99s quite possible. You can even have stacked overlays=
.
>>>>>=20
>>>>> Ok, is there any example code how to change an overlay before applyin=
g it out there,
>>>>> or if not can you point to the functions to use to do this ?
>>>>>=20
>>>>=20
>>>> The canonical place for all the dynamic DT stuff is
>>>>=20
>>>> https://github.com/pantoniou/linux-beagle-track-mainline/tree/bbb-over=
lays
>>>>=20
>>>> The beaglebone cape manager is here.
>>>>=20
>>>> https://github.com/pantoniou/linux-beagle-track-mainline/commit/5028d1=
ed3beb8c75b28fce37b1bb5ee551b2ae9e
>>>>=20
>>>>> Specifically my plan is to:
>>>>>=20
>>>>> 1) Have a single overlay for q8 tablets with gsl1680 tablets
>>>>>=20
>>>>> 2) Write an in kernel overlay manager which when it detects a gsl1680=
 touchscreen
>>>>> will pick a best-default firmware-file + matching resolution + swap-x=
-y based on
>>>>> which SoC (A13/A23/A33) the tablet is based on as well as the gsl1680=
's chip-id
>>>>> and will then "patch" this info into the overlay before applying it. =
This
>>>>> means being able to set / modify several string, int and bool dt prop=
erties.
>>>>>=20
>>>>> 3) Offer a kernel-module option for the overlaymanager which will all=
ows
>>>>> overriding the defaults for the firmware-filename, etc. This is also
>>>>> why I want to go with the patch approach instead of having multiple
>>>>> dt-overlay files.
>>>>>=20
>>>>=20
>>>> Hmm, your problem appears to be simpler. You already know all the poss=
ible
>>>> parts that your touchscreen/video/thingy is going to use.
>>>>=20
>>>> You don=E2=80=99t have to use an overlay then. Overlays are built on t=
op of
>>>> changesets.
>>>>=20
>>>> For example, let=E2=80=99s say that you have various options for a tou=
chscreen out
>>>> of a finite set.
>>>>=20
>>>> You just put the basic configuration for each in a disable node and yo=
ur
>>>> manager only needs to update the properties and set the status to enab=
led
>>>> for it to be enabled.
>>>>=20
>>>> For instance let=E2=80=99s say you have an option of two devices (only=
 one of them
>>>> being present).
>>>>=20
>>>> devA {
>>>> 	status =3D =E2=80=9Cdisabled=E2=80=9D;
>>>> 	compatible =3D =E2=80=9Cfoo,A=E2=80=9D;
>>>> };
>>>>=20
>>>> devB {
>>>> 	status =3D =E2=80=9Cdisabled=E2=80=9D;
>>>> 	compatible =3D =E2=80=9Cbar,B=E2=80=9D;
>>>> };
>>>>=20
>>>> Your manager can simply use a changeset to enable A and put a property=
 there
>>>> (example done using the extended helper API for clarity).
>>>>=20
>>>> 	struct of_changeset cset;
>>>> 	struct device_node *np =3D of_find_node_by_path(=E2=80=9C/devA=E2=80=
=9D);
>>>>=20
>>>> 	of_changeset_init(&cset);
>>>> 	of_changeset_add_property_bool(&cset, np, =E2=80=9Cinvert-x=E2=80=9D)=
;
>>>> 	of_changeset_update_property_string(&cset, np, =E2=80=9Cstatus=E2=80=
=9D, =E2=80=9Cokay=E2=80=9D);
>>>>=20
>>>> 	of_changeset_apply(&cset);
>>>=20
>>> Cool that looks quite nice / easy. 2 questions on the above:
>>>=20
>>> 1) Is the functionality needed by the above snippet in mainline ?
>>=20
>> Changesets are in mainline; The extended API for the example above is no=
t.
>=20
> The reason being that you sent it just before the merge window and there=
=20
> was a comment on it that has not been addressed.
>=20

True. I ran out of time and $JOB interfered. I hope I=E2=80=99ll be able to=
 sent out
a new patchset this week.

> Rob

Regards

=E2=80=94 Pantelis

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
