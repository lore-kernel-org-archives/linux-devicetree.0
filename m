From: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
Subject: Re: [PATCH v4 00/10] of_net: Add NVMEM support to of_get_mac_address
Date: Mon, 6 May 2019 10:32:07 +0200
Message-ID: <20190506083207.GG81826@meh.true.cz>
References: <1556893635-18549-1-git-send-email-ynezz@true.cz>
 <20190505.214727.1839442238121977055.davem@davemloft.net>
Reply-To: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190505.214727.1839442238121977055.davem@davemloft.net>
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, matthias.bgg@gmail.com, andrew@lunn.ch, f.fainelli@gmail.com, hkallweit1@gmail.com, frowand.list@gmail.com, srinivas.kandagatla@linaro.org, maxime.ripard@bootlin.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

David Miller <davem@davemloft.net> [2019-05-05 21:47:27]:

Hi David,

> Series applied, thank you.

I did probably something terribly wrong, but patch "[PATCH v4 05/10] net:
ethernet: support of_get_mac_address new ERR_PTR error" has not reached the
patchwork, but I'm sure, that it was sent out as Hauke Mehrtens (maintainer
for ethernet/lantiq_xrx200.c) has confirmed to me on IRC, that he has received
it.

I've as well noticed, that you've not considered "[PATCH v5] staging:
octeon-ethernet: support of_get_mac_address new ERR_PTR error"[1] which
contained a fix for possible NULL value of mac variable:

        const u8 *mac = NULL;

        if (priv->of_node)
                mac = of_get_mac_address(priv->of_node);

        if (!IS_ERR(mac))

I'll send those two patches again against net-next in a few moments. Sorry for
this mess.

1. https://patchwork.ozlabs.org/patch/1094942/

-- ynezz
