From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 03/12] dt-bindings: mtd: ingenic: Use standard
 ecc-engine property
Date: Fri, 15 Mar 2019 18:25:57 -0500
Message-ID: <20190315232536.GA23734@bogus>
References: <20190313222259.28704-1-paul@crapouillou.net>
 <20190313222259.28704-3-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190313222259.28704-3-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Mark Rutland <mark.rutland@arm.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Harvey Hunt <harveyhuntnexus@gmail.com>, od@zcrc.me, Mathieu Malaterre <malat@debian.org>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

On Wed, 13 Mar 2019 23:22:50 +0100, Paul Cercueil wrote:
> The 'ingenic,bch-controller' property is now deprecated and the
> 'ecc-engine' property should be used instead.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> 
> Notes:
>     v5: New patch
> 
>  Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
