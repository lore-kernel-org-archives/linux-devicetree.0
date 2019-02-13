From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 2/9] dt-bindings: mtd: ingenic: Change 'BCH' to 'ECC'
 in documentation
Date: Wed, 13 Feb 2019 15:46:19 -0600
Message-ID: <20190213214619.GA3175@bogus>
References: <20190209192305.4434-1-paul@crapouillou.net>
 <20190209192305.4434-2-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190209192305.4434-2-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Mark Rutland <mark.rutland@arm.com>, Harvey Hunt <harveyhuntnexus@gmail.com>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

On Sat,  9 Feb 2019 16:22:58 -0300, Paul Cercueil wrote:
> The JZ4740 ECC hardware is not BCH but Reed-Solomon, so it makes more
> sense to use the more generic ECC term.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> 
> Changes:
> 
> v3: New patch
> 
> v4: No change
> 
>  .../devicetree/bindings/mtd/ingenic,jz4780-nand.txt    | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
