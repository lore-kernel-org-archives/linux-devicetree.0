From: Rameshwar Sahu <rsahu@apm.com>
Subject: Re: [PATCH v1 3/4] Crypto: Add support for APM X-Gene SoC CRC32C h/w
 accelerator driver
Date: Thu, 20 Aug 2015 12:31:44 +0530
Message-ID: <CAFd313xG2_4NGHspuJwThY=jUSPiBm3egvXVvhv8XxKctgMv1A@mail.gmail.com>
References: <1438258268-3099-1-git-send-email-rsahu@apm.com>
	<1438258268-3099-4-git-send-email-rsahu@apm.com>
	<20150820054828.GY13546@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-crypto-owner@vger.kernel.org>
In-Reply-To: <20150820054828.GY13546@localhost>
Sender: linux-crypto-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: dan.j.williams@intel.com, Herbert Xu <herbert@gondor.apana.org.au>, davem@davemloft.net, linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jcm@redhat.com, patches@apm.com
List-Id: devicetree@vger.kernel.org

Hi Vinod,

On Thu, Aug 20, 2015 at 11:18 AM, Vinod Koul <vinod.koul@intel.com> wrote:
> On Thu, Jul 30, 2015 at 05:41:07PM +0530, Rameshwar Prasad Sahu wrote:
>> +     nents = sg_nents(req->src);
>> +     sg_count = dma_map_sg(dev, req->src, nents, DMA_TO_DEVICE);
>> +     if (!sg_count) {
>> +             dev_err(dev, "Failed to map src sg");
>> +             return -ENOMEM;
> mapping error shouldn't be no mem error
Okay, I guess then -EIO will be fine here??
>
>> +     }
>> +
>> +     if (sg_count > XGENE_DMA_MAX_FLYBY_SRC_CNT) {
>> +             dev_err(dev, "Unsupported src sg len\n");
> would be worth printing length
Okay,
>
>> +             goto err;
>> +     }
>> +
>> +     flags = DMA_CTRL_ACK;
> why ACK?
My understanding about DMA_CTRL_ACK is dma engine driver can
re-use/free this descriptor once operation completed in cleanup path.
Am I correct ??
But yes, I need to look on this because recently you have added one
more descriptor flag.

>
>> +
>> +     tx = dchan->device->device_prep_dma_crc32c(dchan, req->src,
>> +                                                req->nbytes,
>> +                                                reqctx->seed,
>> +                                                req->result,
>> +                                                flags);
> We should add helper for this
Okay
>
> --
> ~Vinod
>
