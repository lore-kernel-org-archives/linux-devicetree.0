From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/4] arm64: dts: marvell: Clean up armada-3720-db
Date: Fri, 25 Mar 2016 09:16:04 +0100
Message-ID: <87oaa3m0qj.fsf@free-electrons.com>
References: <1458771861-12392-1-git-send-email-afaerber@suse.de>
	<1458771861-12392-2-git-send-email-afaerber@suse.de>
	<87zitnn9ds.fsf@free-electrons.com> <56F419CA.9010400@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56F419CA.9010400-l3A5Bk7waGM@public.gmane.org> ("Andreas =?utf-8?Q?F=C3=A4rber=22?=
 =?utf-8?Q?'s?= message of "Thu,
	24 Mar 2016 17:46:02 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Andreas,
=20
 On jeu., mars 24 2016, Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org> wrote:

> Hi Gregory,
>
> Am 24.03.2016 um 17:11 schrieb Gregory CLEMENT:
>>> +/*
>>> + * Exported on the micro USB connector CON32
>>> + * through an FTDI
>>> + */
>>=20
>> As the comment didn't start anymore from the middle of the line, we
>> could have it an a single line. We don't have to split in 2 lines.
>
> Sure. Should I change that along with 4/4 in a v2? It'll be after the
> Easter holidays.

Yes please and no problem for wiating for after the Easter holidays I
won't apply the patch on the mvebu branches before the release of the
v4.6-rc1.

Thanks,

Gregory

>
> Regards,
> Andreas
>
> --=20
> SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton; HRB 21284 (=
AG N=C3=BCrnberg)

--=20
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
