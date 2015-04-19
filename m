From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH v3 00/17] crypto: talitos - Add support for SEC1
Date: Sun, 19 Apr 2015 13:48:47 +0800
Message-ID: <20150419054847.GB11255@gondor.apana.org.au>
References: <20150417143147.154871A242C@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-crypto-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150417143147.154871A242C@localhost.localdomain>
Sender: linux-crypto-owner@vger.kernel.org
To: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: Kim Phillips <kim.phillips@freescale.com>, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Apr 17, 2015 at 04:31:47PM +0200, Christophe Leroy wrote:
> The purpose of this set of patchs is to add to talitos crypto driver
> the support for the SEC1 version of the security engine, which is
> found in mpc885 and mpc8272 processors.
> 
> v3 is a complete rework of the patchset. Since a kernel can be built
> with support for both MPC82xx and MPC83xx at the same time, talitos
> driver shall support both SEC1 and SEC2+ at the same time.
> 
> Based on cryptodev-2.6 tree

All applied.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
