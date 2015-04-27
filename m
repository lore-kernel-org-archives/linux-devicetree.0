From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH v3] dmaengine: xgene-dma: Fix sparse wannings and
 coccinelle warnings
Date: Mon, 27 Apr 2015 08:43:15 +0530
Message-ID: <20150427031315.GG2738@intel.com>
References: <1429212673-22254-1-git-send-email-rsahu@apm.com>
 <20150417182937.GN30624@intel.com>
 <CAFd313y-HfW_us0FVQFEkGAzf-ZCKpRtF6eYweaK0V94MBg4iQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAFd313y-HfW_us0FVQFEkGAzf-ZCKpRtF6eYweaK0V94MBg4iQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rameshwar Sahu <rsahu@apm.com>, fengguang.wu@intel.com
Cc: dan.j.williams@intel.com, dmaengine@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jcm@redhat.com, patches@apm.com
List-Id: devicetree@vger.kernel.org

On Mon, Apr 20, 2015 at 08:38:18AM +0530, Rameshwar Sahu wrote:
> Hi Vinod,
>> >> @@ -2085,6 +2043,5 @@ module_platform_driver(xgene_dma_driver);
> >>
> >>  MODULE_DESCRIPTION("APM X-Gene SoC DMA driver");
> >>  MODULE_AUTHOR("Rameshwar Prasad Sahu <rsahu@apm.com>");
> >> -MODULE_AUTHOR("Loc Ho <lho@apm.com>");
> > And why this?
> 
> I saw below warning reported by the kbuild robot test
> 
> drivers/dma/xgene-dma.c:2088:1: sparse: symbol
> '__UNIQUE_ID_author__COUNTER__' has multiple initializers (originally
> initialized at drivers/dma/xgene-dma.c:2087)
> So, I kept only one author here.
No that is not right, sparse shouldn't have cribbed here.

Fengguang can we get the bot to ignore this please

-- 
~Vinod
