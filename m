Return-Path: <SRS0=zglS=3W=axentia.se=peda@kernel.org>
Date: Fri, 14 Apr 2017 12:50:02 +0200
In-Reply-To: <20170414100705.tiltc433lidqzcr2@piout.net>
References: <1492118578-15356-1-git-send-email-peda@axentia.se> <20170414100705.tiltc433lidqzcr2@piout.net>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----HAP0QF7U9YDK9YGIJ6M37DHAWT0EOL"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] ARM: dts: at91: use correct compatible for the gpio mux controller
From: Peter Rosin <peda@axentia.se>
Message-ID: <3FB89D83-DD6C-41C9-AFB1-1F639803EA09@axentia.se>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: linux-kernel@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

------HAP0QF7U9YDK9YGIJ6M37DHAWT0EOL
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable



On April 14, 2017 12:07:05 PM GMT+02:00, Alexandre Belloni <alexandre=2Ebe=
lloni@free-electrons=2Ecom> wrote:
>On 13/04/2017 at 23:22:58 +0200, Peter Rosin wrote:
>> The compatible string for a gpio based mux controller is "gpio-mux",
>> and nothing else=2E
>>=20
>> Fixes: 29dd89418007 ("ARM: dts: at91: add envelope detector mux to
>the Axentia TSE-850")
>> Signed-off-by: Peter Rosin <peda@axentia=2Ese>
>> ---
>>  arch/arm/boot/dts/at91-tse850-3=2Edts | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> Hi!
>>=20
>> The compatible string for the gpio based mux changed along the way
>(on
>> request from Rob) but I failed to update the implementation in the
>> gpio-mux driver when I made that change=2E Consequently, I didn't
>notice
>> that I didn't update the compatible string here either, since it all
>> continued to work in my tests=2E=2E=2E
>>=20
>> The compatible string in the gpio-mux driver is being fixed to match
>> documentation, so this of course needs fixing too=2E No TSE-850 devices
>> are affected, except for the one on my desk=2E
>>=20
>> Sorry for the churn=2E
>>=20
>
>So, I folded that one in the previous one and updated my pull request=2E
>Hopefully this will be OK=2E
>
>--=20
>Alexandre Belloni, Free Electrons
>Embedded Linux and Kernel engineering
>http://free-electrons=2Ecom

From=20my POV, excellent!

Cheers,
peda

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
------HAP0QF7U9YDK9YGIJ6M37DHAWT0EOL
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><br><br><div class=3D"gmail_quote">On April 14, 20=
17 12:07:05 PM GMT+02:00, Alexandre Belloni &lt;alexandre=2Ebelloni@free-el=
ectrons=2Ecom&gt; wrote:<blockquote class=3D"gmail_quote" style=3D"margin: =
0pt 0pt 0pt 0=2E8ex; border-left: 1px solid rgb(204, 204, 204); padding-lef=
t: 1ex;">
<pre class=3D"k9mail">On 13/04/2017 at 23:22:58 +0200, Peter Rosin wrote:<=
br /><blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 1ex 0=2E8ex=
; border-left: 1px solid #729fcf; padding-left: 1ex;"> The compatible strin=
g for a gpio based mux controller is &quot;gpio-mux&quot;,<br /> and nothin=
g else=2E<br /> <br /> Fixes: 29dd89418007 (&quot;ARM: dts: at91: add envel=
ope detector mux to the Axentia TSE-850&quot;)<br /> Signed-off-by: Peter R=
osin &lt;peda@axentia=2Ese&gt;<br /> ---<br />  arch/arm/boot/dts/at91-tse8=
50-3=2Edts | 2 +-<br />  1 file changed, 1 insertion(+), 1 deletion(-)<br /=
> <br /> Hi!<br /> <br /> The compatible string for the gpio based mux chan=
ged along the way (on<br /> request from Rob) but I failed to update the im=
plementation in the<br /> gpio-mux driver when I made that change=2E Conseq=
uently, I didn't notice<br /> that I didn't update the compatible string he=
re either, since it all<br /> continued to work in my tests=2E=2E=2E<br /> =
<br /> The compatible string in the gpio-mux driver is being fixed to match=
<br /> documentation, so this of course needs fixing too=2E No TSE-850 devi=
ces<br /> are affected, except for the one on my desk=2E<br /> <br /> Sorry=
 for the churn=2E<br /> <br /></blockquote><br />So, I folded that one in t=
he previous one and updated my pull request=2E<br />Hopefully this will be =
OK=2E<br /></pre></blockquote></div><br>
From=20my POV, excellent!<br>
<br>
Cheers,<br>
peda<br>
<br>
-- <br>
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E</=
body></html>
------HAP0QF7U9YDK9YGIJ6M37DHAWT0EOL--
