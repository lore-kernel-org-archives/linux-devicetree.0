From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH] crypto: caam - standardize device tree naming
	convention to utilize '-vX.Y'
Date: Wed, 23 Mar 2011 21:18:42 +0800
Message-ID: <20110323131842.GA4374@gondor.apana.org.au>
References: <20110314174247.e5515448.kim.phillips@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-crypto-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110314174247.e5515448.kim.phillips@freescale.com>
Sender: linux-crypto-owner@vger.kernel.org
To: Kim Phillips <kim.phillips@freescale.com>
Cc: devicetree-discuss@lists.ozlabs.org, linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Kumar Gala <kumar.gala@freescale.com>, Steve Cornelius <sec@pobox.com>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 14, 2011 at 05:42:47PM -0500, Kim Phillips wrote:
> Help clarify that the number trailing in compatible nomenclature
> is the version number of the device, i.e., change:
> 
> "fsl,p4080-sec4.0", "fsl,sec4.0";
> 
> to:
> 
> "fsl,p4080-sec-v4.0", "fsl,sec-v4.0";
> 
> Signed-off-by: Kim Phillips <kim.phillips@freescale.com>
> Cc: Kumar Gala <kumar.gala@freescale.com>
> Cc: Steve Cornelius <sec@pobox.com>

Applied.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
