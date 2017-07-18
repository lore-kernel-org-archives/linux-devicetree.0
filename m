Return-Path: <SRS0=7MBo=6V=mediatek.com=yingjoe.chen@kernel.org>
Message-ID: <1500394987.17774.4.camel@mtksdaap41>
Subject: Re: [PATCH v2 9/9] soc: mediatek: pwrap: fixup warnings from coding
 style
From: Yingjoe Chen <yingjoe.chen@mediatek.com>
Date: Wed, 19 Jul 2017 00:23:07 +0800
In-Reply-To: <568c3b518b70a0af17cbef1223721b68448a8ac6.1500368529.git.sean.wang@mediatek.com>
References: <cover.1500368529.git.sean.wang@mediatek.com>
	 <568c3b518b70a0af17cbef1223721b68448a8ac6.1500368529.git.sean.wang@mediatek.com>
Content-Type: multipart/alternative; boundary="=-qiktSKUVunyeizBDzIab"
MIME-Version: 1.0
To: sean.wang@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, lgirdwood@gmail.com, broonie@kernel.org, jamesjj.liao@mediatek.com, henryc.chen@mediatek.com, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, chenglin.xu@mediatek.com, chen.zhong@mediatek.com, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--=-qiktSKUVunyeizBDzIab
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-07-18 at 17:49 +0800, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> fixup those warnings such as lines over 80 words and parenthesis
> alignment which would be complained by checkpatch.pl.
> 
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-pmic-wrap.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
> index 142f40a..5f1036f 100644
> --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
> @@ -1057,7 +1057,8 @@ static int pwrap_init_cipher(struct pmic_wrapper *wrp)
>  	/* wait for cipher data ready@PMIC */
>  	ret = pwrap_wait_for_state(wrp, pwrap_is_pmic_cipher_ready);
>  	if (ret) {
> -		dev_err(wrp->dev, "timeout waiting for cipher data ready@PMIC\n");
> +		dev_err(wrp->dev,
> +			"timeout waiting for cipher data ready@PMIC\n");

Sean,

I think the old code is easier to read. When the line is only slightly
over the 80 chars limit, some maintainers will even ask to keep it in
one line to make it easier to read.

So if it is OK with Matthias, I think we should just keep it as is.

Joe.C
 




--=-qiktSKUVunyeizBDzIab
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/4.2.2">
</HEAD>
<BODY>
<PRE>
On Tue, 2017-07-18 at 17:49 +0800, <A HREF="mailto:sean.wang@mediatek.com">sean.wang@mediatek.com</A> wrote:
&gt; From: Sean Wang &lt;<A HREF="mailto:sean.wang@mediatek.com">sean.wang@mediatek.com</A>&gt;
&gt; 
&gt; fixup those warnings such as lines over 80 words and parenthesis
&gt; alignment which would be complained by checkpatch.pl.
&gt; 
&gt; Signed-off-by: Sean Wang &lt;<A HREF="mailto:sean.wang@mediatek.com">sean.wang@mediatek.com</A>&gt;
&gt; ---
&gt;  drivers/soc/mediatek/mtk-pmic-wrap.c | 20 +++++++++++++-------
&gt;  1 file changed, 13 insertions(+), 7 deletions(-)
&gt; 
&gt; diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
&gt; index 142f40a..5f1036f 100644
&gt; --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
&gt; +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
&gt; @@ -1057,7 +1057,8 @@ static int pwrap_init_cipher(struct pmic_wrapper *wrp)
&gt;  	/* wait for cipher data ready@PMIC */
&gt;  	ret = pwrap_wait_for_state(wrp, pwrap_is_pmic_cipher_ready);
&gt;  	if (ret) {
&gt; -		dev_err(wrp-&gt;dev, &quot;timeout waiting for cipher data ready@PMIC\n&quot;);
&gt; +		dev_err(wrp-&gt;dev,
&gt; +			&quot;timeout waiting for cipher data ready@PMIC\n&quot;);

Sean,

I think the old code is easier to read. When the line is only slightly
over the 80 chars limit, some maintainers will even ask to keep it in
one line to make it easier to read.

So if it is OK with Matthias, I think we should just keep it as is.

Joe.C
 

</PRE>
<BR>
</BODY>
</HTML>

--=-qiktSKUVunyeizBDzIab--
