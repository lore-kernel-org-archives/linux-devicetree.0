Return-Path: <SRS0=qnyR=V5=nvidia.com=skomatineni@kernel.org>
From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [PATCH v7 10/20] clk: tegra: clk-dfll: Add suspend and resume
 support
Date: Thu, 1 Aug 2019 16:10:55 +0000
Message-ID: <BYAPR12MB3398C388471BC5811614C8FEC2DE0@BYAPR12MB3398.namprd12.prod.outlook.com>
References: <1564607463-28802-1-git-send-email-skomatineni@nvidia.com>
 <1564607463-28802-11-git-send-email-skomatineni@nvidia.com>
 <4400ffef-685f-b9e6-3b07-4790f851282c@gmail.com>,<501a9d0e-ce78-9b35-642d-dff7f9223926@gmail.com>
In-Reply-To: <501a9d0e-ce78-9b35-642d-dff7f9223926@gmail.com>
MIME-Version: 1.0
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BYAPR12MB3398C388471BC5811614C8FEC2DE0BYAPR12MB3398namp_"
To: Dmitry Osipenko <digetx@gmail.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "jason@lakedaemon.net" <jason@lakedaemon.net>, "marc.zyngier@arm.com" <marc.zyngier@arm.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "stefan@agner.ch" <stefan@agner.ch>, "mark.rutland@arm.com" <mark.rutland@arm.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, "sboyd@kernel.org" <sboyd@kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jui Chang Kuo <jckuo@nvidia.com>, Joseph Lo <josephl@nvidia.com>, Timo Alho <talho@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, Sandipan Patra <spatra@nvidia.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "rjw@rjwysocki.net" <rjw@rjwysocki.net>, "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--_000_BYAPR12MB3398C388471BC5811614C8FEC2DE0BYAPR12MB3398namp_
Content-Type: text/plain; charset="windows-1251"
Content-Transfer-Encoding: quoted-printable

I didn=92t updated any patches. This is still same v7 just resent with CPUF=
req maintainers in CC as I missed to add them earlier.
________________________________
From: Dmitry Osipenko <digetx@gmail.com>
Sent: Thursday, August 1, 2019 3:37:21 AM
To: Sowjanya Komatineni <skomatineni@nvidia.com>; thierry.reding@gmail.com =
<thierry.reding@gmail.com>; Jonathan Hunter <jonathanh@nvidia.com>; tglx@li=
nutronix.de <tglx@linutronix.de>; jason@lakedaemon.net <jason@lakedaemon.ne=
t>; marc.zyngier@arm.com <marc.zyngier@arm.com>; linus.walleij@linaro.org <=
linus.walleij@linaro.org>; stefan@agner.ch <stefan@agner.ch>; mark.rutland@=
arm.com <mark.rutland@arm.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>; Prashant Gaikwad <pgaikwa=
d@nvidia.com>; sboyd@kernel.org <sboyd@kernel.org>; linux-clk@vger.kernel.o=
rg <linux-clk@vger.kernel.org>; linux-gpio@vger.kernel.org <linux-gpio@vger=
.kernel.org>; Jui Chang Kuo <jckuo@nvidia.com>; Joseph Lo <josephl@nvidia.c=
om>; Timo Alho <talho@nvidia.com>; linux-tegra@vger.kernel.org <linux-tegra=
@vger.kernel.org>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.o=
rg>; Mikko Perttunen <mperttunen@nvidia.com>; Sandipan Patra <spatra@nvidia=
.com>; robh+dt@kernel.org <robh+dt@kernel.org>; devicetree@vger.kernel.org =
<devicetree@vger.kernel.org>; rjw@rjwysocki.net <rjw@rjwysocki.net>; viresh=
.kumar@linaro.org <viresh.kumar@linaro.org>; linux-pm@vger.kernel.org <linu=
x-pm@vger.kernel.org>
Subject: Re: [PATCH v7 10/20] clk: tegra: clk-dfll: Add suspend and resume =
support

