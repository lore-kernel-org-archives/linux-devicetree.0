From: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] crypto: dts - Addition of missing SEC compatibile property in c29x device tree
Date: Wed, 9 Jul 2014 22:43:25 +0200
Message-ID: <201407092243.25496.marex@denx.de>
References: <1404223643-32275-1-git-send-email-b44382@freescale.com> <20140708132111.GA24110@gondor.apana.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-crypto-owner@vger.kernel.org>
In-Reply-To: <20140708132111.GA24110@gondor.apana.org.au>
Sender: linux-crypto-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Nitesh Narayan Lal <b44382@freescale.com>, linux-crypto@vger.kernel.org, r66431@freescale.com, b16394@freescale.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tuesday, July 08, 2014 at 03:21:11 PM, Herbert Xu wrote:
> On Tue, Jul 01, 2014 at 07:37:23PM +0530, Nitesh Narayan Lal wrote:
> > The driver is compatible with SEC version 4.0, which was missing from
> > device tree resulting that the caam driver doesn't gets probed. Since
> > SEC is backward compatible with older versions, so this patch adds those
> > missing versions in c29x device tree.
> > 
> > Signed-off-by: Nitesh Narayan Lal <b44382@freescale.com>
> > Signed-off-by: Vakul Garg <b16394@freescale.com>
> 
> Patch applied.

Are you sure DT changes go through linux-crypto tree ?

Best regards,
Marek Vasut
