From: Gilad Ben-Yossef <gilad@benyossef.com>
Subject: Re: [PATCH 2/3] crypto: ccree: add dt bindings for ccree 713
Date: Mon, 29 Oct 2018 11:49:31 +0200
Message-ID: <CAOtvUMd9W9HvFuXRH=LAyQYLnvL_hmwv703LzE-aA=2OSsVHMQ@mail.gmail.com>
References: <1539696935-4433-1-git-send-email-gilad@benyossef.com>
 <1539696935-4433-3-git-send-email-gilad@benyossef.com> <20181025001221.GA12740@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181025001221.GA12740@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: robh@kernel.org
Cc: Herbert Xu <herbert@gondor.apana.org.au>, David Miller <davem@davemloft.net>, Mark Rutland <mark.rutland@arm.com>, Ofir Drang <Ofir.Drang@arm.com>, Yael Chemla <Yael.Chemla@arm.com>, Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux kernel mailing list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 25, 2018 at 3:12 AM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Oct 16, 2018 at 02:35:32PM +0100, Gilad Ben-Yossef wrote:
> > Add device tree bindings associating Arm TrustZone CryptoCell 713 with =
the
> > ccree driver.
>
> "dt-bindings: crypto: ..." for the subject.
> >
> > Signed-off-by: Gilad Ben-Yossef <gilad@benyossef.com>
> > ---
> >  Documentation/devicetree/bindings/crypto/arm-cryptocell.txt | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/crypto/arm-cryptocell.tx=
t b/Documentation/devicetree/bindings/crypto/arm-cryptocell.txt
> > index 999fb2a..880de07 100644
> > --- a/Documentation/devicetree/bindings/crypto/arm-cryptocell.txt
> > +++ b/Documentation/devicetree/bindings/crypto/arm-cryptocell.txt
> > @@ -1,8 +1,9 @@
> >  Arm TrustZone CryptoCell cryptographic engine
> >
> >  Required properties:
> > -- compatible: Should be one of: "arm,cryptocell-712-ree",
> > -  "arm,cryptocell-710-ree" or "arm,cryptocell-630p-ree".
> > +- compatible: Should be one of: "arm,cryptocell-713-ree",
> > +  "arm,cryptocell-712-ree", "arm,cryptocell-710-ree" or
> > +  "arm,cryptocell-630p-ree".
>
> Please format 1 per line.
>

Will do.
Thanks for the review.

I will send a corrected patch.

Gilad


--=20
Gilad Ben-Yossef
Chief Coffee Drinker

values of =CE=B2 will give rise to dom!
