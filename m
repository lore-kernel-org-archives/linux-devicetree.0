Return-Path: <guodong.xu@linaro.org>
MIME-Version: 1.0
In-Reply-To: <56DC3BAD.8020107@rock-chips.com>
References: <1457254062-22677-1-git-send-email-guodong.xu@linaro.org>
	<1457254062-22677-2-git-send-email-guodong.xu@linaro.org>
	<56DC3BAD.8020107@rock-chips.com>
Date: Fri, 25 Mar 2016 13:35:05 +0800
Message-ID: <CAFGCpxz3GfFeduaz1Dkg0WvRJWs+GHdVu8uY0-wV=RGyRfBE=A@mail.gmail.com>
Subject: Re: [PATCH 2/2] mmc: dw_mmc: add resets support to dw_mmc
From: Guodong Xu <guodong.xu@linaro.org>
Content-Type: multipart/alternative; boundary=089e01229ed4dd6d88052ed8ecab
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: robh+dt@kernel.org, =?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, ijc+devicetree@hellion.org.uk, Kumar Gala <galak@codeaurora.org>, jh80.chung@samsung.com, Ulf Hansson <ulf.hansson@linaro.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-mmc@vger.kernel.org, shawn.lin@kernel-upstream.org, Xinwei Kong <kong.kongxinwei@hisilicon.com>, Zhangfei Gao <zhangfei.gao@linaro.org>
List-ID: <devicetree@vger.kernel.org>

--089e01229ed4dd6d88052ed8ecab
Content-Type: text/plain; charset=UTF-8

Hi, Shawn

Sorry I replied late. I added comments below.

On 6 March 2016 at 22:16, Shawn Lin <shawn.lin@rock-chips.com> wrote:

> On 2016/3/6 16:47, Guodong Xu wrote:
>
>> mmc registers may in abnormal state if mmc is used in bootloader,
>> eg. to support booting from eMMC. So we need reset mmc registers
>> when kernel boots up, instead of assuming mmc is in clean state.
>>
>> With this patch, user can add a 'resets' property into dw_mmc dts
>> node. When driver parse_dt and probe, it calls reset API to
>> deassert the 'reset' of dw_mmc host controller. When probe error or
>> remove, it calls reset API to assert it.
>>
>> Please also refer to Documentation/devicetree/bindings/reset/reset.txt
>>
>> Signed-off-by: Guodong Xu <guodong.xu@linaro.org>
>> Signed-off-by: Xinwei Kong <kong.kongxinwei@hisilicon.com>
>> Signed-off-by: Zhangfei Gao <zhangfei.gao@linaro.org>
>>
>
> Really should V2 and add the changelog.


Yes, will do. next version I sent will be labelled as V3.


>
>
> ---
>>   drivers/mmc/host/dw_mmc.c | 22 +++++++++++++++++++++-
>>   1 file changed, 21 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
>> index 242f9a0..281ea9c 100644
>> --- a/drivers/mmc/host/dw_mmc.c
>> +++ b/drivers/mmc/host/dw_mmc.c
>> @@ -2878,6 +2878,14 @@ static struct dw_mci_board *dw_mci_parse_dt(struct
>> dw_mci *host)
>>         if (!pdata)
>>                 return ERR_PTR(-ENOMEM);
>>
>> +       /* find reset controller when exist */
>> +       pdata->rstc = devm_reset_control_get_optional(dev, NULL);
>> +       if (IS_ERR(pdata->rstc)) {
>> +               if (PTR_ERR(pdata->rstc) == -EPROBE_DEFER)
>> +                       return ERR_PTR(-EPROBE_DEFER);
>> +               pdata->rstc = NULL;
>>
>
> maybe we can remove "pdata->rstc = NULL", and directly
> use IS_ERR(..) for the following "if (host->pdata->rstc != NULL)"
> statement
>
>
Yes, will do.
I see your point, other lines in this file are using IS_ERR(!..), I will
use this style too.



> +       }
>> +
>>         /* find out number of slots supported */
>>         of_property_read_u32(np, "num-slots", &pdata->num_slots);
>>
>> @@ -2949,7 +2957,9 @@ int dw_mci_probe(struct dw_mci *host)
>>
>>         if (!host->pdata) {
>>                 host->pdata = dw_mci_parse_dt(host);
>> -               if (IS_ERR(host->pdata)) {
>> +               if (PTR_ERR(host->pdata) == -EPROBE_DEFER)
>> +                       return -EPROBE_DEFER;
>>
>
> please fix the coding style here.


Do you mean to add additional {} for this 'if' , like this?

+               if (PTR_ERR(host->pdata) == -EPROBE_DEFER) {
> +                       return -EPROBE_DEFER;
>
   +                }

I will add {}.


>
> +               else if (IS_ERR(host->pdata)) {
>>                         dev_err(host->dev, "platform data not
>> available\n");
>>                         return -EINVAL;
>>                 }
>> @@ -3012,6 +3022,9 @@ int dw_mci_probe(struct dw_mci *host)
>>                 }
>>         }
>>
>> +       if (host->pdata->rstc != NULL)
>> +               reset_control_deassert(host->pdata->rstc);
>> +
>>
>
> sorry, I can't follow your intention here. Shouldn't it be something
> like "assert mmc -> may need delay -> deassert mmc". As your current
> code, nothing happend right?


The chip exits from bootloader with this bit asserted. And when entering
kernel, we only need to deassert.

In my current code, the driver deassert mmc in _probe(), and assert mmc in
_remove().



>
>
>         setup_timer(&host->cmd11_timer,
>>                     dw_mci_cmd11_timer, (unsigned long)host);
>>
>> @@ -3164,6 +3177,9 @@ err_dmaunmap:
>>         if (host->use_dma && host->dma_ops->exit)
>>                 host->dma_ops->exit(host);
>>
>> +       if (host->pdata->rstc != NULL)
>> +               reset_control_assert(host->pdata->rstc);
>> +
>>   err_clk_ciu:
>>         if (!IS_ERR(host->ciu_clk))
>>                 clk_disable_unprepare(host->ciu_clk);
>> @@ -3196,11 +3212,15 @@ void dw_mci_remove(struct dw_mci *host)
>>         if (host->use_dma && host->dma_ops->exit)
>>                 host->dma_ops->exit(host);
>>
>> +       if (host->pdata->rstc != NULL)
>> +               reset_control_assert(host->pdata->rstc);
>> +
>>         if (!IS_ERR(host->ciu_clk))
>>                 clk_disable_unprepare(host->ciu_clk);
>>
>>         if (!IS_ERR(host->biu_clk))
>>                 clk_disable_unprepare(host->biu_clk);
>> +
>>   }
>>
>
> unnecessary new line here.
>

