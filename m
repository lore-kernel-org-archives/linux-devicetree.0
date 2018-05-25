Return-Path: <SRS0=ZXEz=IM=codeaurora.org=ilialin@kernel.org>
Date: Fri, 25 May 2018 07:00:50 +0300
In-Reply-To: <20180525035412.3jjocp7ccmv5u2il@vireshk-i7>
References: <1527174220-13244-1-git-send-email-ilialin@codeaurora.org> <1527174220-13244-2-git-send-email-ilialin@codeaurora.org> <20180525035412.3jjocp7ccmv5u2il@vireshk-i7>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="----Z3MEPI20HW1HS56ZY88QOJ55NZ5Z9F"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v13 1/2] cpufreq: Add Kryo CPU scaling driver
From: Ilia Lin <ilialin@codeaurora.org>
Message-ID: <DF878CBB-304A-4116-83D5-DF6BCEB7C131@codeaurora.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: vireshk@kernel.org, nm@ti.com, sboyd@kernel.org, robh@kernel.org, mark.rutland@arm.com, rjw@rjwysocki.net, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

------Z3MEPI20HW1HS56ZY88QOJ55NZ5Z9F
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On May 25, 2018 6:54:12 AM GMT+03:00, Viresh Kumar <viresh=2Ekumar@linaro=
=2Eorg> wrote:
>On 24-05-18, 18:03, Ilia Lin wrote:
>> +static int __init qcom_cpufreq_kryo_init(void)
>> +{
>> +	struct device_node *np;
>> +	struct device *cpu_dev;
>> +	int ret;
>> +
>> +	cpu_dev =3D get_cpu_device(0);
>> +	if (NULL =3D=3D cpu_dev)
>> +		ret =3D -ENODEV;
>> +
>> +	np =3D dev_pm_opp_of_get_opp_desc_node(cpu_dev);
>> +	if (IS_ERR(np))
>> +		return PTR_ERR(np);
>> +
>> +	ret =3D of_device_is_compatible(np, "operating-points-v2-kryo-cpu");
>> +	of_node_put(np);
>> +	if (!ret)
>> +		return -ENOENT;
>> +
>
>I hate the fact that it is taking so long to get done with this=2E But
>can't you
>just check machine compatibility instead of this complicated setup to
>check OPP
>node ? Like:
>
>        if (!of_device_is_compatible("qcom,apq8096") &&
>            !of_device_is_compatible("qcom,msm8996"))
>                return;

I have to check the "operating-points-v2-kryo-cpu" anyway, so I moved it f=
rom probe to the init=2E

>
>And please see if you can add an entry in MAINTAINERS and add your
>working email
>id there=2E

Sure=2E Should this be part of the patch itself?

------Z3MEPI20HW1HS56ZY88QOJ55NZ5Z9F
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<br>
<br>
On May 25, 2018 6:54:12 AM GMT+03:00, Viresh Kumar &lt;viresh=2Ekumar@lina=
ro=2Eorg&gt; wrote:<br>
&gt;On 24-05-18, 18:03, Ilia Lin wrote:<br>
&gt;&gt; +static int __init qcom_cpufreq_kryo_init(void)<br>
&gt;&gt; +{<br>
&gt;&gt; +	struct device_node *np;<br>
&gt;&gt; +	struct device *cpu_dev;<br>
&gt;&gt; +	int ret;<br>
&gt;&gt; +<br>
&gt;&gt; +	cpu_dev =3D get_cpu_device(0);<br>
&gt;&gt; +	if (NULL =3D=3D cpu_dev)<br>
&gt;&gt; +		ret =3D -ENODEV;<br>
&gt;&gt; +<br>
&gt;&gt; +	np =3D dev_pm_opp_of_get_opp_desc_node(cpu_dev);<br>
&gt;&gt; +	if (IS_ERR(np))<br>
&gt;&gt; +		return PTR_ERR(np);<br>
&gt;&gt; +<br>
&gt;&gt; +	ret =3D of_device_is_compatible(np, &quot;operating-points-v2-k=
ryo-cpu&quot;);<br>
&gt;&gt; +	of_node_put(np);<br>
&gt;&gt; +	if (!ret)<br>
&gt;&gt; +		return -ENOENT;<br>
&gt;&gt; +<br>
&gt;<br>
&gt;I hate the fact that it is taking so long to get done with this=2E But=
<br>
&gt;can&#39;t you<br>
&gt;just check machine compatibility instead of this complicated setup to<=
br>
&gt;check OPP<br>
&gt;node ? Like:<br>
&gt;<br>
&gt;        if (!of_device_is_compatible(&quot;qcom,apq8096&quot;) &amp;&a=
mp;<br>
&gt;            !of_device_is_compatible(&quot;qcom,msm8996&quot;))<br>
&gt;                return;<br>
<br>
I have to check the &quot;operating-points-v2-kryo-cpu&quot; anyway, so I =
moved it from probe to the init=2E<br>
<br>
&gt;<br>
&gt;And please see if you can add an entry in MAINTAINERS and add your<br>
&gt;working email<br>
&gt;id there=2E<br>
<br>
Sure=2E Should this be part of the patch itself?<br>

------Z3MEPI20HW1HS56ZY88QOJ55NZ5Z9F--
