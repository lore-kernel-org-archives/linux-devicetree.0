From: Razvan Stefanescu <razvan.stefanescu@nxp.com>
Subject: RE: [PATCH net-next 5/8] net: mscc: Add initial Ocelot switch support
Date: Fri, 30 Mar 2018 07:02:12 +0000
Message-ID: <AM3PR04MB0743F2211B206D25B7D0A514E6A10@AM3PR04MB0743.eurprd04.prod.outlook.com>
References: <20180323201117.8416-1-alexandre.belloni@bootlin.com>
 <20180323201117.8416-6-alexandre.belloni@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180323201117.8416-6-alexandre.belloni@bootlin.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, "David S . Miller" <davem@davemloft.net>
Cc: Allan Nielsen <Allan.Nielsen@microsemi.com>, Po Liu <po.liu@nxp.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>
List-Id: devicetree@vger.kernel.org

Hello Alexandre,

> +
> +	register_netdevice_notifier(&ocelot_netdevice_nb);
> +
> +	dev_info(&pdev->dev, "Ocelot switch probed\n");
> +
> +	return 0;
> +
> +err_probe_ports:
> +	return err;
> +}
> +
> +static int mscc_ocelot_remove(struct platform_device *pdev)
> +{
> +	unregister_netevent_notifier(&ocelot_netdevice_nb);

This should be replaced with a call to unregister_netdevice_notifier(). And=
 also makes
the inclusion of net/netevent.h not necessary.

Best regards,
Razvan
