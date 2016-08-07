From: Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH 3/3] dmaengine: pl330: support transfer unaligned with
 (burst len * burst size)
Date: Sun, 7 Aug 2016 17:21:31 +0800
Message-ID: <57A6FD9B.7000203@rock-chips.com>
References: <1470365602-32586-1-git-send-email-shawn.lin@rock-chips.com>
 <1470365602-32586-4-git-send-email-shawn.lin@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1470365602-32586-4-git-send-email-shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Huibin Hong <huibin.hong-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Shawn

On 2016年08月05日 10:53, Shawn Lin wrote:
> Currently pl330 doesn't support transfer which doesn't
> align with burst len * burst size. This should be only
> for single mode. Let's allow it for busrt mode if available.
>
> e.g. transfers 0x10002 bytes:
> First loop 256*16*16=0x10000, burst size is 1, burst length is 16.
> Then the second loop 2 bytes, burst size is 1, burst length is 1.
>
> f0041000:        DMAMOV CCR 0xbc02f1
> f0041006:        DMAMOV SAR 0xdd6c0000
> f004100c:        DMAMOV DAR 0xff1d0400
> f0041012:        DMALP_0 15
> f0041014:        DMALP_1 255
> f0041016:        DMAWFPB 12
> f0041018:        DMALDA
> f0041019:        DMASTPB 12
> f004101b:        DMAFLUSHP 12
> f004101d:        DMALPENDA_1 bjmpto_7
> f004101f:        DMALPENDA_0 bjmpto_b
> f0041021:        DMAMOV CCR 0x800201
> f0041027:        DMALP_1 1
> f0041029:        DMAWFPB 12
> f004102b:        DMALDA
> f004102c:        DMASTPB 12
> f004102e:        DMAFLUSHP 12
> f0041030:        DMALPENDA_1 bjmpto_7
> f0041032:        DMASEV 0
> f0041034:        DMAEND
>
> Signed-off-by: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>
Tested-by: Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

Thanks.

-- 
- Xing Zheng


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
