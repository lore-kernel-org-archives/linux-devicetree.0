From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH] crypto: tegra-aes - fix error-valued pointer
 dereference
Date: Fri, 9 Nov 2012 17:34:18 +0800
Message-ID: <20121109093418.GA25720@gondor.apana.org.au>
References: <CAPgLHd8CSEYpdGHfmwOjbH4EPszYjB01mvGMczmbMmJss_L2XA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-crypto-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAPgLHd8CSEYpdGHfmwOjbH4EPszYjB01mvGMczmbMmJss_L2XA@mail.gmail.com>
Sender: linux-crypto-owner@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: davem@davemloft.net, grant.likely@secretlab.ca, rob.herring@calxeda.com, yongjun_wei@trendmicro.com.cn, linux-crypto@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 25, 2012 at 10:55:04PM +0800, Wei Yongjun wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> 
> clk_put(dd->aes_clk) will dereference an error-valued pointer since the
> dd->aes_clk is a ERR_PTR() value. The correct check is call clk_put()
> if !IS_ERR(dd->aes_clk).
> 
> dpatch engine is used to auto generate this patch.
> (https://github.com/weiyj/dpatch)
> 
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Patch applied.  Thanks!
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
