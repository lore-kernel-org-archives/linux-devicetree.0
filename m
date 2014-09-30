From: Peter Korsgaard <peter-+2lRwdCCLRT2eFz/2MeuCQ@public.gmane.org>
Subject: Re: [PATCH 4/6] hwrng: atmel: Add TRNG DT binding doc
Date: Tue, 30 Sep 2014 19:12:22 +0200
Message-ID: <87bnpxoww9.fsf@dell.be.48ers.dk>
References: <1412093987-30241-1-git-send-email-boris.brezillon@free-electrons.com>
	<1412093987-30241-5-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412093987-30241-5-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
	(Boris Brezillon's message of "Tue, 30 Sep 2014 18:19:45 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Peter Korsgaard <jacmet-OfajU3CKLf1/SzgSGea1oA@public.gmane.org>, Matt Mackall <mpm-VDJrAJ4Gl5ZBDgjK7y7TUQ@public.gmane.org>, Herbert Xu <herbert-lOAM2aK0SrRLBo1qDEOMRrpzq4S04n8Q@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

>>>>> "Boris" == Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> writes:

 > Document DT bindings of Atmel's TRNG (True Random Number Generator) IP.
 > Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
 > ---
 >  Documentation/devicetree/bindings/hwrng/atmel-trng.txt | 16 ++++++++++++++++
 >  1 file changed, 16 insertions(+)
 >  create mode 100644 Documentation/devicetree/bindings/hwrng/atmel-trng.txt

 > diff --git a/Documentation/devicetree/bindings/hwrng/atmel-trng.txt b/Documentation/devicetree/bindings/hwrng/atmel-trng.txt
 > new file mode 100644
 > index 0000000..4ac5aaa
 > --- /dev/null
 > +++ b/Documentation/devicetree/bindings/hwrng/atmel-trng.txt
 > @@ -0,0 +1,16 @@
 > +Atmel TRNG (True Random Number Generator) block
 > +
 > +Required properties:
 > +- compatible : Should be "atmel,at91sam9g45-trng"
 > +- reg : Offset and length of the register set of this block
 > +- interrupts : the interrupt number for the TRNG block

The interrupt isn't strictly speaking required as it isn't used by the
driver, but as 9G45 has the signal wired up I guess it makes sense.

Acked-by: Peter Korsgaard <peter-+2lRwdCCLRT2eFz/2MeuCQ@public.gmane.org>

-- 
Bye, Peter Korsgaard
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
