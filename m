Return-Path: <varkabhadram@gmail.com>
MIME-Version: 1.0
In-Reply-To: <5487A355.6030704@broadcom.com>
References: <rjui@broadcom.com>
	<1418172891-19441-1-git-send-email-rjui@broadcom.com>
	<1418172891-19441-2-git-send-email-rjui@broadcom.com>
	<5487A16C.5000707@gmail.com>
	<5487A355.6030704@broadcom.com>
Date: Wed, 10 Dec 2014 08:42:55 +0530
Message-ID: <CAEUmHyb_wu1kVj-G5LQj8Q_A1Tid1gSGbU=cGeBf4EXZgXChbg@mail.gmail.com>
Subject: Re: [PATCH 1/4] i2c: iProc: define Broadcom iProc I2C binding
From: Varka Bhadram <varkabhadram@gmail.com>
Content-Type: multipart/alternative; boundary=089e014940462d7f6e0509d409a2
To: Ray Jui <rjui@broadcom.com>
Cc: Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Christian Daudt <bcm@fixthebug.org>, Matt Porter <mporter@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@arm.linux.org.uk>, Scott Branden <sbranden@broadcom.com>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, bcm-kernel-feedback-list@broadcom.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--089e014940462d7f6e0509d409a2
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 10, 2014 at 7:05 AM, Ray Jui <rjui@broadcom.com> wrote:

>
>
> On 12/9/2014 5:27 PM, Varka Bhadram wrote:
>
>> Hi,
>>
>> On Wednesday 10 December 2014 06:24 AM, Ray Jui wrote:
>>
>>> Document the I2C device tree binding for Broadcom iProc family of
>>> SoCs
>>>
>>> Signed-off-by: Ray Jui <rjui@broadcom.com>
>>> Reviewed-by: Scott Branden <sbranden@broadcom.com>
>>> ---
>>>   .../devicetree/bindings/i2c/brcm,iproc-i2c.txt     |   37
>>> ++++++++++++++++++++
>>>   1 file changed, 37 insertions(+)
>>>   create mode 100644
>>> Documentation/devicetree/bindings/i2c/brcm,iproc-i2c.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/i2c/brcm,iproc-i2c.txt
>>> b/Documentation/devicetree/bindings/i2c/brcm,iproc-i2c.txt
>>> new file mode 100644
>>> index 0000000..81f982c
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/i2c/brcm,iproc-i2c.txt
>>> @@ -0,0 +1,37 @@
>>> +Broadcom iProc I2C controller
>>> +
>>> +Required properties:
>>> +
>>> +- compatible:
>>> +    Must be "brcm,iproc-i2c"
>>> +
>>> +- reg:
>>> +    Define the base and range of the I/O address space that contain
>>> the iProc
>>> +    I2C controller registers
>>> +
>>> +- interrupts:
>>> +    Should contain the I2C interrupt
>>> +
>>> +- clock-frequency:
>>> +    This is the I2C bus clock. Need to be either 100000 or 400000
>>> +
>>> +- #address-cells:
>>> +    Always 1 (for I2C addresses)
>>> +
>>> +- #size-cells:
>>> +    Always 0
>>> +
>>>
>>
>> All the properties defined with two lines of statements.
>>
>> Why cant they be with single line statement, like:
>>
>> compatible:    Must be "brcm,iproc-i2c"
>> reg:        Define the base and range of the I/O address space that
>>          contain the iProc I2C controller registers
>>
>> ....
>>
>>
>>  I thought making them two lines are more readable (and obviously that's
> very subjective, :)). But more importantly, it matches the format of other
> Broadcom iProc/Cygnus devicetree binding documents that are currently in
> progress of upstreaming.
>

But max of the bindings over the kernel follows single line statements.

-- 
Thanks and Regards,
Varka Bhadram.

