Return-Path: <devicetree-owner@vger.kernel.org>
Received: from ringil.hengli.com.au ([178.18.16.133]:48717 "EHLO
	fornost.hengli.com.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751895Ab3HULvV (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 21 Aug 2013 07:51:21 -0400
Date: Wed, 21 Aug 2013 21:51:10 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [patch] crypto: sahara - checking the wrong variable
Message-ID: <20130821115110.GF23287@gondor.apana.org.au>
References: <20130820085141.GA7469@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130820085141.GA7469@elgon.mountain>
Sender: devicetree-owner@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "David S. Miller" <davem@davemloft.net>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, kernel-janitors@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, Aug 20, 2013 at 11:51:41AM +0300, Dan Carpenter wrote:
> There is a typo here.  "dev->hw_link[]" is an array, not a pointer, so
> the check is nonsense.  We should be checking recently allocated
> "dev->hw_link[0]" instead.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
