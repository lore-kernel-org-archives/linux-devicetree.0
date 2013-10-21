From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: gpmi-mtd ecc regression
Date: Mon, 21 Oct 2013 10:41:17 -0700
Message-ID: <CAN8TOE-swY_uA3u3OBt3ip-F=s3_H5hDZE=uDE5VNBGCeZc-XA@mail.gmail.com>
References: <CAJ+vNU1JWZp=JoBDJALh59yFybGZ0iQxMEYy8qvTFGDLhyRzqg@mail.gmail.com>
	<52649FDA.1030804@freescale.com>
	<CAN8TOE9+ez=t-1n+jd5d3tu+EB9YJKFeM2RKAHBf059L5TYM7A@mail.gmail.com>
	<5264DFF7.2090702@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5264DFF7.2090702-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 21, 2013 at 1:04 AM, Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wr=
ote:
> =D3=DA 2013=C4=EA10=D4=C221=C8=D5 15:21, Brian Norris =D0=B4=B5=C0:
>> Well, we do prioritize "no regressions", rather than new features. S=
o
>> we may have to do this until a proper solution can be formed.
> ok.
>
> I will create a patch to fix this regression.

Yes. We should either get it into 3.12 or mark it -stable.

> And it seems i have to add new devicetree property to enable the JFFS=
2
> support.

We cannot use device-tree to enable JFFS2 (a purely software issue),
but you could use it to specify the ECC strength or layout. Be sure to
CC devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org on any new bindings, since they need to
review bindings and tend to have good input.

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