--089e014940462d7f6e0509d409a2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Dec 10, 2014 at 7:05 AM, Ray Jui <span dir=3D"ltr">&lt;<a href=
=3D"mailto:rjui@broadcom.com" target=3D"_blank">rjui@broadcom.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div c=
lass=3D"h5"><br>
<br>
On 12/9/2014 5:27 PM, Varka Bhadram wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Hi,<br>
<br>
On Wednesday 10 December 2014 06:24 AM, Ray Jui wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Document the I2C device tree binding for Broadcom iProc family of<br>
SoCs<br>
<br>
Signed-off-by: Ray Jui &lt;<a href=3D"mailto:rjui@broadcom.com" target=3D"_=
blank">rjui@broadcom.com</a>&gt;<br>
Reviewed-by: Scott Branden &lt;<a href=3D"mailto:sbranden@broadcom.com" tar=
get=3D"_blank">sbranden@broadcom.com</a>&gt;<br>
---<br>
=C2=A0 .../devicetree/bindings/i2c/<u></u>brcm,iproc-i2c.txt=C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A037<br>
++++++++++++++++++++<br>
=C2=A0 1 file changed, 37 insertions(+)<br>
=C2=A0 create mode 100644<br>
Documentation/devicetree/<u></u>bindings/i2c/brcm,iproc-i2c.<u></u>txt<br>
<br>
diff --git a/Documentation/devicetree/<u></u>bindings/i2c/brcm,iproc-i2c.<u=
></u>txt<br>
b/Documentation/devicetree/<u></u>bindings/i2c/brcm,iproc-i2c.<u></u>txt<br=
>
new file mode 100644<br>
index 0000000..81f982c<br>
--- /dev/null<br>
+++ b/Documentation/devicetree/<u></u>bindings/i2c/brcm,iproc-i2c.<u></u>tx=
t<br>
@@ -0,0 +1,37 @@<br>
+Broadcom iProc I2C controller<br>
+<br>
+Required properties:<br>
+<br>
+- compatible:<br>
+=C2=A0 =C2=A0 Must be &quot;brcm,iproc-i2c&quot;<br>
+<br>
+- reg:<br>
+=C2=A0 =C2=A0 Define the base and range of the I/O address space that cont=
ain<br>
the iProc<br>
+=C2=A0 =C2=A0 I2C controller registers<br>
+<br>
+- interrupts:<br>
+=C2=A0 =C2=A0 Should contain the I2C interrupt<br>
+<br>
+- clock-frequency:<br>
+=C2=A0 =C2=A0 This is the I2C bus clock. Need to be either 100000 or 40000=
0<br>
+<br>
+- #address-cells:<br>
+=C2=A0 =C2=A0 Always 1 (for I2C addresses)<br>
+<br>
+- #size-cells:<br>
+=C2=A0 =C2=A0 Always 0<br>
+<br>
</blockquote>
<br>
All the properties defined with two lines of statements.<br>
<br>
Why cant they be with single line statement, like:<br>
<br>
compatible:=C2=A0 =C2=A0 Must be &quot;brcm,iproc-i2c&quot;<br>
reg:=C2=A0 =C2=A0 =C2=A0 =C2=A0 Define the base and range of the I/O addres=
s space that<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0contain the iProc I2C controller register=
s<br>
<br>
....<br>
<br>
<br>
</blockquote></div></div>
I thought making them two lines are more readable (and obviously that&#39;s=
 very subjective, :)). But more importantly, it matches the format of other=
 Broadcom iProc/Cygnus devicetree binding documents that are currently in p=
rogress of upstreaming.<br>
</blockquote></div><br></div><div class=3D"gmail_extra"><font face=3D"monos=
pace">But max of the bindings over the kernel follows single line statement=
s.<br><br clear=3D"all"></font></div><div class=3D"gmail_extra">-- <br><div=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Thanks and Regards,<br></d=
iv>Varka Bhadram.<br></div></div>
</div></div>

--089e014940462d7f6e0509d409a2--
