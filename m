From: Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: rockchip: set TX PBL for rk3328-roc-cc gmac
Date: Sat, 15 Jun 2019 08:27:47 -0400
Message-ID: <4210ab8d-291c-8c44-3c39-6a1849a73874@gmail.com>
References: <20190417210059.26262-1-papadakospan@gmail.com>
 <1555938803.1241.1@gmail.com>
 <8ded737d-1fd5-3609-ca2e-cfeba63b2d95@gmail.com> <1619091.6MGD9gV0do@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1619091.6MGD9gV0do@phil>
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
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Jose Abreu <jose.abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Leonidas P. Papadakos" <papadakospan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 6/14/2019 5:26 AM, Heiko Stuebner wrote:
> Hi,
> 
> Am Donnerstag, 23. Mai 2019, 02:00:27 CEST schrieb Peter Geis:
>>
>> On 4/22/2019 9:13 AM, Leonidas P. Papadakos wrote:
>>>
>>> Indeed, at least with that first patch users won't have a crappy
>>> experience by default (ssh lags and the like)
>>>
>>>
>>
>> I apologize for taking so long at this, but I wanted to make sure I had
>> it right.
>>
>> So far I've found a few things that seem to help, and would like y'all
>> to test them when you get the chance.
>>
>> Adding snps,aal (configures DMA for address alignment) appears to make a
>> massive improvement to stability, although the the snps,txpbl = <0x4> is
>> still necessary for this to work.
>>
>> Second, I added snps,rxpbl = <0x4> as well, which seems to help with my
>> RX issues a bit.
>> The biggest improvement with these two settings is more stable transmit
>> and receive.
>> Currently I'm getting about 800mbps on tx and 400 mbps on rx.
>>
>> Please test when you get the chance and provide feedback.
> 
> I have to confess I lost track of the multitude of patches touching
> the gmac on rk3328 and their long mail threads in terms of which
> to pick up and which are considered superseeded.
> 
> So I'd really appreciate if you could resend the patches that matter
> and provide relevant Tested-by, Reviewed-by, etc tags from involved
> people that actually were able to test patches
> 
> Thanks
> Heiko
> 
> 

Good Morning Heiko,

Here's a quick catch-up for you:
Currently we use thresh dma mode to allow rgmii to work, but this has 
performance limitations.
Leonidas submitted the txpbl 0x4 patch, which works well for his board 
but my board has very poor performance with.
I submitted a new patch that combined txpbl 0x4 with aal dma mode, which 
fixes my issue and seems to work well for Leonidas.

That patch is under [PATCH] arm64: dts: rockchip: improve rk3328-roc-cc 
rgmii performance.
I'd like more people to test it prior to submitting it to replace thresh 
dma mode.

If we get a few more tests without regression, I'll resubmit it with 
Tested-by tags for inclusion.

Thanks,
Peter
