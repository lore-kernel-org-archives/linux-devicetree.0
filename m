From: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
Subject: Re: [PATCH v4 00/10] of_net: Add NVMEM support to of_get_mac_address
Date: Mon, 6 May 2019 18:19:17 +0200
Message-ID: <20190506161917.GH81826@meh.true.cz>
References: <1556893635-18549-1-git-send-email-ynezz@true.cz>
 <20190505.214727.1839442238121977055.davem@davemloft.net>
 <20190506083207.GG81826@meh.true.cz>
 <20190506164132.10342ef6@bootlin.com>
Reply-To: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190506164132.10342ef6@bootlin.com>
Sender: netdev-owner@vger.kernel.org
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: David Miller <davem@davemloft.net>, netdev@vger.kernel.org, devicetree@vger.kernel.org, matthias.bgg@gmail.com, andrew@lunn.ch, f.fainelli@gmail.com, hkallweit1@gmail.com, frowand.list@gmail.com, srinivas.kandagatla@linaro.org, maxime.ripard@bootlin.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Maxime Chevallier <maxime.chevallier@bootlin.com> [2019-05-06 16:41:32]:

Hi Maxime,

> On Mon, 6 May 2019 10:32:07 +0200
> Petr Štetiar <ynezz@true.cz> wrote:
> 
> >David Miller <davem@davemloft.net> [2019-05-05 21:47:27]:
> >
> >Hi David,
> >
> >> Series applied, thank you.  
> >
> >I did probably something terribly wrong, but patch "[PATCH v4 05/10] net:
> >ethernet: support of_get_mac_address new ERR_PTR error" has not reached the
> >patchwork, but I'm sure, that it was sent out as Hauke Mehrtens (maintainer
> >for ethernet/lantiq_xrx200.c) has confirmed to me on IRC, that he has received
> >it.
> 
> It seems indeed that the 5th patch hasn't beed applied, which effectively
> breaks mvneta on net-next, and I guess a lot of other drivers that rely
> on handling the new return values.

Yep, sorry for that.

> I saw you sent a followup series fixing that, but only patch 2/3
> shows-up on netdev, so you might be facing a similar issue here.

Indeed, seems like patchwork hiccup with a long list of recepients in the
To/Cc headers, so I've just resend it again with only netdev@vger.kernel.org
in the To: header and it was happily picked up[1].

1. https://patchwork.ozlabs.org/project/netdev/list/?series=106369

-- ynezz
