From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH] of: Overlay manager
Date: Fri, 9 Sep 2016 22:26:25 +0300
Message-ID: <08C47A45-3704-4181-B065-B0E5975B878B@konsulko.com>
References: <001a113447d4718cb9053c04f991@google.com> <57D1D344.8010306@gmail.com> <CAH7ZN-w2U9g4m9hDdD1kY52HLzv+TSbuNVRbmzmE3WMH0wC8Tw@mail.gmail.com> <CAL_JsqKe99WLoeOrRz76mUx-QruhDU+4kqCAepgZa0LhSYbgDg@mail.gmail.com> <CALAqxLVPdZxMy+W0VEJqX+L9CCy4cBsc0s48BwepSA8-ApUhtQ@mail.gmail.com> <CAL_JsqKgGFPKZR8fJ-CRQubNjWH0q_V9B9SsXoHncT9dMGdF1w@mail.gmail.com> <CALAqxLXLNQZMCrgLGa-=nGFbB-XVbs9FHXnGrksCO8V_mAkK0w@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CALAqxLXLNQZMCrgLGa-=nGFbB-XVbs9FHXnGrksCO8V_mAkK0w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: John Stultz <john.stultz@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Dmitry Shmidt <dimitrysh@google.com>, Frank Rowand <frowand.list@gmail.com>, "<linux-kernel@vger.kernel.org>" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>
List-Id: devicetree@vger.kernel.org

Hi John,

> On Sep 9, 2016, at 06:06 , John Stultz <john.stultz@linaro.org> wrote:
>=20
> On Thu, Sep 8, 2016 at 7:27 PM, Rob Herring <robh+dt@kernel.org> =
wrote:
>> On Thu, Sep 8, 2016 at 7:39 PM, John Stultz <john.stultz@linaro.org> =
wrote:
>>> On Thu, Sep 8, 2016 at 5:33 PM, Rob Herring <robh+dt@kernel.org> =
wrote:
>>>> If you can figure out how to change the command line, then you can
>>>> just change the dtb. At least for how Android boot works, those =
aren't
>>>> really changed separately.
>>>=20
>>> Ehh.. that's not so simple. The dtb is often appended to the kernel =
on
>>> Android devices. Changing the boot arguments is much simpler to do.
>>=20
>> How? You typically make a new bootimage assembling the kernel/dtb,
>> ramdisk and kernel command-line. If things were done differently such
>> that the dtb is part of the bootloader (how it is supposed to be
>> done), then I would buy the argument that we can't update the dtb and
>> need to either have a way to add and/or select overlays. But Android
>> folks like to update *everything*, so I don't buy that here.
>=20
> So in many cases the dtb is appended when the kernel is built, not
> when the abootimg is assembled.
>=20
> So its much easier to use abootimg -u to update a prebuilt boot.img in
> place and reflash. That way users don't need to regenerate the kernel
> w/ appended dtb.
>=20

I understand what you=E2=80=99re trying to do, but it=E2=80=99s not =
going to work.

It will only work for a very small subset of overlays since you can=E2=80=99=
t
have more than a single phandle label.

For instance this will not work:

overlays {
	overlay_0 {
		opt: opt_0 { bar; };
	};
	overlay_1 {
		opt: opt_1 { baz; };
	};
};


frob_device {
	compatible =3D =E2=80=9Cfrob=E2=80=9D;
	use =3D <&opt>;
};

If your use case is simple enough you=E2=80=99ll never hit this, but it =
does happen in
more complex examples.

> thanks
> -john

Regards

=E2=80=94 Pantelis
