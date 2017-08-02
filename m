From: Abhishek Sahu <absahu@codeaurora.org>
Subject: Re: [PATCH v2 08/25] mtd: nand: qcom: reorganize nand page write
Date: Wed, 02 Aug 2017 19:24:47 +0530
Message-ID: <42cf6c4afa40ce097672fd652feabf2a@codeaurora.org>
References: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
 <1500464893-11352-9-git-send-email-absahu@codeaurora.org>
 <2d9db3cd-494c-3501-76cc-fe3eb7d0ad1c@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2d9db3cd-494c-3501-76cc-fe3eb7d0ad1c@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Archit Taneja <architt@codeaurora.org>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, sricharan@codeaurora.org
List-Id: devicetree@vger.kernel.org

On 2017-08-02 11:31, Archit Taneja wrote:
> On 07/19/2017 05:17 PM, Abhishek Sahu wrote:
>> Each NAND page consist of multiple codewords. Following is
>> sequence for NAND page write according to hardware guide.
>> 
>> 1. Program Power-up configuration, page row, page column
>>     address and flash configuration registers.
>> 2. Write NAND_FLASH_CMD followed by NANC_EXEC_CMD for each
>>     codeword.
>> 3. Read NAND_FLASH_STATUS for each codeword.
>> 
>> The step 1 should be done once for each page and step 2,3 should
>> be done for each codeword.
>> 
>> Currently, all the 3 steps are being done for each codeword which
>> is wrong. Now this patch reorganizes page write functions to
>> configure page specific register once and per codeword specific
>> registers for each NAND ECC step.
> 
> Thanks for fixing this. I'm assuming this has been tested on IPQ806x
> too.

  Thanks Archit for reviewing the patches.

  Yes. I have tested this in IPQ8064 AP148 board with mtd tests after
  applying the ADM DMA patch from list.

> 
> Reviewed-by: Archit Taneja <architt@codeaurora.org>
> 
>> 
>> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
>> ---
>>   drivers/mtd/nand/qcom_nandc.c | 32 ++++++++++++++++++++------------
>>   1 file changed, 20 insertions(+), 12 deletions(-)
>> 
>> diff --git a/drivers/mtd/nand/qcom_nandc.c 
>> b/drivers/mtd/nand/qcom_nandc.c
>> index 27ea594..5b71478 100644
>> --- a/drivers/mtd/nand/qcom_nandc.c
>> +++ b/drivers/mtd/nand/qcom_nandc.c
>> @@ -638,15 +638,24 @@ static void 
>> config_nand_single_cw_page_read(struct qcom_nand_controller *nandc)
>>   	config_nand_cw_read(nandc);
>>   }
