From: Florian Fainelli <florian@openwrt.org>
Subject: Re: [PATCH 1/4] mv643xx_eth: add Device Tree bindings
Date: Fri, 29 Mar 2013 19:25:30 +0100
Message-ID: <5155DC9A.6050806@openwrt.org>
References: <1364580879-4297-1-git-send-email-florian@openwrt.org> <1364580879-4297-2-git-send-email-florian@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1364580879-4297-2-git-send-email-florian@openwrt.org>
Sender: netdev-owner@vger.kernel.org
To: Florian Fainelli <florian@openwrt.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, thomas.petazzoni@free-electrons.com, jm@lentin.co.uk, moinejf@free.fr, sebastian.hesselbarth@gmail.com, buytenh@wantstofly.org, andrew@lunn.ch, jason@lakedaemon.net, grant.likely@secretlab.ca, rob.herring@calxeda.com
List-Id: devicetree@vger.kernel.org

Le 03/29/13 19:14, Florian Fainelli a =C3=A9crit :
> This patch adds Device Tree bindings following the already defined
> bindings at Documentation/devicetree/bindings/marvell.txt. The bindin=
g
> documentation is also enhanced with new optionnal properties required
> for supporting certain devices (RX/TX queue and SRAM). Since we now h=
ave
> proper support for the orion MDIO bus driver, there is no need to fid=
dle
> around with device tree phandles.
>
> Signed-off-by: Florian Fainelli <florian@openwrt.org>
> ---

[snip]

>
> -	return 0;
> +	return of_platform_bus_probe(np, mv643xx_eth_match, &pdev->dev);

This breaks on non-OF builds, I will wait for more comments to show up=20
and fix this in the next round.
--
=46lorian
