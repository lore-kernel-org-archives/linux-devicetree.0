From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 0/2] crypto: add new driver for Marvell CESA
Date: Thu, 9 Apr 2015 17:18:46 +0200
Message-ID: <20150409151846.GE1459@lunn.ch>
References: <1428591523-1780-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-crypto-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1428591523-1780-1-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-crypto-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, Tawfik Bayouk <tawfik@marvell.com>, Lior Amsalem <alior@marvell.com>, Nadav Haklai <nadavh@marvell.com>, Eran Ben-Avi <benavi@marvell.com>, Thomas Petazzoni <info@free-electrons.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Arnaud Ebalard <arno@natisbad.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 09, 2015 at 04:58:41PM +0200, Boris Brezillon wrote:
> Hello,
> 
> This is an attempt to replace the mv_cesa driver by a new one to address
> some limitations of the existing driver.
> >From a performance and CPU load point of view the most important
> limitation is the lack of DMA support, thus preventing us from chaining
> crypto operations.
> 
> I know we usually try to adapt existing drivers instead of replacing them
> by new ones, but after trying to refactor the mv_cesa driver I realized it
> would take longer than writing an new one from scratch.

Hi Boris

What is the situation with backwards compatibility? I see you have
kept the old compatibility string, and added lots of new ones, and
deprecated some properties. Will an old DT blob still work?
 
 Thanks
	Andrew
