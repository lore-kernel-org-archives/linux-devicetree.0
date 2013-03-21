From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH v3 2/2] crypto: sahara: Add driver for SAHARA2
 accelerator.
Date: Thu, 21 Mar 2013 17:53:54 +0800
Message-ID: <20130321095354.GA26931@gondor.apana.org.au>
References: <1362137873-8827-1-git-send-email-javier.martin@vista-silicon.com>
 <1362137873-8827-3-git-send-email-javier.martin@vista-silicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-crypto-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1362137873-8827-3-git-send-email-javier.martin@vista-silicon.com>
Sender: linux-crypto-owner@vger.kernel.org
To: Javier Martin <javier.martin@vista-silicon.com>
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, davem@davemloft.net, kernel@pengutronix.de, gcembed@gmail.com, shawn.guo@linaro.org, arnd@arndb.de, swarren@nvidia.com
List-Id: devicetree@vger.kernel.org

On Fri, Mar 01, 2013 at 12:37:53PM +0100, Javier Martin wrote:
> SAHARA2 HW module is included in the i.MX27 SoC from
> Freescale. It is capable of performing cipher algorithms
> such as AES, 3DES..., hashing and RNG too.
> 
> This driver provides support for AES-CBC and AES-ECB
> by now.
> 
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Javier Martin <javier.martin@vista-silicon.com>

Patch applied to cryptodev.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
