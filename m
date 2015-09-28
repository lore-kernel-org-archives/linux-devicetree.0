Return-Path: <wuht06@gmail.com>
MIME-Version: 1.0
In-Reply-To: <5608EE47.1020402@rock-chips.com>
References: <1439571353-30165-1-git-send-email-wuht06@gmail.com>
	<1439571353-30165-2-git-send-email-wuht06@gmail.com>
	<CAPDyKFp=XH+Vo_diRyhrMuB+v1rmTmxo3Lid3Wc-u1ohqNisKw@mail.gmail.com>
	<CAG_R4_VTXCV4NVMOwv-9F56-_pVsK0hU4go79ZhV3OFxwcF0mA@mail.gmail.com>
	<5608EE47.1020402@rock-chips.com>
Date: Mon, 28 Sep 2015 15:57:50 +0800
Message-ID: <CAG_R4_VvpbbZaJ-BN6A4mTniTTUthTuAufLeNG83r+U--PtPsg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/3] mmc: sprd: Add MMC host driver for Spreadtrum SoC
From: Hongtao Wu <wuht06@gmail.com>
Content-Type: multipart/alternative; boundary=047d7bd6be0ece544b0520ca0df8
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc <linux-mmc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "Orson.Zhai@spreadtrum.com" <Orson.Zhai@spreadtrum.com>, "Chunyan.Zhang@spreadtrum.com" <Chunyan.Zhang@spreadtrum.com>, "Jason.Wu@spreadtrum.com" <Jason.Wu@spreadtrum.com>
List-ID: <devicetree@vger.kernel.org>

--047d7bd6be0ece544b0520ca0df8
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 28, 2015 at 3:37 PM, Shawn Lin <shawn.lin@rock-chips.com> wrote:

> On 2015/9/28 15:18, Hongtao Wu wrote:
>
>>  >>
>>
>> On Thu, Sep 10, 2015 at 9:28 PM, Ulf Hansson <ulf.hansson@linaro.org
>> <mailto:ulf.hansson@linaro.org>> wrote:
>>  >
>>  > On 14 August 2015 at 18:55, Hongtao Wu <wuht06@gmail.com
>> <mailto:wuht06@gmail.com>> wrote:
>>
>
> [...]
>
>
>> Yes, most of this data can be removed, such as caps, caps2, base_clk.
>> However ocr_avail and signal_default_voltage are useful for us.
>> We can't fetch ocr_avail from external regulator via
>> mmc_regulator_get_supply,
>> because our regulator driver can't supply mmc_regulator_get_ocrmask()
>> interface for MMC driver.
>>
>
> Sorry for the noise but... IMO, your need to quirk your regulator driver
> stuffs rather than mmc.


Thank you, Shawn. I'll do it.

>
>
> And sometimes our external regulator can not supply 3.0v or 1.8v default
>> signal voltage that we expect. So this 3.0v or 1.8v default signal
>> voltage are
>> mandatory.
>>
>>
>
>
> --
> Best Regards
> Shawn Lin
>
>

--047d7bd6be0ece544b0520ca0df8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Sep 28, 2015 at 3:37 PM, Shawn Lin <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:shawn.lin@rock-chips.com" target=3D"_blank">shawn.lin@rock-chip=
s.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=
=3D"">On 2015/9/28 15:18, Hongtao Wu wrote:<br>
</span><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><span class=3D"">
=C2=A0&gt;&gt;<br>
<br>
On Thu, Sep 10, 2015 at 9:28 PM, Ulf Hansson &lt;<a href=3D"mailto:ulf.hans=
son@linaro.org" target=3D"_blank">ulf.hansson@linaro.org</a><br></span><spa=
n class=3D"">
&lt;mailto:<a href=3D"mailto:ulf.hansson@linaro.org" target=3D"_blank">ulf.=
hansson@linaro.org</a>&gt;&gt; wrote:<br>
=C2=A0&gt;<br>
=C2=A0&gt; On 14 August 2015 at 18:55, Hongtao Wu &lt;<a href=3D"mailto:wuh=
t06@gmail.com" target=3D"_blank">wuht06@gmail.com</a><br></span>
&lt;mailto:<a href=3D"mailto:wuht06@gmail.com" target=3D"_blank">wuht06@gma=
il.com</a>&gt;&gt; wrote:<br>
</blockquote>
<br>
[...]<span class=3D""><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
Yes, most of this data can be removed, such as caps, caps2, base_clk.<br>
However ocr_avail and signal_default_voltage are useful for us.<br>
We can&#39;t fetch ocr_avail from external regulator via<br>
mmc_regulator_get_supply,<br>
because our regulator driver can&#39;t supply mmc_regulator_get_ocrmask()<b=
r>
interface for MMC driver.<br>
</blockquote>
<br></span>
Sorry for the noise but... IMO, your need to quirk your regulator driver st=
uffs rather than mmc.</blockquote><div><br></div><div>Thank you, Shawn. I&#=
39;ll do it. <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"=
><div class=3D"h5"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
And sometimes our external regulator can not supply 3.0v or 1.8v default<br=
>
signal voltage that we expect. So this 3.0v or 1.8v default signal<br>
voltage are<br>
mandatory.<br>
<br>
</blockquote>
<br>
<br>
<br></div></div><span class=3D"HOEnZb"><font color=3D"#888888">
-- <br>
Best Regards<br>
Shawn Lin<br>
<br>
</font></span></blockquote></div><br></div></div>

--047d7bd6be0ece544b0520ca0df8--
