From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [RFC] using dt overlays: how to? today?
Date: Thu, 22 Jan 2015 22:54:42 +0200
Message-ID: <2F10D177-6F27-4019-8D2D-8F77361BB310@konsulko.com>
References: <20150122150219.GB26928@odux.rfo.atmel.com>
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150122150219.GB26928-FuRPzXQv2LUWBfJKYY8PcdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, arnd-vj4z4lbxKbc@public.gmane.org, koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Ludovic,

> On Jan 22, 2015, at 17:02 , Ludovic Desroches <ludovic.desroches@atme=
l.com> wrote:
>=20
> Hi,
>=20
> I have assisted to Pantelis' talk about device tree and overlays at E=
LCE
> 2014. Since the patch 'Introduce DT overlay support' is now part of t=
he
> mainline, I wanted to have a look about it and to use it for our boar=
ds.
>=20

Excellent.

> Firstly, this is what I want to achieve by using this feature:
> - manage several revisions of our boards
> - manage modules we can plug on the board, mainly display modules
>  (resistive or capacitive one)
> - manage cpu modules plug on the motherboard
> - I would like to have all this stuff in the kernel. I don't want a
>  dependency on the bootloader or the user space.
>=20

That=E2=80=99s awesome; that=E2=80=99s exactly what I want to use it fo=
r. Maybe this thing
can be used by others as well ;)

> At the moment, we have many dts files to manage these cases (not all =
are
> in mainline). It is becoming a pain.
>=20

Tell me about it.

> I wanted to see if we can use device tree fragments as it seems to be
> closed to be achieved when I had assisted to the talk. I have found a
> thread about 'DT-Overlay configfs interface'
> (http://thread.gmane.org/gmane.linux.drivers.devicetree/101871), ther=
e
> are still discussions about security concerns, so it may not be inclu=
ded
> quickly. I have also found an interesting thread about cape manager f=
or
> Beaglebone (http://thread.gmane.org/gmane.linux.documentation/8279) b=
ut
> there is no more activity on it, is it canceled or is there a new top=
ic
> I have missed?
>=20
> Here are my questions:
> - Is it acceptable to manage device tree fragments with a driver such=
 as
>  the cape manager? Or at an other place in the kernel such as
> arch/arm/mach-at91/board-dt-sama5.c for example?
> - Is it possible to get access to eeprom from the kernel? Pantelis di=
d
>  an interface to access it through i2c but it seems it was not
> accepted. In my case, it will be through the one wire interface.
>=20
> Thanks for sharing your opinion about this or redirecting me to a
> similar thread.
>=20

I=E2=80=99m waiting for 3.19 to go out and I=E2=80=99ll address everyth=
ing you described
above.

=46eel free to post specific requirement about your use cases, and I=E2=
=80=99ll try
to address them.

> Ludovic
> =E2=80=94

Regards

=E2=80=94 Pantelis

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