Will fix.

-Guodong


>
>   EXPORT_SYMBOL(dw_mci_remove);
>>
>>
>>
>
> --
> Best Regards
> Shawn Lin
>
>

--089e01229ed4dd6d88052ed8ecab
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Shawn<div><br></div><div>Sorry I replied late. I added=
 comments below.<br><div class=3D"gmail_extra"><br><div class=3D"gmail_quot=
e">On 6 March 2016 at 22:16, Shawn Lin <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:shawn.lin@rock-chips.com" target=3D"_blank">shawn.lin@rock-chips.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bo=
rder-left-style:solid;padding-left:1ex"><span class=3D"">On 2016/3/6 16:47,=
 Guodong Xu wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">
mmc registers may in abnormal state if mmc is used in bootloader,<br>
eg. to support booting from eMMC. So we need reset mmc registers<br>
when kernel boots up, instead of assuming mmc is in clean state.<br>
<br>
With this patch, user can add a &#39;resets&#39; property into dw_mmc dts<b=
r>
node. When driver parse_dt and probe, it calls reset API to<br>
deassert the &#39;reset&#39; of dw_mmc host controller. When probe error or=
<br>
remove, it calls reset API to assert it.<br>
<br>
Please also refer to Documentation/devicetree/bindings/reset/reset.txt<br>
<br>
Signed-off-by: Guodong Xu &lt;<a href=3D"mailto:guodong.xu@linaro.org" targ=
et=3D"_blank">guodong.xu@linaro.org</a>&gt;<br>
Signed-off-by: Xinwei Kong &lt;<a href=3D"mailto:kong.kongxinwei@hisilicon.=
com" target=3D"_blank">kong.kongxinwei@hisilicon.com</a>&gt;<br>
Signed-off-by: Zhangfei Gao &lt;<a href=3D"mailto:zhangfei.gao@linaro.org" =
target=3D"_blank">zhangfei.gao@linaro.org</a>&gt;<br>
</blockquote>
<br></span>
Really should V2 and add the changelog.</blockquote><div><br></div><div>Yes=
, will do. next version I sent will be labelled as V3.</div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid=
;padding-left:1ex"><span class=3D""><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">
---<br>
=C2=A0 drivers/mmc/host/dw_mmc.c | 22 +++++++++++++++++++++-<br>
=C2=A0 1 file changed, 21 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c<br>
index 242f9a0..281ea9c 100644<br>
--- a/drivers/mmc/host/dw_mmc.c<br>
+++ b/drivers/mmc/host/dw_mmc.c<br>
@@ -2878,6 +2878,14 @@ static struct dw_mci_board *dw_mci_parse_dt(struct d=
w_mci *host)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!pdata)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ERR_PTR(-ENO=
MEM);<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* find reset controller when exist */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pdata-&gt;rstc =3D devm_reset_control_get_optio=
nal(dev, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(pdata-&gt;rstc)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (PTR_ERR(pdata-&=
gt;rstc) =3D=3D -EPROBE_DEFER)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return ERR_PTR(-EPROBE_DEFER);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pdata-&gt;rstc =3D =
NULL;<br>
</blockquote>
<br></span>
maybe we can remove &quot;pdata-&gt;rstc =3D NULL&quot;, and directly<br>
use IS_ERR(..) for the following &quot;if (host-&gt;pdata-&gt;rstc !=3D NUL=
L)&quot;<br>
statement<span class=3D""><br>
<br></span></blockquote><div><br></div><div>Yes, will do.=C2=A0</div><div>I=
 see your point, other lines in this file are using IS_ERR(!..), I will use=
 this style too.</div><div><br></div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border=
-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><spa=
n class=3D"">
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* find out number of slots supported */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 of_property_read_u32(np, &quot;num-slots&quot;,=
 &amp;pdata-&gt;num_slots);<br>
<br>
@@ -2949,7 +2957,9 @@ int dw_mci_probe(struct dw_mci *host)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!host-&gt;pdata) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host-&gt;pdata =3D =
dw_mci_parse_dt(host);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(host-&gt=
;pdata)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (PTR_ERR(host-&g=
t;pdata) =3D=3D -EPROBE_DEFER)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -EPROBE_DEFER;<br>
</blockquote>
<br></span>
please fix the coding style here.</blockquote><div><br></div><div>Do you me=
an to add additional {} for this &#39;if&#39; , like this?</div><div><br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:sol=
id;padding-left:1ex">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if (PTR_ERR(host-&gt;pdata) =3D=3D -EPROBE_DEFER) {<br>+=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return=
 -EPROBE_DEFER;<br></blockquote><div>=C2=A0 =C2=A0+ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}</div><div><br></div><div>I will add {}.=
