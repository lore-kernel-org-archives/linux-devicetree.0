Return-Path: <chander.kashyap@linaro.org>
MIME-Version: 1.0
In-Reply-To: <535AE617.9050202@gmail.com>
References: <1397832181-5153-1-git-send-email-t.figa@samsung.com>
	<1397832181-5153-3-git-send-email-t.figa@samsung.com>
	<CANuQgHF9up5=8+cWgC+9cm-8Bf7sGcRBcg1DyXm-pbmK=EMgmg@mail.gmail.com>
	<535AE617.9050202@gmail.com>
Date: Sat, 26 Apr 2014 16:18:01 +0530
Message-ID: <CANuQgHFbva_K-DvOn2Y91=pGQe5UjLEa+HrWZ-NSyY-ovTeudQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] ARM: EXYNOS: Fix core ID used by platsmp and hotplug code
From: Chander Kashyap <chander.kashyap@linaro.org>
Content-Type: multipart/alternative; boundary=001a11c2fcbaf91c4804f7efd038
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Tomasz Figa <t.figa@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, Arnd Bergmann <arnd@arndb.de>, Marek Szyprowski <m.szyprowski@samsung.com>
List-ID: <devicetree@vger.kernel.org>

--001a11c2fcbaf91c4804f7efd038
Content-Type: text/plain; charset=UTF-8

On Saturday, 26 April 2014, Tomasz Figa <tomasz.figa@gmail.com> wrote:

> Hi Chander,
>
> On 20.04.2014 09:23, Chander Kashyap wrote:
>
>> Hi Tomasz,
>>
>>
>> On 18 April 2014 20:12, Tomasz Figa <t.figa@samsung.com> wrote:
>>
>>> When CPU topology is specified in device tree, cpu_logical_map() does
>>> not return core ID anymore, but rather full MPIDR value. This breaks
>>> existing calculation of PMU register offsets on Exynos SoCs.
>>>
>>> This patch fixes the problem by adjusting the code to use only core ID
>>> bits of the value returned by cpu_logical_map() to allow CPU topology to
>>> be specified in device tree on Exynos SoCs.
>>>
>>> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
>>> ---
>>>   arch/arm/mach-exynos/hotplug.c | 10 ++++++----
>>>   arch/arm/mach-exynos/platsmp.c | 31 ++++++++++++++++++-------------
>>>   2 files changed, 24 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/arch/arm/mach-exynos/hotplug.c b/arch/arm/mach-exynos/
>>> hotplug.c
>>> index 7e0f31a..8a5f07d 100644
>>> --- a/arch/arm/mach-exynos/hotplug.c
>>> +++ b/arch/arm/mach-exynos/hotplug.c
>>> @@ -92,11 +92,13 @@ static inline void cpu_leave_lowpower(void)
>>>
>>>   static inline void platform_do_lowpower(unsigned int cpu, int
>>> *spurious)
>>>   {
>>> +       u32 mpidr = cpu_logical_map(cpu);
>>> +       u32 core_id = MPIDR_AFFINITY_LEVEL(mpidr, 0);
>>> +
>>>          for (;;) {
>>>
>>> -               /* make cpu1 to be turned off at next WFI command */
>>> -               if (cpu == 1)
>>> -                       __raw_writel(0, S5P_ARM_CORE_CONFIGURATION(1));
>>>
>>
>> I think this macro is not yet in ML code.
>>
>
> What do you mean? The S5P_ARM_CORE_CONFIGURATION() macro is being added by
> patch 1/4.


Yes I missed that earlier. That's why dropped these changes in my patch .


> Best regards,
> Tomasz
>


-- 
with warm regards,
Chander Kashyap

--001a11c2fcbaf91c4804f7efd038
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Saturday, 26 April 2014, Tomasz Figa &lt;<a href=3D"mailto:tomas=
z.figa@gmail.com">tomasz.figa@gmail.com</a>&gt; wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
Hi Chander,<br>
<br>
On 20.04.2014 09:23, Chander Kashyap wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Hi Tomasz,<br>
<br>
<br>
On 18 April 2014 20:12, Tomasz Figa &lt;<a>t.figa@samsung.com</a>&gt; wrote=
:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
When CPU topology is specified in device tree, cpu_logical_map() does<br>
not return core ID anymore, but rather full MPIDR value. This breaks<br>
existing calculation of PMU register offsets on Exynos SoCs.<br>
<br>
This patch fixes the problem by adjusting the code to use only core ID<br>
bits of the value returned by cpu_logical_map() to allow CPU topology to<br=
>
be specified in device tree on Exynos SoCs.<br>
<br>
Signed-off-by: Tomasz Figa &lt;<a>t.figa@samsung.com</a>&gt;<br>
---<br>
=C2=A0 arch/arm/mach-exynos/hotplug.c | 10 ++++++----<br>
=C2=A0 arch/arm/mach-exynos/platsmp.c | 31 ++++++++++++++++++------------<u=
></u>-<br>
=C2=A0 2 files changed, 24 insertions(+), 17 deletions(-)<br>
<br>
diff --git a/arch/arm/mach-exynos/<u></u>hotplug.c b/arch/arm/mach-exynos/<=
u></u>hotplug.c<br>
index 7e0f31a..8a5f07d 100644<br>
--- a/arch/arm/mach-exynos/<u></u>hotplug.c<br>
+++ b/arch/arm/mach-exynos/<u></u>hotplug.c<br>
@@ -92,11 +92,13 @@ static inline void cpu_leave_lowpower(void)<br>
<br>
=C2=A0 static inline void platform_do_lowpower(unsigned int cpu, int *spuri=
ous)<br>
=C2=A0 {<br>
+ =C2=A0 =C2=A0 =C2=A0 u32 mpidr =3D cpu_logical_map(cpu);<br>
+ =C2=A0 =C2=A0 =C2=A0 u32 core_id =3D MPIDR_AFFINITY_LEVEL(mpidr, 0);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (;;) {<br>
<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* make cpu1 to be turne=
d off at next WFI command */<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpu =3D=3D 1)<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 __raw_writel(0, S5P_ARM_CORE_CONFIGURATION(1))<u></u>;<br>
</blockquote>
<br>
I think this macro is not yet in ML code.<br>
</blockquote>
<br>
What do you mean? The S5P_ARM_CORE_CONFIGURATION() macro is being added by =
patch 1/4.</blockquote><div><br></div><div>Yes I missed that earlier. That&=
#39;s why dropped these changes in my patch .</div><div><br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">

<br>
Best regards,<br>
Tomasz<br>
</blockquote><br><br>-- <br>with warm regards,<br>Chander Kashyap<br>

--001a11c2fcbaf91c4804f7efd038--
