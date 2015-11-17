From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [RFC] rpi: add support to enable usb power domain
Date: Tue, 17 Nov 2015 13:46:32 -0800
Message-ID: <8761105mfb.fsf@eliezer.anholt.net>
References: <1446064810-5064-1-git-send-email-alex.aring@gmail.com> <87a8r1pkfz.fsf@eliezer.anholt.net> <20151102084557.GA1342@omega>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151102084557.GA1342@omega>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Aring <alex.aring-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org, zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, apw-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Alexander Aring <alex.aring-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> Hi,
>
> On Thu, Oct 29, 2015 at 12:02:24PM -0700, Eric Anholt wrote:
>> Alexander Aring <alex.aring-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>>=20
>> > This patch adds support for RPi several Power Domains and enable suppo=
rt
>> > to enable the USB Power Domain when it's not enabled before.
>> >
>> > This patch based on Eric Anholt's patch to support Power Domains. He h=
ad
>> > an issue about -EPROBE_DEFER inside the power domain subsystem, this
>> > issue was solved by commit <311fa6a> ("PM / Domains: Return -EPROBE_DE=
FER
>> > if we fail to init or turn-on domain").
>> >
>> > It was tested with barebox and the following scripts before booting
> ...
>> > Third:
>> > The barebox regulator doesn't support right now to enable/disable
>> > regulators at runtime but I want to bring this mainline in the next
>> > days. So you can't check yourself if the above scripts working right
>> > now. I describe it here to show you what exactly I tested.
>> >
>> > changes since Eric Anholts "power domain" patch:
>> >  - add for me all known power domains of the RPi, it contains the doma=
ins
>> >    0 - 9.
>>=20
>> Note: None of the power domain enums other than the ones I'd had in my
>> patch are actually connected to anything in the firmware.  I don't think
>> we should be adding them, given that.
>
> Okay. Then it makes sense that I still accessing UART and SDHC when I
> turn off the power.
>
> In you patch you had SDHC, USB, DSI. Are you sure that SDHC power domain
> has any effect, because I don't see any effect and can still access the
> sd card.

It looks like the SDCARD domain is kept always on, even if we ask for it
off.  We can clear the always-on flag by setting domain 29 in
MBOX_CHAN_POWER.  It's not accessible from the property channel, unless
I've misread the logic.

Yet another reason I'm hoping to write a native power domain driver.

> I would add the power-domains where we have currently an use-case for it
> and this USB at the moment. Is this okay for you?

Sounds good to me.  I'll probably extend that for V3D.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWS6A4AAoJELXWKTbR/J7o8PQQAKbA2A95f5DG/bAOHdo9rys6
iSaWJg5EHCkd0SHn3R5r4EKmQzecGjymSfTHDs/zANPKA8LLs4aLuszIcdn++OJe
5LBIrFhQCauvAu/vC0ltW82EbFVNRv5A/qDP9eUqr96BR25Ij0a1zerGvZzEb1wH
pfn40bKD2sdvitI7renZyXpfXeXjHV4LnCnIskhUd2O8g9xJDG54yhMdyRGGd9hD
/8gMrYvTplJErySacvtxns21rEs4g8+bZ4bwI+3Izbk7YreRf7nBmFUNf1hK7HiS
q81sc0GcNbkB76nuvGKhaWHhwCKNpNROOmlKgboK3X1CjjjtYQJ0cdK+MA88nmst
Dyp59FL4M3pd11V4XNKVmQilfdoJZRynewQf2szoAya27OXhZMxemK3eKPIkpZrV
5liLNigR5gbzOdCc21yurhRgc21UXRC4ND79yQoUR27V52aU3b/5eaB8D5rRli85
DnfJgWTgsvD1GNSuuz8LanHO06lEAJNhbduacwtv9sE0YkuMN2ww/O8dP9lgHK2x
k0Y63/S4z7uUQ9gyFbPMTPQWDBx6gOmmfZNCoCqDnLvQ2gL2/ZRV0D54hLewh7QV
pyRNp0Vft5cRuqAJVb2N5j3DLqu6iKRQdnfDHTKaBxL/Z7bAOgilAEQQ+W3vLaLA
soz5kEUPyYuxJ4UVChoa
=miUp
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
