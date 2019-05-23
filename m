From: Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: rockchip: set TX PBL for rk3328-roc-cc gmac
Date: Wed, 22 May 2019 20:00:27 -0400
Message-ID: <8ded737d-1fd5-3609-ca2e-cfeba63b2d95@gmail.com>
References: <20190417210059.26262-1-papadakospan@gmail.com>
 <8865b046-fb3a-4071-335c-66abb344d7f4@gmail.com>
 <1555915435.1262.1@gmail.com>
 <9a5c62b4-ea75-de4f-9b71-ffa42cb8eaac@gmail.com>
 <1555938803.1241.1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1555938803.1241.1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: "Leonidas P. Papadakos" <papadakospan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jose Abreu <jose.abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 4/22/2019 9:13 AM, Leonidas P. Papadakos wrote:
> 
> Indeed, at least with that first patch users won't have a crappy 
> experience by default (ssh lags and the like)
> 
> 

I apologize for taking so long at this, but I wanted to make sure I had 
it right.

So far I've found a few things that seem to help, and would like y'all 
to test them when you get the chance.

Adding snps,aal (configures DMA for address alignment) appears to make a 
massive improvement to stability, although the the snps,txpbl = <0x4> is 
still necessary for this to work.

Second, I added snps,rxpbl = <0x4> as well, which seems to help with my 
RX issues a bit.
The biggest improvement with these two settings is more stable transmit 
and receive.
Currently I'm getting about 800mbps on tx and 400 mbps on rx.

Please test when you get the chance and provide feedback.
