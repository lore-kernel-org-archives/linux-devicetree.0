From: Thomas Kaiser <thomas.kaiser-HBiBh4CdNZE5WgrkcBd8vg@public.gmane.org>
Subject: Re: [PATCH 06/14] ARM: dts: sun8i: Add cpu0 label to sun8i-h3.dtsi
Date: Tue, 19 Jul 2016 07:10:54 -0700 (PDT)
Message-ID: <e57eb018-ef31-408e-84b2-b329510352d0@googlegroups.com>
References: <20160623192104.18720-1-megous@megous.com>
 <20160623192104.18720-7-megous@megous.com>
 <CAGb2v66eskVAxdz8VtjBJBCO7VV9WL4bdFDVrPWrSmxk4RASCw@mail.gmail.com>
 <adaf7f61-af80-cc02-8c47-af721b86f81e@megous.com>
 <CAGb2v665O75vQEfo5WdWtWJSbKEbLi6MBAHbgZC7pyrOCOu+6g@mail.gmail.com>
 <20160625070208.GA4000@lukather>
 <49ce09ae-052a-bb2b-ce66-f0aa0d0024e3@megous.com>
Reply-To: thomas.kaiser-HBiBh4CdNZE5WgrkcBd8vg@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_5368_974876365.1468937455001"
Return-path: <linux-sunxi+bncBDQ6N3ODDQIO72NYXQCRUBFLTUE7I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <49ce09ae-052a-bb2b-ce66-f0aa0d0024e3-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

------=_Part_5368_974876365.1468937455001
Content-Type: multipart/alternative;
	boundary="----=_Part_5369_1797078096.1468937455001"

------=_Part_5369_1797078096.1468937455001
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

Ond=C5=99ej Jirman wrote:
>
> We have boards that have 1.1/1.3V switching, only 1.3V, fine tuned=20
> voltage regulation and every such board will need it's own set of=20
> operating points.=20
>

Yes, and Allwinner's current BSP kernel code might encourage board makers=
=20
to implement a forth variant: switching between 4 different voltages=20
through GPIOs.

Currently we have 4 boards that rely on the simple '2 voltage regulation'=
=20
all using 1.1V/1.3V: Orange Pi One and Lite and NanoPi M1 and NEO. Then=20
there are 2 devices with (legacy) Linux support existing that use no=20
voltage regulation at all: Banana Pi M2+ (according to schematic using 1.2V=
=20
but in reality it's 1.3V VDD_CPUX) and Beelink X2. And according to Tsvetan=
=20
if/when Olimex will release their 2 H3 boards we have two more with fixed=
=20
but yet unknown VDD_CPUX voltage (since olimex fears overheating maybe they=
=20
use 1.1V or 1.2V limiting max cpufreq to 816 or 1008 MHz). And all the=20
bigger H3 based Orange Pi use the SY8106A voltage regulator being able to=
=20
adjust VDD_CPUX in steps of 20mV allowing VDD_CPUX to exceed 1200 MHz (a=20
reasonable value seems to be 1296 MHz since above throttling will be an=20
issue without active cooling)

Things get even worse since Xunlong uses copper layers inside the PCB to=20
spread the heat away from H3 so Orange Pi One/Lite do not overheat that=20
much like eg. NanoPi M1 (and maybe NEO -- can tell next week when I get dev=
=20
samples to play with). So while eg. Orange Pi One and NanoPi M1 switch=20
between the same voltages in the same way we (Armbian) found that we have=
=20
to allow M1 to downclock to even 240 MHz since when testing with legacy=20
kernel really heavy workloads led to throttling that low (even CPU cores=20
were killed at this low clockspeed -- same applies to BPi M2+ and Beelink=
=20
X2)

So i would second Ond=C5=99ej's suggestions since when we're talking about =
H3=20
devices we're not talking about tablet SoCs with accompanied PMU but 3=20
classes of devices behaving totally different in regard to cpufreq limits=
=20
and dvfs OPPs (and maybe someone is already developing a new H3 device=20
adding a forth variant switching between 4 different VDD_CPUX voltages)

Thomas

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

------=_Part_5369_1797078096.1468937455001
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>Ond=C5=99ej Jirman wrote:<blockquot=
e class=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left: =
1px #ccc solid;padding-left: 1ex;">We have boards that have 1.1/1.3V switch=
ing, only 1.3V, fine tuned
<br>voltage regulation and every such board will need it&#39;s own set of
<br>operating points.
<br></blockquote><div><br></div><div>Yes, and Allwinner&#39;s current BSP k=
ernel code might encourage board makers to implement a forth variant: switc=
hing between 4 different voltages through GPIOs.</div><div><br></div><div>C=
urrently we have 4 boards that rely on the simple &#39;2 voltage regulation=
&#39; all using 1.1V/1.3V: Orange Pi One and Lite and NanoPi M1 and NEO. Th=
en there are 2 devices with (legacy) Linux support existing that use no vol=
tage regulation at all: Banana Pi M2+ (according to schematic using 1.2V bu=
t in reality it&#39;s 1.3V VDD_CPUX) and Beelink X2. And according to Tsvet=
an if/when Olimex will release their 2 H3 boards we have two more with fixe=
d but yet unknown VDD_CPUX voltage (since olimex fears overheating maybe th=
ey use 1.1V or 1.2V limiting max cpufreq to 816 or 1008 MHz). And all the b=
igger H3 based Orange Pi use the SY8106A voltage regulator being able to ad=
just VDD_CPUX in steps of 20mV allowing VDD_CPUX to exceed 1200 MHz (a reas=
onable value seems to be 1296 MHz since above throttling will be an issue w=
ithout active cooling)</div><div><br></div><div>Things get even worse since=
 Xunlong uses copper layers inside the PCB to spread the heat away from H3 =
so Orange Pi One/Lite do not overheat that much like eg. NanoPi M1 (and may=
be NEO -- can tell next week when I get dev samples to play with). So while=
 eg. Orange Pi One and NanoPi M1 switch between the same voltages in the sa=
me way we (Armbian) found that we have to allow M1 to downclock to even 240=
 MHz since when testing with legacy kernel really heavy workloads led to th=
rottling that low (even CPU cores were killed at this low clockspeed -- sam=
e applies to BPi M2+ and Beelink X2)</div></div><div><br></div><div>So i wo=
uld second=C2=A0Ond=C5=99ej&#39;s suggestions since when we&#39;re talking =
about H3 devices we&#39;re not talking about tablet SoCs with accompanied P=
MU but 3 classes of devices behaving totally different in regard to cpufreq=
 limits and dvfs OPPs (and maybe someone is already developing a new H3 dev=
ice adding a forth variant switching between 4 different VDD_CPUX voltages)=
</div><div><br></div><div>Thomas</div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

------=_Part_5369_1797078096.1468937455001--

------=_Part_5368_974876365.1468937455001--
