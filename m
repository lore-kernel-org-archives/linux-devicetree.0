From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: strange dtc errors after adding sram node
Date: Mon, 25 Apr 2016 15:06:46 +0200
Message-ID: <10749204.4vhK495hJd@wuerfel>
References: <571B283F.8010707@lategoodbye.de> <1461407589.1986.3.camel@embedded.rocks> <571DB385.9010305@lategoodbye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <571DB385.9010305-saaNCTdWVBT7BZbvpMY5sg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <info-saaNCTdWVBT7BZbvpMY5sg@public.gmane.org>
Cc: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause-L1vi/lXTdtsfGbAt6QbQcg@public.gmane.org>, kernelnewbies-7JyXY6prKcjpASu1u0TL5ti2O/JbrIOy@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday 25 April 2016 08:04:53 Stefan Wahren wrote:
> >>>                     reg = <0x80080000 0x10000>;
> >>
> >> Follwing the address map for the i.MX28 (p. 125ff) the AHB is mapped
> >> to
> >> different start addresses:
> >>
> >> Bus  MNEMONIC        START ADDRESS
> >> --------------------------------------
> >> AHB  OCRAM           0x00000000
> >> AHB  USBCTRL0        0x80080000
> >> AHB  OCROM           0xC0000000
> >>
> >> So instead of replacing ahb@80080000 by ahb@00000000 a new node
> >> should
> >> be created. However, I am not sure if this is really necessary, I
> >> haven't seen it for all device trees using "mmio-sram".
> >
> > Sorry, for not looking carefully enough at your patch. Haven't seen you
> > adjusted the 'reg' property. I tried with an additional ahb@00000000 no
> > de and this did work.
> >
> > So, there is really something odd here...
> 
> i've found reason for these errors. I missed to adjust the affected dts 
> files which refer to the ahb node.

Makes sense. Maybe you can just remove the address and 'reg' property from
the ahb node? That should solve the dtc problem and make the contents
more like what we have elsewhere.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
