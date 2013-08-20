Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:36978 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751129Ab3HTQbp (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Tue, 20 Aug 2013 12:31:45 -0400
Message-ID: <521399ED.9030701@wwwdotorg.org>
Date: Tue, 20 Aug 2013 10:31:41 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [patch] crypto: tegra-aes - bitwise vs logical and
References: <20130820085447.GA20170@elgon.mountain>
In-Reply-To: <20130820085447.GA20170@elgon.mountain>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>, Varun Wadekar <vwadekar@nvidia.com>
Cc: Herbert Xu <herbert@gondor.hengli.com.au>, "David S. Miller" <davem@davemloft.net>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, linux-crypto@vger.kernel.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, kernel-janitors@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 08/20/2013 02:54 AM, Dan Carpenter wrote:
> The bug here is that:
> 
> 	while (eng_busy & (!icq_empty) & dma_busy)
> 
> is never true because it's using bitwise instead of logical ANDs.  The
> other bitwise AND conditions work as intended but I changed them as well
> for consistency.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Static checker stuff.  I don't have the hardware.

Varun, can you please test the driver with this change applied and make
sure it works correctly.

If you could also update our internal testing wiki with the steps you
use for this testing, that'd be great too.

Thanks.

