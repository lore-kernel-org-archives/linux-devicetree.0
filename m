Return-Path: <jaswinder.singh@linaro.org>
MIME-Version: 1.0
In-Reply-To: <2790199.44Rvt91EcZ@wuerfel>
References: <1422955310-6542-1-git-send-email-Vincent.Yang@tw.fujitsu.com>
	<3540319.u6RL7AO77m@wuerfel>
	<CAJe_ZhcXR4oaBKZx3n0ckCzXgbREoezUXjizJ09QXQVqEQ3G_g@mail.gmail.com>
	<2790199.44Rvt91EcZ@wuerfel>
Date: Thu, 5 Feb 2015 17:32:39 +0530
Message-ID: <CAJe_Zhf_WuRK2EE0Sj9ksXDDe5VA=DJ+H3eS4YRKpDZLdRRfow@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] mailbox: arm_mhu: add driver for ARM MHU controller
From: Jassi Brar <jaswinder.singh@linaro.org>
Content-Type: multipart/alternative; boundary=001a11c1ef629b7b35050e5614cd
To: Arnd Bergmann <arnd@arndb.de>
Cc: Vincent Yang <vincent.yang.fujitsu@gmail.com>, Kumar Gala <galak@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Devicetree List <devicetree@vger.kernel.org>, Vincent Yang <Vincent.Yang@tw.fujitsu.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Andy Green <andy.green@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, =?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll@arm.com>, Olof Johansson <olof@lixom.net>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Patch Tracking <patches@linaro.org>, arm@kernel.org, Tetsuya Nuriya <nuriya.tetsuya@jp.fujitsu.com>
List-ID: <devicetree@vger.kernel.org>

--001a11c1ef629b7b35050e5614cd
Content-Type: text/plain; charset=UTF-8

On Feb 5, 2015 5:13 PM, "Arnd Bergmann" <arnd@arndb.de> wrote:
>
> >
> > I know typedef's are frowned upon, but how bad is the following option?
> >        typedef void*  mbox_data_info
> >        int mbox_send_message(struct mbox_chan *chan, mbox_data_info
data);
>
> I don't see how that would help.
>
If it's abuse because the argument is a void*... What if we called it
mbox_data_info?  To say platforms are free to pass data as a pointer or a
value :)

Jassi

--001a11c1ef629b7b35050e5614cd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">On Feb 5, 2015 5:13 PM, &quot;Arnd Bergmann&quot; &lt;<a hre=
f=3D"mailto:arnd@arndb.de">arnd@arndb.de</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; I know typedef&#39;s are frowned upon, but how bad is the followi=
ng option?<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 typedef void*=C2=A0 mbox_data_info<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 int mbox_send_message(struct mbox_chan=
 *chan, mbox_data_info data);<br>
&gt;<br>
&gt; I don&#39;t see how that would help.<br>
&gt;<br>
If it&#39;s abuse because the argument is a void*... What if we called it m=
box_data_info?=C2=A0 To say platforms are free to pass data as a pointer or=
 a value :)=C2=A0 <br></p>
<p dir=3D"ltr">Jassi</p>

--001a11c1ef629b7b35050e5614cd--
