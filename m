From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 3/4] arm64: dts: Add mediatek MT8173 SoC and  evaluation board dts and Makefile
Date: Tue, 23 Dec 2014 22:07:45 +0100
Message-ID: <1947751.D0rZorCFoT@wuerfel>
References: <1418825853-10934-1-git-send-email-eddie.huang@mediatek.com> <1419321723.14341.38.camel@mtksdaap41> <72aa7f4069a000c6e39c53e328015aa3@www.loen.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <72aa7f4069a000c6e39c53e328015aa3-PqNocJHN/zZWj0EZb7rXcA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yh.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Robert Richter <rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "Joe.C" <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 23 December 2014 08:43:55 Marc Zyngier wrote:
> 
> > Neverthless, MT8173 SoC already use 0x10224000 and 0x10225000 as VGIC
> > base address.
> 
> Then its fate is sealed virtualization wise.

It should still work with 4kb pages on the host, right? Would that still
allow you to have 64kb pages on the guest, or does the guest page size
have to be smaller or equal to the host?

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
