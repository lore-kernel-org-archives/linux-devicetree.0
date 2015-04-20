From: Rameshwar Sahu <rsahu@apm.com>
Subject: Re: [PATCH v3] dmaengine: xgene-dma: Fix sparse wannings and
 coccinelle warnings
Date: Mon, 20 Apr 2015 08:38:18 +0530
Message-ID: <CAFd313y-HfW_us0FVQFEkGAzf-ZCKpRtF6eYweaK0V94MBg4iQ@mail.gmail.com>
References: <1429212673-22254-1-git-send-email-rsahu@apm.com>
	<20150417182937.GN30624@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150417182937.GN30624@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: dan.j.williams@intel.com, dmaengine@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jcm@redhat.com, patches@apm.com
List-Id: devicetree@vger.kernel.org

Hi Vinod,

On Fri, Apr 17, 2015 at 11:59 PM, Vinod Koul <vinod.koul@intel.com> wrote:
>
>>       /* Get DMA error interrupt */
>> @@ -2076,7 +2035,6 @@ static struct platform_driver xgene_dma_driver = {
>>       .remove = xgene_dma_remove,
>>       .driver = {
>>               .name = "X-Gene-DMA",
>> -             .owner = THIS_MODULE,
> I have already applied a patch for this

Okay, I didn't pull latest git

>
>>               .of_match_table = xgene_dma_of_match_ptr,
>>       },
>>  };
>> @@ -2085,6 +2043,5 @@ module_platform_driver(xgene_dma_driver);
>>
>>  MODULE_DESCRIPTION("APM X-Gene SoC DMA driver");
>>  MODULE_AUTHOR("Rameshwar Prasad Sahu <rsahu@apm.com>");
>> -MODULE_AUTHOR("Loc Ho <lho@apm.com>");
> And why this?

I saw below warning reported by the kbuild robot test

drivers/dma/xgene-dma.c:2088:1: sparse: symbol
'__UNIQUE_ID_author__COUNTER__' has multiple initializers (originally
initialized at drivers/dma/xgene-dma.c:2087)
So, I kept only one author here.


>
> Fixes looks good though
>
> --
> ~Vinod
>>  MODULE_LICENSE("GPL");
>>  MODULE_VERSION("1.0");
>> --
>> 1.8.2.1
>>
>
> --
