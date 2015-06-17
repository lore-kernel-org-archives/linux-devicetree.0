Return-Path: <moorray3@wp.pl>
Date: Wed, 17 Jun 2015 18:10:13 +0200
From: Jakub =?UTF-8?B?S2ljacWEc2tp?= <moorray3@wp.pl>
Subject: Re: [PATCH 2/3] spi: mediatek: Add spi bus for Mediatek MT8173
Message-ID: <20150617181013.2688d08f@north>
In-Reply-To: <1434550251.23617.38.camel@mtksdaap41>
References: <1431434356.2128.9.camel@mhfsdcap03>
	<20150512160540.GB3066@sirena.org.uk>
	<1431675522.2128.13.camel@mhfsdcap03>
	<20150515092543.GY2761@sirena.org.uk>
	<1433758546.19786.16.camel@mtksdaap41>
	<20150608175927.GO14071@sirena.org.uk>
	<1433844321.16178.6.camel@mtksdaap41>
	<20150609103951.GA14071@sirena.org.uk>
	<1433923569.22080.1.camel@mtksdaap41>
	<1434532083.19346.27.camel@mtksdaap41>
	<20150617124758.GE3214@sirena.org.uk>
	<1434550251.23617.38.camel@mtksdaap41>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To: Eddie Huang <eddie.huang@mediatek.com>
Cc: Mark Brown <broonie@kernel.org>, "Leilk Liu (=?UTF-8?B?5YiY56OK?=) " <Leilk.Liu@mediatek.com>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, HongZhou Yang <hongzhou.yang@mediatek.com>, Sascha Hauer <s.hauer@pengutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org\" " <linux-arm-kernel@lists.infradead.org>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "linux-mediatek@lists.infradead.org\" " <linux-mediatek@lists.infradead.org>, srv_heupstream <srv_heupstream@mediatek.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, 17 Jun 2015 22:10:51 +0800, Eddie Huang wrote:
> If tx scatterlist per list data size are 128, 4096, 256. rx scatterlist
> per list data size are 128, 4096, 256. So we need to go through above
> steps three times. If tx scatterlists per list data size are 128, 4096,
> 256. rx scatterlists per list data size are 256, 4096, 128. If we start
> sending first entry, tx size is 128, rx size is 256, this will cause
> hardware malfunction because tx, rx data length are not the same.

You can just use min(next_rx_len, next_tx_len) as transfer size. 
Am I missing something?  For your 128, 4096, 256 vs 256, 4096, 128
example you could do: 128, 128, 3968, 128, 128.
