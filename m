From: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Subject: Re: [PATCH 3/4] arm: am33xx: DT quirks for am33xx based beaglebone variants
Date: Thu, 19 Feb 2015 20:44:39 +0200
Message-ID: <145DEB3E-A20E-4390-84B1-4B30E7C3D841@antoniou-consulting.com>
References: <1424271576-1952-1-git-send-email-pantelis.antoniou@konsulko.com> <1424271576-1952-4-git-send-email-pantelis.antoniou@konsulko.com> <20150219181656.GF32521@atomide.com> <9C7BFC7C-0751-4233-927F-D01AF078704B@antoniou-consulting.com> <20150219183600.GG32521@atomide.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150219183600.GG32521-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Tony,

> On Feb 19, 2015, at 20:36 , Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org> wrote:
>=20
> * Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org> [150219 10:32]:
>>> On Feb 19, 2015, at 20:16 , Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org> wrote:
>>>=20
>>> Uhh I don't like the idea of duplicating the i2c-omap.c driver unde=
r
>>> arch/arm.. And in general we should initialize things later rather
>>> than earlier.
>>>=20
>>> What's stopping doing these quirk checks later on time with just
>>> a regular device driver, something like drivers/misc/bbone-quirks.c=
?
>>>=20
>>=20
>> We have no choice; we are way early in the boot process, right after
>> the device tree unflattening step.
>=20
> To me it seems the dt patching part should be done with minimal
> code before any driver like features..
>=20

The way it=E2=80=99s done right now is with minimal code. Reading the E=
EPROM
is required.

>> I=E2=80=99ve toyed with the idea of using early platform devices but=
 the omap-i2c driver
>> would need some tender love and care to make it work, and I didn=E2=80=
=99t want to get
>> bogged down with i2c driver details at this point.
>=20
> ..so how about just parse a kernel cmdline for the quirks to apply
> based on a version string or similar? That can be easily populated
> by u-boot or set manually with setenv.
>=20
> That leaves out the need for tinkering with i2c super early in
> the kernel for revision detection.
>=20

You assume there=E2=80=99s going to be a bootloader=E2=80=A6

> Regards,
>=20
> Tony

Regards

=E2=80=94 Pantelis

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