</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bord=
er-left-style:solid;padding-left:1ex"><span class=3D""><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else if (IS_ERR(hos=
t-&gt;pdata)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 dev_err(host-&gt;dev, &quot;platform data not available\n&quot;)=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return -EINVAL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
@@ -3012,6 +3022,9 @@ int dw_mci_probe(struct dw_mci *host)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (host-&gt;pdata-&gt;rstc !=3D NULL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reset_control_deass=
ert(host-&gt;pdata-&gt;rstc);<br>
+<br>
</blockquote>
<br></span>
sorry, I can&#39;t follow your intention here. Shouldn&#39;t it be somethin=
g<br>
like &quot;assert mmc -&gt; may need delay -&gt; deassert mmc&quot;. As you=
r current<br>
code, nothing happend right?</blockquote><div><br></div><div>The chip exits=
 from bootloader with this bit asserted. And when entering kernel, we only =
need to deassert.</div><div><br></div><div>In my current code, the driver d=
eassert mmc in _probe(), and assert mmc in _remove().</div><div><br></div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-le=
ft-style:solid;padding-left:1ex"><span class=3D""><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 setup_timer(&amp;host-&gt;cmd11_timer,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dw_mc=
i_cmd11_timer, (unsigned long)host);<br>
<br>
@@ -3164,6 +3177,9 @@ err_dmaunmap:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (host-&gt;use_dma &amp;&amp; host-&gt;dma_op=
s-&gt;exit)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host-&gt;dma_ops-&g=
t;exit(host);<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (host-&gt;pdata-&gt;rstc !=3D NULL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reset_control_asser=
t(host-&gt;pdata-&gt;rstc);<br>
+<br>
=C2=A0 err_clk_ciu:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!IS_ERR(host-&gt;ciu_clk))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clk_disable_unprepa=
re(host-&gt;ciu_clk);<br>
@@ -3196,11 +3212,15 @@ void dw_mci_remove(struct dw_mci *host)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (host-&gt;use_dma &amp;&amp; host-&gt;dma_op=
s-&gt;exit)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host-&gt;dma_ops-&g=
t;exit(host);<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (host-&gt;pdata-&gt;rstc !=3D NULL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reset_control_asser=
t(host-&gt;pdata-&gt;rstc);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!IS_ERR(host-&gt;ciu_clk))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clk_disable_unprepa=
re(host-&gt;ciu_clk);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!IS_ERR(host-&gt;biu_clk))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clk_disable_unprepa=
re(host-&gt;biu_clk);<br>
+<br>
=C2=A0 }<br>
</blockquote>
<br></span>
unnecessary new line here.<br></blockquote><div><br></div><div>Will fix.</d=
iv><div><br></div><div>-Guodong</div><div>=C2=A0<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">
=C2=A0 EXPORT_SYMBOL(dw_mci_remove);<br>
<br>
<br><span class=3D""><font color=3D"#888888">
</font></span></blockquote><span class=3D""><font color=3D"#888888">
<br>
<br>
-- <br>
Best Regards<br>
Shawn Lin<br>
<br>
</font></span></blockquote></div><br></div></div></div>

--089e01229ed4dd6d88052ed8ecab--
