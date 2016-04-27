From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: strange dtc errors after adding sram node
Date: Wed, 27 Apr 2016 22:20:44 +0200
Message-ID: <14005771.qheL7zp8t0@wuerfel>
References: <571B283F.8010707@lategoodbye.de> <10749204.4vhK495hJd@wuerfel> <57211E2A.5060807@lategoodbye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57211E2A.5060807-saaNCTdWVBT7BZbvpMY5sg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <info-saaNCTdWVBT7BZbvpMY5sg@public.gmane.org>
Cc: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause-L1vi/lXTdtsfGbAt6QbQcg@public.gmane.org>, kernelnewbies-7JyXY6prKcjpASu1u0TL5ti2O/JbrIOy@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 27 April 2016 22:16:42 Stefan Wahren wrote:
> Am 25.04.2016 um 15:06 schrieb Arnd Bergmann:
> > On Monday 25 April 2016 08:04:53 Stefan Wahren wrote:
> >>
> >> i've found reason for these errors. I missed to adjust the affected dts
> >> files which refer to the ahb node.
> >
> > Makes sense. Maybe you can just remove the address and 'reg' property from
> > the ahb node?
> 
> is this a proposal for a patch set?

Yes.

> Does it apply to all top-level nodes like apb?

Only those that have a fake "reg" property. A bus device node
can of course have its own registers, it just shouldn't list as
its "reg" the registers of its child devices.


	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
