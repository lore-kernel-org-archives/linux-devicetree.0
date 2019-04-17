From: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
Subject: Re: [PATCH] of_net: add mtd-mac-address support to
 of_get_mac_address()
Date: Wed, 17 Apr 2019 11:49:21 +0200
Message-ID: <20190417094921.GB79403@meh.true.cz>
References: <1555445100-30936-1-git-send-email-ynezz@true.cz>
 <20190417080614.edt25ynuvae5fn64@flea>
Reply-To: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190417080614.edt25ynuvae5fn64@flea>
Sender: netdev-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Frank Rowand <frowand.list@gmail.com>, John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>
List-Id: devicetree@vger.kernel.org

Maxime Ripard <maxime.ripard@bootlin.com> [2019-04-17 10:06:14]:

Hi Maxime,

> On Tue, Apr 16, 2019 at 10:05:00PM +0200, Petr Štetiar wrote:
> > From: John Crispin <john@phrozen.org>
> >
> > Many embedded devices have information such as MAC addresses stored
> > inside MTD devices. This patch allows us to add a property inside a node
> > describing a network interface. The new property points at a MTD
> > partition with an offset where the MAC address can be found.
> >
> > This patch has originated in OpenWrt some time ago, so in order to
> > consider usefulness of this patch, here are some real-world numbers
> > which hopefully speak for themselves:
> >
> >  * mtd-mac-address                used 497 times in 357 device tree files
> >  * mtd-mac-address-increment      used  74 times in  58 device tree files
> >  * mtd-mac-address-increment-byte used   1 time  in   1 device tree file
> 
> NVMEM is supported by of_net already and there's an MTD-to-nvmem
> bridge already, so it doesn't look really necessary to create
> additional properties that cover the same use case.

if those use cases could be handled with NVMEM, then I'm all in. As I can't
find any example in some device tree file in the kernel tree yet and the
documentation isn't clear to me about this topic either, could you please help
me and provide me with some NVMEM based example for the following simplified
use case? Or what do I need to bend/patch in order to support this within
NVME.

&spi {
	flash@0 {
		compatible = "jedec,spi-nor";

		mtdparts: partitions {
			compatible = "fixed-partitions";

			art: partition@50000 {
				label = "factory";
				reg = <0x050000 0x010000>;
				read-only;
			};
		};
	};
};

&eth0 {
	mtd-mac-address = <&art 0x4>;
};

&eth1 {
	mtd-mac-address = <&art 0x04>;
	mtd-mac-address-increment = <1>;
};

&wmac {
	mtd-mac-address = <&art 0x04>;
	mtd-mac-address-increment = <2>;
};

I would like to point out, that this proposed patch is currently handling only
some of the use cases within OpenWrt tree as well, merely those where the
vendor of the device is providing MAC address in the NVMEM as an array of 6
bytes.

Unfortunately there are creative vendors which provide MAC addresses in the
NVMEM as ASCII text in following two formats (hexdump -C /dev/mtdX):

 00000090  57 2e 4c 41 4e 2e 4d 41  43 2e 41 64 64 72 65 73  |W.LAN.MAC.Addres|
 000000a0  73 3d 30 30 39 30 46 45  43 39 43 42 45 35 00 48  |s=0090FEC9CBE5.H|
 000000b0  57 2e 4c 41 4e 2e 32 47  2e 30 2e 4d 41 43 2e 41  |W.LAN.2G.0.MAC.A|
 000000c0  64 64 72 65 73 73 3d 30  30 39 30 46 45 43 39 43  |ddress=0090FEC9C|
 000000d0  42 45 36 00 48 57 2e 4c  41 4e 2e 35 47 2e 30 2e  |BE6.HW.LAN.5G.0.|
 000000e0  4d 41 43 2e 41 64 64 72  65 73 73 3d 30 30 39 30  |MAC.Address=0090|
 000000f0  46 45 43 39 43 42 45 37  00 48 57 2e 57 41 4e 2e  |FEC9CBE7.HW.WAN.|
 00000100  4d 41 43 2e 41 64 64 72  65 73 73 3d 30 30 39 30  |MAC.Address=0090|
 00000110  46 45 43 39 43 42 45 34  00 00 00 00 00 00 00 00  |FEC9CBE4........|

 (From https://github.com/openwrt/openwrt/pull/1448#issuecomment-442476695)

 00000170  39 7a 71 05 83 6b bd 9c  a7 45 fb 69 6e 27 a2 56  |9zq..k...E.in'.V|
 00000180  66 61 63 5f 6d 61 63 20  3d 20 44 34 3a 45 45 3a  |fac_mac = D4:EE:|
 00000190  30 37 3a 33 33 3a 36 43  3a 32 30 0a 42 44 49 4e  |07:33:6C:20.BDIN|
 000001a0  46 4f 5f 45 4e 44 0a 00  ff ff ff ff ff ff ff ff  |FO_END..........|

 (From https://github.com/openwrt/openwrt/pull/1906#issuecomment-483881911)

And those use cases are currently handled within OpenWrt by workarounds in the
user space[1] like this one for example:

 echo $(macaddr_add "$(mtd_get_mac_ascii u-boot-env ethaddr)" 1) > /sys${DEVPATH}/macaddress

So I'm wondering how this could be handled with NVMEM as well. I've simply
though, that I would try to fix this with some device tree based solution as I
think, that this information belongs to the device tree and shouldn't be
handled in the user space.

I was thinking about adding `mtd-mac-address-ascii` (or similar) device tree
based solution to handle the MAC addresses in 0090FEC9CBE4 and
00:90:FE:C9:CB:E4 ascii/text formats as well.

1.  https://github.com/openwrt/openwrt/blob/master/target/linux/ath79/base-files/etc/hotplug.d/ieee80211/10_fix_wifi_mac

-- ynezz
