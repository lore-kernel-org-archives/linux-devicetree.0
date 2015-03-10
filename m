Return-Path: <gaurav.minocha.os@gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJiWhXQqGCik9tDqyaXEqU8+gEdw=FBVL_Fddbk_SjfwQ@mail.gmail.com>
References: <1425868525-113952-1-git-send-email-long.wanglong@huawei.com>
	<CAL_JsqLgxCQW==4YQrX193g+x22d1iL2jBGY4CSMnq7cQcSgZQ@mail.gmail.com>
	<CAL_JsqJiWhXQqGCik9tDqyaXEqU8+gEdw=FBVL_Fddbk_SjfwQ@mail.gmail.com>
Date: Tue, 10 Mar 2015 08:16:30 -0700
Message-ID: <CA+rpMb+xL4g5bzGQhUe7kFkCmpH3VwGXsVP3zypW1w6366gAkw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] Documentation: update the of_selftest.txt
From: Gaurav Minocha <gaurav.minocha.os@gmail.com>
Content-Type: multipart/alternative; boundary=089e013d0c94a749070510f0a227
To: Rob Herring <robherring2@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Grant Likely <grant.likely@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Kumar Gala <galak@codeaurora.org>, Wang Long <long.wanglong@huawei.com>, peifeiyue@huawei.com
List-ID: <devicetree@vger.kernel.org>

--089e013d0c94a749070510f0a227
Content-Type: text/plain; charset=UTF-8

Hi Rob,

On Mar 10, 2015 7:51 AM, "Rob Herring" <robherring2@gmail.com> wrote:
>
> On Tue, Mar 10, 2015 at 9:44 AM, Rob Herring <robherring2@gmail.com>
wrote:
> > On Sun, Mar 8, 2015 at 9:35 PM, Wang Long <long.wanglong@huawei.com>
wrote:
> >> Since the directory "drivers/of/testcase-data" is renamed
> >> to "drivers/of/unittest-data". so we should update the path
> >> in the of_selftest.txt.
>
> [...]
>
> >> -Before executing OF selftest, it is required to attach the test data
to
> >> +Before executing OF unittest, it is required to attach the test data
to
> >>  machine's device tree (if present). So, when selftest_data_add() is
called,
> >
> > This one too.
>
> Or not. The functions are all still "selftest". Not sure why Grant
> left all those...

I will send a patch to replace the selftest with unitest also will update
the document if required..

>
> Rob

--089e013d0c94a749070510f0a227
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Hi Rob, </p>
<p dir=3D"ltr">On Mar 10, 2015 7:51 AM, &quot;Rob Herring&quot; &lt;<a href=
=3D"mailto:robherring2@gmail.com">robherring2@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Tue, Mar 10, 2015 at 9:44 AM, Rob Herring &lt;<a href=3D"mailto:rob=
herring2@gmail.com">robherring2@gmail.com</a>&gt; wrote:<br>
&gt; &gt; On Sun, Mar 8, 2015 at 9:35 PM, Wang Long &lt;<a href=3D"mailto:l=
ong.wanglong@huawei.com">long.wanglong@huawei.com</a>&gt; wrote:<br>
&gt; &gt;&gt; Since the directory &quot;drivers/of/testcase-data&quot; is r=
enamed<br>
&gt; &gt;&gt; to &quot;drivers/of/unittest-data&quot;. so we should update =
the path<br>
&gt; &gt;&gt; in the of_selftest.txt.<br>
&gt;<br>
&gt; [...]<br>
&gt;<br>
&gt; &gt;&gt; -Before executing OF selftest, it is required to attach the t=
est data to<br>
&gt; &gt;&gt; +Before executing OF unittest, it is required to attach the t=
est data to<br>
&gt; &gt;&gt;=C2=A0 machine&#39;s device tree (if present). So, when selfte=
st_data_add() is called,<br>
&gt; &gt;<br>
&gt; &gt; This one too.<br>
&gt;<br>
&gt; Or not. The functions are all still &quot;selftest&quot;. Not sure why=
 Grant<br>
&gt; left all those...</p>
<p dir=3D"ltr">I will send a patch to replace the selftest with unitest als=
o will update the document if required..</p>
<p dir=3D"ltr">&gt;<br>
&gt; Rob<br>
</p>

--089e013d0c94a749070510f0a227--
