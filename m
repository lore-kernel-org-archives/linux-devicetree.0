Return-Path: <guodong.xu@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1754831.FONmYVUinF@phil>
References: <1459322696-29919-1-git-send-email-guodong.xu@linaro.org>
	<1459322696-29919-3-git-send-email-guodong.xu@linaro.org>
	<56FBBB2F.5030308@samsung.com>
	<1754831.FONmYVUinF@phil>
Date: Sat, 2 Apr 2016 20:11:33 +0800
Message-ID: <CAFGCpxxwq4qP5+cQVwnDN-qU+DW1bpEyVnK+jEhZ7_G4eS4FTw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mmc: dw_mmc: add resets support to dw_mmc
From: Guodong Xu <guodong.xu@linaro.org>
Content-Type: multipart/alternative; boundary=089e01229ed4772a14052f7f65ec
To: Heiko Stuebner <heiko@sntech.de>
Cc: Jaehoon Chung <jh80.chung@samsung.com>, Shawn Lin <shawn.lin@rock-chips.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, =?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, ijc+devicetree@hellion.org.uk, Kumar Gala <galak@codeaurora.org>, Ulf Hansson <ulf.hansson@linaro.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Xinwei Kong <kong.kongxinwei@hisilicon.com>, Zhangfei Gao <zhangfei.gao@linaro.org>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--089e01229ed4772a14052f7f65ec
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2 April 2016 at 02:42, Heiko Stuebner <heiko@sntech.de> wrote:

> Am Mittwoch, 30. M=C3=A4rz 2016, 20:40:31 schrieb Jaehoon Chung:
> > modified Rob's mail address.
> >
> > On 03/30/2016 04:24 PM, Guodong Xu wrote:
> > > mmc registers may in abnormal state if mmc is used in bootloader,
> > > eg. to support booting from eMMC. So we need reset mmc registers
> > > when kernel boots up, instead of assuming mmc is in clean state.
> >
> > Do you mean mmc(card side) register or dwmmc host controller's register
> on
> > host side?
> >
> > According to dwmmc controller TMR, there are two reset signals. One is
> > reset_n, other is rst_n. It seems this patch is relevant to reset_n(For
> > host). (rst_n is hardware reset for card.)
> >
> > So could you clarify better? Then it's helpful to me for understanding.=
.
>
> I think that actually means a reset of controller IP block logic, outside
> the control of the dw_mmc block itself.
>

Right, I mean dw_mmc host controller itself. Thanks.

-Guodong


>
> On Rockchip SoCs this gets triggered from the CRU (clock and reset unit),
> so
> I guess if I'm reading the manual correctly, should be the reset_n signal
> of
> the ip block.
>
> rst_n on the other hand gets triggered through a dw_mmc register setting
> and
> is already handled by the dw_mmc driver.
>
>
> Heiko
>

--089e01229ed4772a14052f7f65ec
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 2 April 2016 at 02:42, Heiko Stuebner <span dir=3D"ltr">&lt;<a href=
=3D"mailto:heiko@sntech.de" target=3D"_blank">heiko@sntech.de</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><span class=3D"">Am Mittwoch, 30=
. M=C3=A4rz 2016, 20:40:31 schrieb Jaehoon Chung:<br>
&gt; modified Rob&#39;s mail address.<br>
&gt;<br>
&gt; On 03/30/2016 04:24 PM, Guodong Xu wrote:<br>
&gt; &gt; mmc registers may in abnormal state if mmc is used in bootloader,=
<br>
&gt; &gt; eg. to support booting from eMMC. So we need reset mmc registers<=
br>
&gt; &gt; when kernel boots up, instead of assuming mmc is in clean state.<=
br>
&gt;<br>
&gt; Do you mean mmc(card side) register or dwmmc host controller&#39;s reg=
ister on<br>
&gt; host side?<br>
&gt;<br>
&gt; According to dwmmc controller TMR, there are two reset signals. One is=
<br>
&gt; reset_n, other is rst_n. It seems this patch is relevant to reset_n(Fo=
r<br>
&gt; host). (rst_n is hardware reset for card.)<br>
&gt;<br>
&gt; So could you clarify better? Then it&#39;s helpful to me for understan=
ding..<br>
<br>
</span>I think that actually means a reset of controller IP block logic, ou=
tside<br>
the control of the dw_mmc block itself.<br></blockquote><div><br></div><div=
>Right, I mean dw_mmc host controller itself. Thanks.</div><div><br></div><=
div>-Guodong</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
On Rockchip SoCs this gets triggered from the CRU (clock and reset unit), s=
o<br>
I guess if I&#39;m reading the manual correctly, should be the reset_n sign=
al of<br>
the ip block.<br>
<br>
rst_n on the other hand gets triggered through a dw_mmc register setting an=
d<br>
is already handled by the dw_mmc driver.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
<br>
Heiko<br>
</font></span></blockquote></div><br></div></div>

--089e01229ed4772a14052f7f65ec--
