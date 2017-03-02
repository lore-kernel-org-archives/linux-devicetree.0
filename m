Return-Path: <SRS0=hcJ5=2L=broadcom.com=jon.mason@kernel.org>
MIME-Version: 1.0
In-Reply-To: <de705b40-1a8a-faef-846e-3635682671f6@gmail.com>
References: <1488313886-17155-1-git-send-email-jon.mason@broadcom.com>
 <1488313886-17155-2-git-send-email-jon.mason@broadcom.com> <de705b40-1a8a-faef-846e-3635682671f6@gmail.com>
From: Jon Mason <jon.mason@broadcom.com>
Date: Thu, 2 Mar 2017 14:00:45 -0500
Message-ID: <CAC3K-4pg0TLF-1CV+NtgEh7a0-EHQBvxjNbbGJB32WsNa0U0wA@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: bcm5301x: Add TWD WD Support to DT
Content-Type: multipart/alternative; boundary=001a11443ef6e95fdd0549c40b37
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, Jon Mason <jonmason@broadcom.com>
List-ID: <devicetree@vger.kernel.org>

--001a11443ef6e95fdd0549c40b37
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 2, 2017 at 1:54 PM, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> =
wrote:

> On 02/28/2017 09:31 PM, Jon Mason wrote:
>
>> From: Jon Mason <jonmason@broadcom.com>
>>
>> Add support for the ARM TWD Watchdog to the bcm5301x device tree.  The
>> ARM TWD timer allocated the register space for the WDT, so this patch
>> necessitated shrinking that.  Also, the GIC masks were added for these.
>>
>> Signed-off-by: Jon Mason <jonmason@broadcom.com>
>> ---
>>  arch/arm/boot/dts/bcm5301x.dtsi | 15 ++++++++++++---
>>  1 file changed, 12 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/bcm5301x.dtsi
>> b/arch/arm/boot/dts/bcm5301x.dtsi
>> index 4fbb089..3fbc450 100644
>> --- a/arch/arm/boot/dts/bcm5301x.dtsi
>> +++ b/arch/arm/boot/dts/bcm5301x.dtsi
>> @@ -70,10 +70,19 @@
>>                         clocks =3D <&periph_clk>;
>>                 };
>>
>> -               local-timer@20600 {
>> +               timer@20600 {
>>                         compatible =3D "arm,cortex-a9-twd-timer";
>> -                       reg =3D <0x20600 0x100>;
>> -                       interrupts =3D <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH>;
>> +                       reg =3D <0x20600 0x20>;
>> +                       interrupts =3D <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(=
2) |
>> +                                                 IRQ_TYPE_LEVEL_HIGH)>;
>> +                       clocks =3D <&periph_clk>;
>> +               };
>>
>
> If you follow my recent e-mail thread:
> BCM5301X: GIC: PPI11 is secure or misconfigured (same for PPI13)
> you'll see IRQ_TYPE_LEVEL_HIGH type isn't correct. It should be
> IRQ_TYPE_EDGE_RISING.
>
> I believe patch switching to IRQ_TYPE_EDGE_RISING should be sent with Cc
> stable
> for kernels 4.8+.
>
> The same change is needed for "arm,cortex-a9-global-timer".
>
> Would you find time to revise this patch?
>

I'll do 2 patches.  One to revise this one and one to address the issue
you've discovered.  Will that be okay for you?

--001a11443ef6e95fdd0549c40b37
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Mar 2, 2017 at 1:54 PM, Rafa=C5=82 Mi=C5=82ecki <span dir=3D"lt=
r">&lt;<a href=3D"mailto:zajec5@gmail.com" target=3D"_blank">zajec5@gmail.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"HO=
EnZb"><div class=3D"h5">On 02/28/2017 09:31 PM, Jon Mason wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
From: Jon Mason &lt;<a href=3D"mailto:jonmason@broadcom.com" target=3D"_bla=
nk">jonmason@broadcom.com</a>&gt;<br>
<br>
Add support for the ARM TWD Watchdog to the bcm5301x device tree.=C2=A0 The=
<br>
ARM TWD timer allocated the register space for the WDT, so this patch<br>
necessitated shrinking that.=C2=A0 Also, the GIC masks were added for these=
.<br>
<br>
Signed-off-by: Jon Mason &lt;<a href=3D"mailto:jonmason@broadcom.com" targe=
t=3D"_blank">jonmason@broadcom.com</a>&gt;<br>
---<br>
=C2=A0arch/arm/boot/dts/bcm5301x.dt<wbr>si | 15 ++++++++++++---<br>
=C2=A01 file changed, 12 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/arch/arm/boot/dts/bcm5301x.d<wbr>tsi b/arch/arm/boot/dts/bcm53=
01x.d<wbr>tsi<br>
index 4fbb089..3fbc450 100644<br>
--- a/arch/arm/boot/dts/bcm5301x.d<wbr>tsi<br>
+++ b/arch/arm/boot/dts/bcm5301x.d<wbr>tsi<br>
@@ -70,10 +70,19 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 clocks =3D &lt;&amp;periph_clk&gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0local-timer@20600 {=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timer@20600 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 compatible =3D &quot;arm,cortex-a9-twd-timer&quot;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0reg =3D &lt;0x20600 0x100&gt;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0interrupts =3D &lt;GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0reg =3D &lt;0x20600 0x20&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0interrupts =3D &lt;GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0IRQ_TYPE_LEVEL_HIGH)&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0clocks =3D &lt;&amp;periph_clk&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
</blockquote>
<br></div></div>
If you follow my recent e-mail thread:<br>
BCM5301X: GIC: PPI11 is secure or misconfigured (same for PPI13)<br>
you&#39;ll see IRQ_TYPE_LEVEL_HIGH type isn&#39;t correct. It should be<br>
IRQ_TYPE_EDGE_RISING.<br>
<br>
I believe patch switching to IRQ_TYPE_EDGE_RISING should be sent with Cc st=
able<br>
for kernels 4.8+.<br>
<br>
The same change is needed for &quot;arm,cortex-a9-global-timer&quot;.<br>
<br>
Would you find time to revise this patch?<br></blockquote><div><br></div><d=
iv>I&#39;ll do 2 patches.=C2=A0 One to revise this one and one to address t=
he issue you&#39;ve discovered.=C2=A0 Will that be okay for you?</div><div>=
=C2=A0</div></div><br></div></div>

--001a11443ef6e95fdd0549c40b37--
