From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v5 2/2] ARM: dts: add support for Turris Omnia
Date: Sun, 27 Nov 2016 22:22:34 +0100
Message-ID: <1405f210-0f58-463c-5353-3fdc43ac1f9d@suse.de>
References: <20161125142658.21690-1-uwe@kleine-koenig.org>
 <20161125142658.21690-3-uwe@kleine-koenig.org>
 <87lgw7ilg9.fsf@free-electrons.com>
 <a7f47999-ec83-6cc8-8119-0087dee17bac@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a7f47999-ec83-6cc8-8119-0087dee17bac-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michal Hrusecky <Michal.Hrusecky-x+rMaJPWets@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tomas Hlavacek <tomas.hlavacek-x+rMaJPWets@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, =?UTF-8?B?QmVkxZlpY2hhIEtvxaFhdHU=?= <bedrich.kosata-x+rMaJPWets@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am 27.11.2016 um 17:00 schrieb Andreas Färber:
> @Uwe: Note that I had already told CZ.NIC's Michal ~two weeks ago that I
> have a WIP .dts for the Omnia - looks like no one knows what the other
> is doing. :( My branch includes cleanups for 385 .dtsi and bug fixes for
> the switch that I am not seeing in your series:
> 
> https://github.com/afaerber/linux/commits/omnia-next

Archived at https://github.com/afaerber/linux/commits/omnia-next.pre-uwe

It seems like four out of my five switch probing bug fixes were already
resolved by Andrew in the meantime. Remaining one plus 88E6176
mini-series sent out.

Cheers,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
