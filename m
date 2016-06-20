From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: Auto-detecting touchscreen controller and dealing
 with hw configuration differences on q8 tablets
Date: Mon, 20 Jun 2016 15:22:21 +0300
Message-ID: <7FA186CB-9BF2-47A6-835C-06AD63CF8837@konsulko.com>
References: <bc978925-46a4-c069-8793-903a87ec70b8@redhat.com> <5E70AD96-4E8E-4430-AF99-0AA0FCF5F8E7@konsulko.com> <17e69e9e-06be-dc4f-cd47-152f6290d2ec@redhat.com>
Reply-To: pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCV5BG4UVENBB5N7T65QKGQE7DJRP2Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <17e69e9e-06be-dc4f-cd47-152f6290d2ec-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org" <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Jelle van der Waa <jelle-oJJ1AqDjjO4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Hans,

> On Jun 20, 2016, at 14:03 , Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>=20
> Hi,
>=20
> On 20-06-16 11:27, Pantelis Antoniou wrote:
>> Hi Hans,
>>=20
>> I=E2=80=99m going to commend only on the overlay related parts since I=
=E2=80=99m not I
>> get all the nuances right.
>=20
> No problem and thanks for the answer anyways!
>=20
>>> On Jun 19, 2016, at 14:06 , Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>=20
> <snip>
>=20
>>> 2) Give the user some way to override the dts settings.
>>>=20
>>> Which after a somewhat long intro brings me to the actual purpose of th=
is thread, discuss
>>> how to best deal with this. I again see 2 options:
>>>=20
>>> 1) Put a disabled gsl1680 node in the dts file, have a q8_autodetect.c =
in u-boot
>>> which probes i2c and if it finds the gsl1680 nodes enables it, and patc=
hes in a best-effort
>>> default for which fw file to use. Allow the user to set a touchscreen_f=
w u-boot env
>>> variable which will override this. Also allow the user to set a touchsc=
reen_inverted_x env
>>> variable to add inverted-x to the dt node for the gsl1680.
>>>=20
>>=20
>> That can work. The problem is that having anything requiring smarts in u=
-boot always
>> leads to trouble with users. It all depends on your user=E2=80=99s techn=
ical proficiency, if
>> they are comfortable tweaking things in u-boot it=E2=80=99s fine. If it=
=E2=80=99s not, expect lots of
>> bricked boards when they mess up.
>>=20
>>> 2) Write an in kernel overlay manager which does auto-detect as describ=
ed by 1, and
>>> loads an overlay for the detected touchscreen controller, with module o=
ptions to allow
>>> specifying the fw-file, x-inversion, etc.
>>>=20
>>> One things which worries me about 2. is that we would need to have 2 ov=
erlay files
>>> per fw-file, one regular config, one inverted-x, or is it possible for =
the overlay
>>> manager to modify an overlay before applying it ?
>>>=20
>>=20
>> Yes, it=E2=80=99s quite possible. You can even have stacked overlays.
>=20
> Ok, is there any example code how to change an overlay before applying it=
 out there,
> or if not can you point to the functions to use to do this ?
>=20

The canonical place for all the dynamic DT stuff is

https://github.com/pantoniou/linux-beagle-track-mainline/tree/bbb-overlays

The beaglebone cape manager is here.

https://github.com/pantoniou/linux-beagle-track-mainline/commit/5028d1ed3be=
b8c75b28fce37b1bb5ee551b2ae9e

> Specifically my plan is to:
>=20
> 1) Have a single overlay for q8 tablets with gsl1680 tablets
>=20
> 2) Write an in kernel overlay manager which when it detects a gsl1680 tou=
chscreen
> will pick a best-default firmware-file + matching resolution + swap-x-y b=
ased on
> which SoC (A13/A23/A33) the tablet is based on as well as the gsl1680's c=
hip-id
> and will then "patch" this info into the overlay before applying it. This
> means being able to set / modify several string, int and bool dt properti=
es.
>=20
> 3) Offer a kernel-module option for the overlaymanager which will allows
> overriding the defaults for the firmware-filename, etc. This is also
> why I want to go with the patch approach instead of having multiple
> dt-overlay files.
>=20

Hmm, your problem appears to be simpler. You already know all the possible
parts that your touchscreen/video/thingy is going to use.

You don=E2=80=99t have to use an overlay then. Overlays are built on top of
changesets.

For example, let=E2=80=99s say that you have various options for a touchscr=
een out
of a finite set.

You just put the basic configuration for each in a disable node and your
manager only needs to update the properties and set the status to enabled
for it to be enabled.

For instance let=E2=80=99s say you have an option of two devices (only one =
of them
being present).

devA {
	status =3D =E2=80=9Cdisabled=E2=80=9D;
	compatible =3D =E2=80=9Cfoo,A=E2=80=9D;
};

devB {
	status =3D =E2=80=9Cdisabled=E2=80=9D;
	compatible =3D =E2=80=9Cbar,B=E2=80=9D;
};

Your manager can simply use a changeset to enable A and put a property ther=
e
(example done using the extended helper API for clarity).

	struct of_changeset cset;
	struct device_node *np =3D of_find_node_by_path(=E2=80=9C/devA=E2=80=9D);

	of_changeset_init(&cset);
	of_changeset_add_property_bool(&cset, np, =E2=80=9Cinvert-x=E2=80=9D);
	of_changeset_update_property_string(&cset, np, =E2=80=9Cstatus=E2=80=9D, =
=E2=80=9Cokay=E2=80=9D);

	of_changeset_apply(&cset);

> Thanks & Regards,
>=20
> Hans

Regards

=E2=80=94 Pantelis

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
