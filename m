From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [RE-RESEND PATCH v3 1/4] dt-bindings: memory: jz4780: Add
 compatible string for JZ4740 SoC
Date: Fri, 21 Jun 2019 16:08:45 +0200
Message-ID: <20190621140845.GA26434@kroah.com>
References: <20190604143018.11644-1-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190604143018.11644-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Boris Brezillon <bbrezillon@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, od@zcrc.me, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 04, 2019 at 04:30:15PM +0200, Paul Cercueil wrote:
> Add a compatible string to support the memory controller built into the
> JZ4740 SoC from Ingenic.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Reviewed-by: Boris Brezillon <bbrezillon@kernel.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> 
> Notes:
>     v2: No change
>     
>     v3: Change compatible string for jz4740 instead of j4725b
> 
>  .../bindings/memory-controllers/ingenic,jz4780-nemc.txt          | 1 +
>  1 file changed, 1 insertion(+)

I guess I'll take this series...

Is there really no maintainer for drivers/memory/ anymore?


greg k-h
