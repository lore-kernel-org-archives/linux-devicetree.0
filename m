From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v4 8/8] arm64: dts: rockchip: Add Landingship config
Date: Wed, 30 Mar 2016 00:18:58 +0200
Message-ID: <56FAFF52.3000301@suse.de>
References: <1458136727-32075-1-git-send-email-afaerber@suse.de>
 <1458136727-32075-9-git-send-email-afaerber@suse.de>
 <3754303.PKl0CGdnnX@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3754303.PKl0CGdnnX@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am 29.03.2016 um 22:18 schrieb Heiko St=FCbner:
> This needs a commit message explaining the i2c1/i2c2 voodoo below - e=
specially=20
> as this is the only difference to the core geekbox board.

You're probably right about the commit message, but there is no voodoo
about i2c2 below.

Would you rather have i2c1 dropped for now? Having it disabled at least
documents that the connectors are there.

=46rom a distro perspective I like dtb filename stability and not needi=
ng
to mess with filename changing from .dtb to -landingship.dtb, so I
rather add it from the start than later as more nodes get added.

> And I'm still not fully convinced about having the landing ship separ=
ate.

Separate would've been copy&paste! It's using the preprocessor
specifically to avoid having them be separate.

> I guess I'll just go to the talk about "Portable Device Tree Connecto=
r:=20
> Painless Expansion Board Support" [0] on monday to help make up my mi=
nd ;-) .

This is not a random expansion board to exchange, it's a baseboard and
as we found out one very specific to this module, so no reuse unlike
Shields. As mentioned elsewhere, I2C are not the only difference,
they're the only difference _for now_. USB-SATA bridge comes for free
via USB node; there's four GPIO buttons to be figured out, an I2S codec
somewhere, display options (that I cannot test myself) and additional
regulator(s) needed.

Do enjoy the talk and report your findings. The pure existence of
overlays for Beagleboard is not convincing to me for dropping this patc=
h
though - we've had similar discussions among distro people before
settling for EFI boot. Reality is messy, unfortunately. For an FPGA I'v=
e
grudgingly agreed that given a sane U-Boot one can use dtb commands to
add a couple nodes via a boot.scr, sanitizing the matrix of hardware
models x FPGA bitstreams to just the hardware models; however this
Landingship board is actually sold in hardware and is the only sane
rk3368 devboard to date rather than just some bitstream file, and we at
openSUSE are looking to abandon boot.scr in favor of generic bootefi,
running counter to that idea. Here I'm still dealing with a vendor
U-Boot, so neither works for now, only supplying a feature-complete .dt=
b
in the resource image partition does, which I need to build from
something - this patch. So no is not a solution. And it's not like
you're swamped in rk3368 .dts files anyway.

Thanks for queuing the core bits,

Andreas

> [0] http://openiotelc2016.sched.org/event/6DA4/portable-device-tree-c=
onnector-painless-expansion-board-support-pantelis-antoniou-konsulko-gr=
oup
[...]
>> +&i2c1 {
>> +	status =3D "disabled";
>> +};
>> +
>> +&i2c2 {
>> +	status =3D "okay";
>> +};

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Felix Imend=F6rffer, Jane Smithard, Graham Norton; HRB 21284 (AG N=FC=
rnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
