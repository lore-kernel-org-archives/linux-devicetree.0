From: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: mvebu: Add Armada 38x labels and clean up
 Turris Omnia
Date: Mon, 28 Nov 2016 10:58:36 +0000
Message-ID: <20161128105836.GU14217@n2100.armlinux.org.uk>
References: <1fc18002-0144-8300-1888-09f456860ef0@kleine-koenig.org>
 <1480272700-28888-1-git-send-email-afaerber@suse.de>
 <20161128103738.GT14217@n2100.armlinux.org.uk>
 <4ad1108a-43c4-46f8-4683-1c4b89996036@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4ad1108a-43c4-46f8-4683-1c4b89996036-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>, Michal Hrusecki <Michal.Hrusecky-x+rMaJPWets@public.gmane.org>, Tomas Hlavacek <tomas.hlavacek-x+rMaJPWets@public.gmane.org>, =?utf-8?B?QmVkxZlpY2hhIEtvxaFhdHU=?= <bedrich.kosata-x+rMaJPWets@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 28, 2016 at 11:52:26AM +0100, Andreas Färber wrote:
> Hi Russell,
> 
> Am 28.11.2016 um 11:37 schrieb Russell King - ARM Linux:
> > On Sun, Nov 27, 2016 at 07:51:39PM +0100, Andreas Färber wrote:
> >> To more consistently reference nodes by label, add labels for sata,
> >> usb2, sdhci and usb3 nodes.
> >>
> >> Convert all other 38x boards for consistency. Add labels for nfc and rtc.
> > 
> > Please don't do this for clearfog - there's changes in the pipeline which
> > completely replace armada-388-clearfog.dts because there's a "base" and
> > "pro" versions of this hardware now, and making such a huge change will
> > effectively mean we have to start over with the DT files.
> 
> Would it help to split it back up into a series of add-labels,
> use-labels like I had originally? Then you could start using them in
> your refactoring as soon as the add-labels patch gets applied. Or are
> you completely against this style?

What I mentioned is not a case of a work in progress, it's already out
in the wild, and completely changing the clearfog dts file by changing
the style of DT references will make applying the changes _much_ more
difficult - not only obviously impossible to apply the original patch,
but also quite impossible to identify the changes made downstream.

So, I'd rather armada-388-clearfog.dts is not touched at all as it _will_
cause conflicts, but I have nothing against the new style (and I actually
prefer it.)

What I'm asking is that you don't make other people's lives harder than
they need to be.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
