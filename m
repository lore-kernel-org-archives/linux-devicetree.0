From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH] of_net: add mtd-mac-address support to
 of_get_mac_address()
Date: Wed, 17 Apr 2019 10:06:14 +0200
Message-ID: <20190417080614.edt25ynuvae5fn64@flea>
References: <1555445100-30936-1-git-send-email-ynezz@true.cz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gikqjjwjdxbksuco"
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1555445100-30936-1-git-send-email-ynezz@true.cz>
Sender: netdev-owner@vger.kernel.org
To: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Frank Rowand <frowand.list@gmail.com>, John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>
List-Id: devicetree@vger.kernel.org


--gikqjjwjdxbksuco
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2019 at 10:05:00PM +0200, Petr =C5=A0tetiar wrote:
> From: John Crispin <john@phrozen.org>
>
> Many embedded devices have information such as MAC addresses stored
> inside MTD devices. This patch allows us to add a property inside a node
> describing a network interface. The new property points at a MTD
> partition with an offset where the MAC address can be found.
>
> This patch has originated in OpenWrt some time ago, so in order to
> consider usefulness of this patch, here are some real-world numbers
> which hopefully speak for themselves:
>
>  * mtd-mac-address                used 497 times in 357 device tree files
>  * mtd-mac-address-increment      used  74 times in  58 device tree files
>  * mtd-mac-address-increment-byte used   1 time  in   1 device tree file
>
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> [cleanup of the patch for upstream submission]
> Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>

NVMEM is supported by of_net already and there's an MTD-to-nvmem
bridge already, so it doesn't look really necessary to create
additional properties that cover the same use case.

(or at least, you should explain why nvmem doesn't work there)

Maxime
--gikqjjwjdxbksuco--
