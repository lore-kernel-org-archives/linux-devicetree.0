From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH net 0/3] add property "nvmem_macaddr_swap" to swap
 macaddr bytes order
Date: Fri, 10 May 2019 13:31:55 +0200
Message-ID: <20190510113155.mvpuhe4yzxdaanei@flea>
References: <1557476567-17397-4-git-send-email-fugang.duan@nxp.com>
 <1557476567-17397-3-git-send-email-fugang.duan@nxp.com>
 <1557476567-17397-2-git-send-email-fugang.duan@nxp.com>
 <1557476567-17397-1-git-send-email-fugang.duan@nxp.com>
 <20190510112822.GT81826@meh.true.cz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xg7fylka47a3m4qs"
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190510112822.GT81826@meh.true.cz>
Sender: netdev-owner@vger.kernel.org
To: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
Cc: Andy Duan <fugang.duan@nxp.com>, "davem@davemloft.net" <davem@davemloft.net>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "john@phrozen.org" <john@phrozen.org>, "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Alban Bedel <albeu@free.fr>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--xg7fylka47a3m4qs
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2019 at 01:28:22PM +0200, Petr =C5=A0tetiar wrote:
> Andy Duan <fugang.duan@nxp.com> [2019-05-10 08:23:58]:
>
> Hi Andy,
>
> you've probably forget to Cc some maintainers and mailing lists, so I'm
> adding them now to the Cc loop. This patch series should be posted against
> net-next tree as per netdev FAQ[0], but you've to wait little bit as
> net-next is currently closed for the new submissions and you would need to
> resend it anyway.
>
> 0. https://www.kernel.org/doc/html/latest/networking/netdev-FAQ.html
>
> > ethernet controller driver call .of_get_mac_address() to get
> > the mac address from devictree tree, if these properties are
> > not present, then try to read from nvmem. i.MX6x/7D/8MQ/8MM
> > platforms ethernet MAC address read from nvmem ocotp eFuses,
> > but it requires to swap the six bytes order.
>
> Thanks for bringing up this topic, as I would like to extend the
> functionality as well, but I'm still unsure how to tackle this and where,
> so I'll (ab)use this opportunity to bring other use cases I would like to
> cover in the future, so we could better understand the needs.
>
> This reverse byte order format/layout is one of a few other storage forma=
ts
> currently used by vendors, some other (creative) vendors are currently
> providing MAC addresses in NVMEMs as ASCII text in following two formats
> (hexdump -C /dev/mtdX):
>
>  a) 0090FEC9CBE5 - MAC address stored as ASCII without colon between octe=
ts
>
>   00000090  57 2e 4c 41 4e 2e 4d 41  43 2e 41 64 64 72 65 73  |W.LAN.MAC.=
Addres|
>   000000a0  73 3d 30 30 39 30 46 45  43 39 43 42 45 35 00 48  |s=3D0090FE=
C9CBE5.H|
>   000000b0  57 2e 4c 41 4e 2e 32 47  2e 30 2e 4d 41 43 2e 41  |W.LAN.2G.0=
=2EMAC.A|
>
>   (From https://github.com/openwrt/openwrt/pull/1448#issuecomment-4424766=
95)
>
>  b) D4:EE:07:33:6C:20 - MAC address stored as ASCII with colon between oc=
tets
>
>   00000180  66 61 63 5f 6d 61 63 20  3d 20 44 34 3a 45 45 3a  |fac_mac =
=3D D4:EE:|
>   00000190  30 37 3a 33 33 3a 36 43  3a 32 30 0a 42 44 49 4e  |07:33:6C:2=
0.BDIN|
>
>   (From https://github.com/openwrt/openwrt/pull/1906#issuecomment-4838819=
11)
>
> > The patch set is to add property "nvmem_macaddr_swap" to swap
> > macaddr bytes order.
>
> so it would allow following DT construct (simplified):
>
>  &eth0 {
> 	nvmem-cells =3D <&eth0_addr>;
> 	nvmem-cell-names =3D "mac-address";
> 	nvmem_macaddr_swap;
>  };
>
> I'm not sure about the `nvmem_macaddr_swap` property name, as currently t=
here
> are no other properties with underscores, so it should be probably named =
as
> `nvmem-macaddr-swap`. DT specs permits use of the underscores, but the
> estabilished convention is probably prefered.
>
> In order to cover all above mentioned use cases, it would make more sense
> to add a description of the MAC address layout to the DT and use this
> information to properly postprocess the NVMEM content into usable MAC
> address?
>
> Something like this?
>
>  - nvmem-cells: phandle, reference to an nvmem node for the MAC address
>  - nvmem-cell-names: string, should be "mac-address" if nvmem is to be us=
ed
>  - nvmem-mac-address-layout: string, specifies MAC address storage layout.
>    Supported values are: "binary", "binary-swapped", "ascii", "ascii-deli=
mited".
>    "binary" is the default.
>
> Or perhaps something like this?
>
>  - nvmem-cells: phandle, reference to an nvmem node for the MAC address
>  - nvmem-cell-names: string, should be any of the supported values.
>    Supported values are: "mac-address", "mac-address-swapped",
>    "mac-address-ascii", "mac-address-ascii-delimited".
>
> I'm more inclined towards the first proposed solution, as I would like to
> propose MAC address octet incrementation feature in the future, so it wou=
ld
> become:
>
>  - nvmem-cells: phandle, reference to an nvmem node for the MAC address
>  - nvmem-cell-names: string, should be "mac-address" if nvmem is to be us=
ed
>  - nvmem-mac-address-layout: string, specifies MAC address storage layout.
>    Supported values are: "binary", "binary-swapped", "ascii", "ascii-deli=
mited".
>    "binary" is the default.
>  - nvmem-mac-address-increment: number, value by which should be
>    incremented MAC address octet, could be negative value as well.
>  - nvmem-mac-address-increment-octet: number, valid values 0-5, default i=
s 5.
>    Specifies MAC address octet used for `nvmem-mac-address-increment`.
>
> What do you think?

It looks to me that it should be abstracted away by the nvmem
interface and done at the provider level, not the customer.

Maxime
--xg7fylka47a3m4qs--
