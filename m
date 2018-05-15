From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH V5 2/4] soc: mediatek: pwrap: fix cipher init setting
 error
Date: Tue, 15 May 2018 11:50:12 +0200
Message-ID: <d754bbdd-93ee-fadd-e4e7-439032f8b173@gmail.com>
References: <1525957319-20557-1-git-send-email-argus.lin@mediatek.com>
 <1525957319-20557-3-git-send-email-argus.lin@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1525957319-20557-3-git-send-email-argus.lin@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: argus.lin@mediatek.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: Chenglin Xu <chenglin.xu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, wsd_upstream@mediatek.com, henryc.chen@mediatek.com, flora.fu@mediatek.com, Chen Zhong <chen.zhong@mediatek.com>, Christophe Jaillet <christophe.jaillet@wanadoo.fr>, Arvind Yadav <arvind.yadav.cs@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On 05/10/2018 03:01 PM, argus.lin@mediatek.com wrote:
> From: Argus Lin <argus.lin@mediatek.com>
> 
> PWRAP_DEW_CIPHER_LOAD and PWRAP_DEW_CIPHER_START only exist at
> PMIC_mt6397 datasheet. We fix it before merge PMIC_mt6351 driver.
> 
> Fixes: 5ae48040aa47 ("soc: mediatek: PMIC wrap: add mt6323 slave support")

Same here, you forgot Signed-off-by tag.

> ---
>  drivers/soc/mediatek/mtk-pmic-wrap.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
> index e9e054a..9a01e30 100644
> --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
> @@ -1080,8 +1080,6 @@ static int pwrap_init_cipher(struct pmic_wrapper *wrp)
>  	pwrap_write(wrp, wrp->slave->dew_regs[PWRAP_DEW_CIPHER_SWRST], 0x0);
>  	pwrap_write(wrp, wrp->slave->dew_regs[PWRAP_DEW_CIPHER_KEY_SEL], 0x1);
>  	pwrap_write(wrp, wrp->slave->dew_regs[PWRAP_DEW_CIPHER_IV_SEL], 0x2);
> -	pwrap_write(wrp, wrp->slave->dew_regs[PWRAP_DEW_CIPHER_LOAD], 0x1);
> -	pwrap_write(wrp, wrp->slave->dew_regs[PWRAP_DEW_CIPHER_START], 0x1);
>  
>  	switch (wrp->slave->type) {
>  	case PMIC_MT6397:
> -- 
> 1.8.1.1.dirty
> 
> ************* Email Confidentiality Notice ********************
> The information contained in this e-mail message (including any 
> attachments) may be confidential, proprietary, privileged, or otherwise
> exempt from disclosure under applicable laws. It is intended to be 
> conveyed only to the designated recipient(s). Any use, dissemination, 
> distribution, printing, retaining or copying of this e-mail (including its 
> attachments) by unintended recipient(s) is strictly prohibited and may 
> be unlawful. If you are not an intended recipient of this e-mail, or believe 
> that you have received this e-mail in error, please notify the sender 
> immediately (by replying to this e-mail), delete any and all copies of 
> this e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!
> 
