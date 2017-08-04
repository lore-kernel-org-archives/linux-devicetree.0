From: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v2 00/25] Add QCOM QPIC NAND support
Date: Fri, 04 Aug 2017 14:17:25 +0530
Message-ID: <a3f503e676b24539751e7883f23df1d8@codeaurora.org>
References: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
 <20170804095305.6492a2d3@bbrezillon> <20170804095534.79fa9e96@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170804095534.79fa9e96@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2017-08-04 13:25, Boris Brezillon wrote:
> On Fri, 4 Aug 2017 09:53:05 +0200
> Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> 
>> Hi Abhishek,
>> 
>> On Wed, 19 Jul 2017 17:17:48 +0530
>> Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
>> 
>> > v2:
>> >
>> > 1. Addressed the review comments given in v1
>> > 2. Removed the DMA coherent buffer for register read and used
>> >    streaming DMA API’s
>> > 3. Reorganized the NAND read and write functions
>> > 4. Separated patch for driver and documentation changes
>> > 5. Changed the compatible string for EBI2
>> >
>> > v1:
>> >
>> > http://www.spinics.net/lists/devicetree/msg183706.html
>> >
>> > Abhishek Sahu (25):
>> >   mtd: nand: qcom: fix config error for BCH
>> >   mtd: nand: qcom: program NAND_DEV_CMD_VLD register
>> >   mtd: nand: qcom: change compatible string for EBI2 NANDC
>> >   dt-bindings: qcom_nandc: change compatible string for EBI2 NANDC
>> >   mtd: nand: qcom: remove redundant chip select compatible string
>> >   dt-bindings: qcom_nandc: remove chip select compatible string
>> >   mtd: nand: qcom: reorganize nand page read
>> >   mtd: nand: qcom: reorganize nand page write
>> >   mtd: nand: qcom: remove memset for clearing read register buffer
>> >   mtd: nand: qcom: reorganize nand devices probing
>> >   mtd: nand: qcom: support for NAND controller properties
>> >   dt-bindings: qcom_nandc: QPIC NAND documentation
>> >   mtd: nand: qcom: add QPIC NAND compatible string
>> >   mtd: nand: qcom: add and initialize QPIC DMA resources
>> >   mtd: nand: qcom: DMA mapping support for register read buffer
>> >   mtd: nand: qcom: allocate BAM transaction
>> >   mtd: nand: qcom: add BAM DMA descriptor handling
>> >   mtd: nand: qcom: support for passing flags in transfer functions
>> >   mtd: nand: qcom: support for read location registers
>> >   mtd: nand: qcom: erased codeword detection configuration
>> >   mtd: nand: qcom: support for QPIC page read/write
>> >   mtd: nand: qcom: QPIC raw write support
>> >   mtd: nand: qcom: change register offset defines with enums
>> >   dt-bindings: qcom_nandc: compatible string for version 1.5.0
>> >   mtd: nand: qcom: support for QPIC version 1.5.0
>> 
>> Applied patch 1 and 5 to 11 to nand/next [1].
>> 
> 
> My bad, it's 5 to 10, patch 11 did not apply cleanly. And I also forgot
> the link. Please rebase on this branch before sending your v3.
> 

  Thanks Boris.
  I will rebase remaining patches on this branch.

> Thanks,
> 
> Boris
> 
> [1]http://git.infradead.org/l2-mtd.git/shortlog/refs/heads/nand/next
> 
>> >
>> >  .../devicetree/bindings/mtd/qcom_nandc.txt         |   56 +-
>> >  drivers/mtd/nand/qcom_nandc.c                      | 1157 ++++++++++++++++----
>> >  2 files changed, 1010 insertions(+), 203 deletions(-)
>> >
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
