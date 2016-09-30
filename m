From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 1/3] Documentation: dt: net: add mt76 wireless device binding
Date: Fri, 30 Sep 2016 16:36:43 +0200
Message-ID: <201609301636.43363.arnd@arndb.de>
References: <20160905095128.80560-1-nbd@nbd.name> <201609300041.41876.arnd@arndb.de> <3334122f-0d79-f910-a414-5b9cafd9901f@nbd.name>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3334122f-0d79-f910-a414-5b9cafd9901f-Vt+b4OUoWG0@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
Cc: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday 30 September 2016, Felix Fietkau wrote:
> >> >> + pcie0 {
> >> >> +         mt76@0,0 {
> >> >> +                 reg = <0x0000 0 0 0 0>;
> > 
> > Maybe have an examplep of a real register address other than zero?
> This is a real example referring to the first device on a PCI bus.
> I copy&pasted this from a .dts file that we use in LEDE.

Ok, I see.

> >> >> +                 device_type = "pci";
> >> >> +                 mediatek,mtd-eeprom = <&factory 0x8000>;
> >> >> +                 mediatek,2ghz = <0>;
> > 
> > It's not clear what the possible values for the 2ghz property are,
> > can you be more verbose in the description? How is <0> different
> > from no property?
> 0 means disabled, no property means unchanged (compared to EEPROM).

Maybe have a boolean property instead then to say "mediatek,2ghz-disabled" ?

If zero is the only possible value, there is no need to put a number in there.

	Arnd
