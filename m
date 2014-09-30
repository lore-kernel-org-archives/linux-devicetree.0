From: Peter Korsgaard <peter@korsgaard.com>
Subject: Re: [PATCH 3/6] hwrng: atmel: add DT support
Date: Tue, 30 Sep 2014 18:57:12 +0200
Message-ID: <87fvf9oxlj.fsf@dell.be.48ers.dk>
References: <1412093987-30241-1-git-send-email-boris.brezillon@free-electrons.com>
	<1412093987-30241-4-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1412093987-30241-4-git-send-email-boris.brezillon@free-electrons.com>
	(Boris Brezillon's message of "Tue, 30 Sep 2014 18:19:44 +0200")
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Andrew Victor <linux@maxim.org.za>, Peter Korsgaard <jacmet@sunsite.dk>, Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

>>>>> "Boris" == Boris Brezillon <boris.brezillon@free-electrons.com> writes:

 > Add DT support.
 > Make the driver depend on CONFIG_OF as at91sam9g45 was the only SoC making
 > use of the TRNG block and this SoC is now fully migrated to DT.

 > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Acked-by: Peter Korsgaard <peter@korsgaard.com>

-- 
Bye, Peter Korsgaard
