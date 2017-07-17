From: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 03/14] qcom: mtd: nand: Fixed config error for BCH
Date: Mon, 17 Jul 2017 12:08:30 +0530
Message-ID: <8726fbe7c72f1b25154c9d0a30e20a49@codeaurora.org>
References: <1498720566-20782-1-git-send-email-absahu@codeaurora.org>
 <1498720566-20782-4-git-send-email-absahu@codeaurora.org>
 <b385fe5e-42a4-9944-55db-5a99a69a5941@gmail.com>
 <20170703214735.2acb70cc@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170703214735.2acb70cc@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2017-07-04 01:17, Boris Brezillon wrote:
> On Thu, 29 Jun 2017 11:49:07 +0200
> Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 
>> On 06/29/2017 09:15 AM, Abhishek Sahu wrote:
>> > The configuration for BCH is not correct in the current
>> > driver so this patch fixed the same.
>> 
>> Fix the commit message, I have no idea what this patch does or fixes.
> 
> And please add a Fixes tag and Cc stable.
> 

  Sure. I will amend the commit message to make it
  more clear and will include these tags.

>> 
>> > Signed-off-by: Abhishek Sahu <absahu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> > ---
>> >  drivers/mtd/nand/qcom_nandc.c | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/mtd/nand/qcom_nandc.c
> b/drivers/mtd/nand/qcom_nandc.c
>> > index 520add9..410ee53 100644
>> > --- a/drivers/mtd/nand/qcom_nandc.c
>> > +++ b/drivers/mtd/nand/qcom_nandc.c
>> > @@ -1919,7 +1919,7 @@ static int qcom_nand_host_setup(struct
> qcom_nand_host *host)
>> >  				| wide_bus << WIDE_FLASH
>> >  				| 1 << DEV0_CFG1_ECC_DISABLE;
>> >
>> > -	host->ecc_bch_cfg = host->bch_enabled << ECC_CFG_ECC_DISABLE
>> > +	host->ecc_bch_cfg = !host->bch_enabled << ECC_CFG_ECC_DISABLE
>> >  				| 0 << ECC_SW_RESET
>> >  				| host->cw_data << ECC_NUM_DATA_BYTES
>> >  				| 1 << ECC_FORCE_CLK_OPEN
>> >
>> 
>> 

-- 
Abhishek Sahu
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
