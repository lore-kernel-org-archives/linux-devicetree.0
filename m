From: Kapil Hali <kapilh@broadcom.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: add SMP enable-method for Broadcom
 NSP
Date: Tue, 10 Nov 2015 21:33:12 +0530
Message-ID: <56421540.1020303@broadcom.com>
References: <1446844273-6460-1-git-send-email-kapilh@broadcom.com>
 <1446844273-6460-2-git-send-email-kapilh@broadcom.com>
 <563E6FC7.6070700@gmail.com> <20151108173116.GV8644@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151108173116.GV8644@n2100.arm.linux.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>, Florian Fainelli <f.fainelli@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Gregory Fong <gregory.0xf0@gmail.com>, Lee Jones <lee@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, Kever Yang <kever.yang@rock-chips.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Olof Johansson <olof@lixom.net>, Paul Walmsley <paul@pwsan.com>, Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

Hi Russel,

On 11/8/2015 11:01 PM, Russell King - ARM Linux wrote:
> On Sat, Nov 07, 2015 at 01:40:23PM -0800, Florian Fainelli wrote:
>> Le 06/11/2015 13:11, Kapil Hali a =E9crit :
>>> Add a compatible string "brcm,bcm-nsp-smp" for Broadcom's
>>> Northstar Plus CPU to the 32-bit ARM CPU device tree binding
>>> documentation file and create a new binding documentation for
>>> Northstar Plus CPU.
>>>
>>> Signed-off-by: Kapil Hali <kapilh@broadcom.com>
>>> ---
>>>  .../bindings/arm/bcm/brcm,nsp-cpu-method.txt       | 36 ++++++++++=
++++++++++++
>>>  Documentation/devicetree/bindings/arm/cpus.txt     |  1 +
>>>  2 files changed, 37 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/arm/bcm/brcm,=
nsp-cpu-method.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,nsp-cpu=
-method.txt b/Documentation/devicetree/bindings/arm/bcm/brcm,nsp-cpu-me=
thod.txt
>>> new file mode 100644
>>> index 0000000..8506da7
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/arm/bcm/brcm,nsp-cpu-method=
=2Etxt
>>> @@ -0,0 +1,36 @@
>>> +Broadcom Northstar Plus SoC CPU Enable Method
>>> +---------------------------------------------
>>> +This binding defines the enable method used for starting secondary
>>> +CPUs in the following Broadcom SoCs:
>>> +  BCM58522, BCM58525, BCM58535, BCM58622, BCM58623, BCM58625, BCM8=
8312
>>> +
>>> +The enable method is specified by defining the following required
>>> +properties in the "cpus" device tree node:
>>> +  - enable-method =3D "brcm,bcm-nsp-smp";
>>> +  - secondary-boot-reg =3D <...>;
>>> +
>>> +The secondary-boot-reg property is a u32 value that specifies the
>>> +physical address of the register used to request the ROM holding p=
en
>>> +code release a secondary CPU.
>>
>> Is it really how the ROM code is implemented, as a pen holding/relea=
se
>> mechanism (which sounds like how this was implemented previously in =
the
>> kernel actually) or should this be described in a more generic way a=
s
>> the physical address of the register where the secondary CPUs reset
>> vector address must be written to? Or something along these lines.
>=20
> Why do people insist on using holding pens to bring their secondary C=
PUs
> into existence?  I hope the hardware people aren't being dumb and hav=
e no
> way to hold in reset or power down their secondary CPUs, either of wh=
ich
> is a vital feature for things like kexec and the like.  If they do ha=
ve
> a way to hold secondary CPUs in reset or powered down, why aren't the=
y
> using that at boot instead of implementing the stupid Versatile schem=
e,
> which exists because Versatile _can't_ hold its CPUs in reset or powe=
r
> them down...
>=20
> It's times like this that I wonder what kind of drugs the hardware So=
C
> people are on, but I'm well aware that people contributing SMP bringu=
p
> solutions are also dumb idiots who copy the Versatile scheme with ver=
y
> little thought... (as you can see, I'm not mincing my words here - if
> people want to be lazy in this regard despite this having been brough=
t
> up multiple times, and the lead developers having said that the versa=
tile
> pen_release stuff should not be used, they earn themselves the right =
to
> be called dumb idiots.  Simple solution to avoid that title: don't be=
 a
> dumb idiot by copy the Versatile SMP bring up code!  It's not a sane
> model for any SoC sane SoC to follow.)
>=20
> Is this clear enough?
>=20
It was clear the very first time itself as pointed out by you and the=20
lead developers and hence the change was readily sent in the very next
patch set. I didn't change a comment in this patch, which is misleading=
=20
about the SMP enable-method used in the patch set, it is my mistake and=
  =20
I apologies for the same. I will change it and send the next patch set.

Also, before sending out the patch set, I had asked for a clarification=
=20
about the method: https://lkml.org/lkml/2015/11/6/234
=46or my understanding, I am repeating my query- In case of simple meth=
od of=20
waking up secondary core, smp_boot_secondary() will always return succe=
ss=20
indicating secondary core successfully started. I understand that in=20
__cpu_up(), primary core waits for completion till secondary core comes=
=20
online or time outs. However, is it appropriate to return successful st=
art=20
of secondary core without knowing if it really did?

Thanks,
Kapil Hali