01.08.2019 13:18, Dmitry Osipenko =EF=E8=F8=E5=F2:
> 01.08.2019 0:10, Sowjanya Komatineni =EF=E8=F8=E5=F2:
>> This patch implements DFLL suspend and resume operation.
>>
>> During system suspend entry, CPU clock will switch CPU to safe
>> clock source of PLLP and disables DFLL clock output.
>>
>> DFLL driver suspend confirms DFLL disable state and errors out on
>> being active.
>>
>> DFLL is re-initialized during the DFLL driver resume as it goes
>> through complete reset during suspend entry.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>  drivers/clk/tegra/clk-dfll.c               | 56 +++++++++++++++++++++++=
+++++++
>>  drivers/clk/tegra/clk-dfll.h               |  2 ++
>>  drivers/clk/tegra/clk-tegra124-dfll-fcpu.c |  1 +
>>  3 files changed, 59 insertions(+)
>>
>> diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
>> index f8688c2ddf1a..9900097ec2aa 100644
>> --- a/drivers/clk/tegra/clk-dfll.c
>> +++ b/drivers/clk/tegra/clk-dfll.c
>> @@ -1513,6 +1513,62 @@ static int dfll_init(struct tegra_dfll *td)
>>       return ret;
>>  }
>>
>> +/**
>> + * tegra_dfll_suspend - check DFLL is disabled
>> + * @dev: DFLL device *
>> + *
>> + * DFLL clock should be disabled by the CPUFreq driver. So, make
>> + * sure it is disabled and disable all clocks needed by the DFLL.
>> + */
>> +int tegra_dfll_suspend(struct device *dev)
>> +{
>> +    struct tegra_dfll *td =3D dev_get_drvdata(dev);
>> +
>> +    if (dfll_is_running(td)) {
>> +            dev_err(td->dev, "dfll is enabled while shouldn't be\n");
>> +            return -EBUSY;
>> +    }
>> +
>> +    reset_control_assert(td->dvco_rst);
>> +
>> +    return 0;
>> +}
>> +EXPORT_SYMBOL(tegra_dfll_suspend);
>> +
>> +/**
>> + * tegra_dfll_resume - reinitialize DFLL on resume
>> + * @dev: DFLL instance
>> + *
>> + * DFLL is disabled and reset during suspend and resume.
>> + * So, reinitialize the DFLL IP block back for use.
>> + * DFLL clock is enabled later in closed loop mode by CPUFreq
>> + * driver before switching its clock source to DFLL output.
>> + */
>> +int tegra_dfll_resume(struct device *dev)
>> +{
>> +    struct tegra_dfll *td =3D dev_get_drvdata(dev);
>> +
>> +    reset_control_deassert(td->dvco_rst);
>> +
>> +    pm_runtime_irq_safe(td->dev);
>
> Please see my previous reply.
>

Also, you should always bump version of the patches no matter what.
otherwise it turns out very confusing.

--_000_BYAPR12MB3398C388471BC5811614C8FEC2DE0BYAPR12MB3398namp_
Content-Type: text/html; charset="windows-1251"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dwindows-1=
251">
</head>
<body>
I didn=92t updated any patches. This is still same v7 just resent with CPUF=
req maintainers in CC as I missed to add them earlier.
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Dmitry Osipenko &lt;d=
igetx@gmail.com&gt;<br>
<b>Sent:</b> Thursday, August 1, 2019 3:37:21 AM<br>
<b>To:</b> Sowjanya Komatineni &lt;skomatineni@nvidia.com&gt;; thierry.redi=
ng@gmail.com &lt;thierry.reding@gmail.com&gt;; Jonathan Hunter &lt;jonathan=
h@nvidia.com&gt;; tglx@linutronix.de &lt;tglx@linutronix.de&gt;; jason@lake=
daemon.net &lt;jason@lakedaemon.net&gt;; marc.zyngier@arm.com
 &lt;marc.zyngier@arm.com&gt;; linus.walleij@linaro.org &lt;linus.walleij@l=
inaro.org&gt;; stefan@agner.ch &lt;stefan@agner.ch&gt;; mark.rutland@arm.co=
m &lt;mark.rutland@arm.com&gt;<br>
<b>Cc:</b> Peter De Schrijver &lt;pdeschrijver@nvidia.com&gt;; Prashant Gai=
kwad &lt;pgaikwad@nvidia.com&gt;; sboyd@kernel.org &lt;sboyd@kernel.org&gt;=
; linux-clk@vger.kernel.org &lt;linux-clk@vger.kernel.org&gt;; linux-gpio@v=
ger.kernel.org &lt;linux-gpio@vger.kernel.org&gt;; Jui Chang Kuo
 &lt;jckuo@nvidia.com&gt;; Joseph Lo &lt;josephl@nvidia.com&gt;; Timo Alho =
&lt;talho@nvidia.com&gt;; linux-tegra@vger.kernel.org &lt;linux-tegra@vger.=
kernel.org&gt;; linux-kernel@vger.kernel.org &lt;linux-kernel@vger.kernel.o=
rg&gt;; Mikko Perttunen &lt;mperttunen@nvidia.com&gt;; Sandipan Patra
 &lt;spatra@nvidia.com&gt;; robh&#43;dt@kernel.org &lt;robh&#43;dt@kernel.o=
rg&gt;; devicetree@vger.kernel.org &lt;devicetree@vger.kernel.org&gt;; rjw@=
rjwysocki.net &lt;rjw@rjwysocki.net&gt;; viresh.kumar@linaro.org &lt;viresh=
.kumar@linaro.org&gt;; linux-pm@vger.kernel.org &lt;linux-pm@vger.kernel.or=
g&gt;<br>
<b>Subject:</b> Re: [PATCH v7 10/20] clk: tegra: clk-dfll: Add suspend and =
resume support</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">01.08.2019 13:18, Dmitry Osipenko =EF=E8=F8=E5=F2:=
<br>
&gt; 01.08.2019 0:10, Sowjanya Komatineni =EF=E8=F8=E5=F2:<br>
&gt;&gt; This patch implements DFLL suspend and resume operation.<br>
&gt;&gt;<br>
&gt;&gt; During system suspend entry, CPU clock will switch CPU to safe<br>
&gt;&gt; clock source of PLLP and disables DFLL clock output.<br>
&gt;&gt;<br>
&gt;&gt; DFLL driver suspend confirms DFLL disable state and errors out on<=
br>
&gt;&gt; being active.<br>
&gt;&gt;<br>
&gt;&gt; DFLL is re-initialized during the DFLL driver resume as it goes<br=
>
&gt;&gt; through complete reset during suspend entry.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Sowjanya Komatineni &lt;skomatineni@nvidia.com&gt;<=
br>
&gt;&gt; ---<br>
&gt;&gt;&nbsp; drivers/clk/tegra/clk-dfll.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 56 &#43;&#43;&#43;&#=
43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#=
43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&gt;&gt;&nbsp; drivers/clk/tegra/clk-dfll.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 &#43;&#43;<b=
r>
&gt;&gt;&nbsp; drivers/clk/tegra/clk-tegra124-dfll-fcpu.c |&nbsp; 1 &#43;<b=
r>
&gt;&gt;&nbsp; 3 files changed, 59 insertions(&#43;)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-=
dfll.c<br>
&gt;&gt; index f8688c2ddf1a..9900097ec2aa 100644<br>
&gt;&gt; --- a/drivers/clk/tegra/clk-dfll.c<br>
&gt;&gt; &#43;&#43;&#43; b/drivers/clk/tegra/clk-dfll.c<br>
&gt;&gt; @@ -1513,6 &#43;1513,62 @@ static int dfll_init(struct tegra_dfll =
*td)<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt;&gt;&nbsp; }<br>
&gt;&gt;&nbsp; <br>
&gt;&gt; &#43;/**<br>
&gt;&gt; &#43; * tegra_dfll_suspend - check DFLL is disabled<br>
&gt;&gt; &#43; * @dev: DFLL device *<br>
&gt;&gt; &#43; *<br>
&gt;&gt; &#43; * DFLL clock should be disabled by the CPUFreq driver. So, m=
ake<br>
&gt;&gt; &#43; * sure it is disabled and disable all clocks needed by the D=
FLL.<br>
&gt;&gt; &#43; */<br>
&gt;&gt; &#43;int tegra_dfll_suspend(struct device *dev)<br>
&gt;&gt; &#43;{<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; struct tegra_dfll *td =3D dev_get_drvdata(=
dev);<br>
&gt;&gt; &#43;<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; if (dfll_is_running(td)) {<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; dev_err(td-&gt;dev, &quot;dfll is enabled while shouldn't be\n&quot;)=
;<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return -EBUSY;<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; }<br>
&gt;&gt; &#43;<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; reset_control_assert(td-&gt;dvco_rst);<br>
&gt;&gt; &#43;<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt;&gt; &#43;}<br>
&gt;&gt; &#43;EXPORT_SYMBOL(tegra_dfll_suspend);<br>
&gt;&gt; &#43;<br>
&gt;&gt; &#43;/**<br>
&gt;&gt; &#43; * tegra_dfll_resume - reinitialize DFLL on resume<br>
&gt;&gt; &#43; * @dev: DFLL instance<br>
&gt;&gt; &#43; *<br>
&gt;&gt; &#43; * DFLL is disabled and reset during suspend and resume.<br>
&gt;&gt; &#43; * So, reinitialize the DFLL IP block back for use.<br>
&gt;&gt; &#43; * DFLL clock is enabled later in closed loop mode by CPUFreq=
<br>
&gt;&gt; &#43; * driver before switching its clock source to DFLL output.<b=
r>
&gt;&gt; &#43; */<br>
&gt;&gt; &#43;int tegra_dfll_resume(struct device *dev)<br>
&gt;&gt; &#43;{<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; struct tegra_dfll *td =3D dev_get_drvdata(=
dev);<br>
&gt;&gt; &#43;<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; reset_control_deassert(td-&gt;dvco_rst);<b=
r>
&gt;&gt; &#43;<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; pm_runtime_irq_safe(td-&gt;dev);<br>
&gt; <br>
&gt; Please see my previous reply.<br>
&gt; <br>
<br>
Also, you should always bump version of the patches no matter what.<br>
otherwise it turns out very confusing.<br>
</div>
</span></font></div>
</body>
</html>

--_000_BYAPR12MB3398C388471BC5811614C8FEC2DE0BYAPR12MB3398namp_--
