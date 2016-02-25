Return-Path: <andy.gross@linaro.org>
MIME-Version: 1.0
In-Reply-To: <56CEE3D4.3030407@linaro.org>
References: <1456246153-18087-1-git-send-email-srinivas.kandagatla@linaro.org>
	<1456246236-18341-1-git-send-email-srinivas.kandagatla@linaro.org>
	<56CE3780.5060408@codeaurora.org>
	<56CEE3D4.3030407@linaro.org>
Date: Thu, 25 Feb 2016 17:44:37 -0600
Message-ID: <CAPBZ5QfD4q4hDg2Vfj8E_2Hjoa80feFN4cM+LkhdGgHLDkKx_g@mail.gmail.com>
Subject: Re: [PATCH v3 6/8] arm64: dts: qcom: fix usb digital voltage levels
From: Andy Gross <andy.gross@linaro.org>
Content-Type: multipart/alternative; boundary=001a1141b2a6f0ea14052ca0c36c
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--001a1141b2a6f0ea14052ca0c36c
Content-Type: text/plain; charset=UTF-8

I think the vdd-levels were an oversight.  The voltages definitely need to
be correct.  As for the corner regulators, I believe the CPR driver was
supposed to address this.  The USB requests a specific voltage and
frequency and based on this the CPR would set the corner for the regulator.

Stephen, correct me if i am wrong.

On 25 February 2016 at 05:21, Srinivas Kandagatla <
srinivas.kandagatla@linaro.org> wrote:

>
>
> On 24/02/16 23:06, Stephen Boyd wrote:
>
>> On 02/23/2016 08:50 AM, Srinivas Kandagatla wrote:
>>
>>> This patch updates the digital voltage levels from corner values to
>>> microvolts as we are going to use s1 regulator directly for vddcx
>>> instead of s1_corner.
>>>
>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>> ---
>>>
>>
>> What's the plan for corners? Maybe we should remove the voltage setting
>> from the usb driver or drop the usb node entirely on msm8916 until we
>> resolve how we're going to handle corners. I'd like to avoid getting
>> stuck into some DT binding ABI mess here.
>>
>
> Andy/Bjorn, any comments on plans on corner regulators?
>
> Please note, that this is a patch to fix what is already in the mainline.
> Without this patch the regulator would be configured with 1uV or 5uV or 7uV
> which would obviously fail.
>
> THB, it does not make sense to drop feature which is functional, and I
> also agree that we should cleanup some of this mess at some point in time
> once we all the bits and pieces ready.
>
> I was surprised to see these usb bindings(qcom,vdd-levels) existed even
> before we had concept of corner regulators in mainline kernel. Which also
> suggests that this driver needs a proper relook once again.
>
> Thanks,
> srini
>

--001a1141b2a6f0ea14052ca0c36c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I think the vdd-levels were an oversight.=C2=A0 The voltag=
es definitely need to be correct.=C2=A0 As for the corner regulators, I bel=
ieve the CPR driver was supposed to address this.=C2=A0 The USB requests a =
specific voltage and frequency and based on this the CPR would set the corn=
er for the regulator.<div><br></div><div>Stephen, correct me if i am wrong.=
</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 25=
 February 2016 at 05:21, Srinivas Kandagatla <span dir=3D"ltr">&lt;<a href=
=3D"mailto:srinivas.kandagatla@linaro.org" target=3D"_blank">srinivas.kanda=
gatla@linaro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><s=
pan class=3D""><br>
<br>
On 24/02/16 23:06, Stephen Boyd wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On 02/23/2016 08:50 AM, Srinivas Kandagatla wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
This patch updates the digital voltage levels from corner values to<br>
microvolts as we are going to use s1 regulator directly for vddcx<br>
instead of s1_corner.<br>
<br>
Signed-off-by: Srinivas Kandagatla &lt;<a href=3D"mailto:srinivas.kandagatl=
a@linaro.org" target=3D"_blank">srinivas.kandagatla@linaro.org</a>&gt;<br>
---<br>
</blockquote>
<br>
What&#39;s the plan for corners? Maybe we should remove the voltage setting=
<br>
from the usb driver or drop the usb node entirely on msm8916 until we<br>
resolve how we&#39;re going to handle corners. I&#39;d like to avoid gettin=
g<br>
stuck into some DT binding ABI mess here.<br>
</blockquote>
<br></span>
Andy/Bjorn, any comments on plans on corner regulators?<br>
<br>
Please note, that this is a patch to fix what is already in the mainline. W=
ithout this patch the regulator would be configured with 1uV or 5uV or 7uV =
which would obviously fail.<br>
<br>
THB, it does not make sense to drop feature which is functional, and I also=
 agree that we should cleanup some of this mess at some point in time once =
we all the bits and pieces ready.<br>
<br>
I was surprised to see these usb bindings(qcom,vdd-levels) existed even bef=
ore we had concept of corner regulators in mainline kernel. Which also sugg=
ests that this driver needs a proper relook once again.<br>
<br>
Thanks,<br>
srini<br>
</blockquote></div><br></div>

--001a1141b2a6f0ea14052ca0c36c--
