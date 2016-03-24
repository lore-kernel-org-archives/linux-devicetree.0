From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 3/4] arm64: dts: marvell: Clean up armada-7040-db
Date: Thu, 24 Mar 2016 11:27:27 +0100
Message-ID: <87oaa4npbk.fsf@free-electrons.com>
References: <1458771861-12392-1-git-send-email-afaerber@suse.de>
	<1458771861-12392-4-git-send-email-afaerber@suse.de>
	<20160324091832.0060c907@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160324091832.0060c907-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> (Thomas Petazzoni's
	message of "Thu, 24 Mar 2016 09:18:32 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Thomas,
=20
 On jeu., mars 24 2016, Thomas Petazzoni <thomas.petazzoni@free-electro=
ns.com> wrote:

> Hello,
>
> On Wed, 23 Mar 2016 23:24:20 +0100, Andreas F=C3=A4rber wrote:
>> Instead of duplicating the node hierarchy, reference the nodes by la=
bel,
>> adding labels where necessary.
>>=20
>> Drop some trailing or inconsistent white lines while at it.
>>=20
>> Fixes: ec7e5a569bce ("arm64: dts: marvell: add Device Tree files for=
 Armada 7K/8K")
>> Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>> Signed-off-by: Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org>
>
> We haven't used this solution on Marvell Armada 32-bits SoCs, so ther=
e
> needs to be a discussion on whether we want to go in this direction f=
or
> the 64 bits SoCs.

At first view using the label helps to have simpler dts files.

Is there any cons by using it?

I agree that converting the Marvell Armada 32-bits SoCs would produce a
lot of churn. But if some binding are common there is no file at all ar=
e
in common, so we could use this solution for the 64 bits SoCs only.

Jason, Andrew, Sebastian, do you see any problem with it?

Thanks,

Gregory

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
