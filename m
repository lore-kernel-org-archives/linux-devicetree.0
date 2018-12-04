From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: crypto: ccree: add dt bindings for
 ccree 703
Date: Tue, 4 Dec 2018 14:14:19 -0600
Message-ID: <20181204201419.GA13304@bogus>
References: <1542102039-22256-1-git-send-email-gilad@benyossef.com>
 <1542102039-22256-3-git-send-email-gilad@benyossef.com>
 <20181129064218.53qc33vus5anla76@gondor.apana.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181129064218.53qc33vus5anla76@gondor.apana.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Gilad Ben-Yossef <gilad@benyossef.com>, "David S. Miller" <davem@davemloft.net>, Mark Rutland <mark.rutland@arm.com>, Yael Chemla <yael.chemla@foss.arm.com>, Ofir Drang <Ofir.Drang@arm.com>, linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 29, 2018 at 02:42:18PM +0800, Herbert Xu wrote:
> On Tue, Nov 13, 2018 at 09:40:36AM +0000, Gilad Ben-Yossef wrote:
> > Add device tree bindings associating Arm TrustZone CryptoCell 703 with the
> > ccree driver.
> > 
> > Signed-off-by: Gilad Ben-Yossef <gilad@benyossef.com>
> > ---
> >  Documentation/devicetree/bindings/crypto/arm-cryptocell.txt | 1 +
> >  1 file changed, 1 insertion(+)
> 
> Which tree is this patch meant to go through?

You should take it as it is part of a series.

Rob
