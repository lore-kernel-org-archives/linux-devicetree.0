Return-Path: <SRS0=NSi9=OB=linaro.org=loic.poulain@kernel.org>
MIME-Version: 1.0
References: <1542821264-9200-1-git-send-email-loic.poulain@linaro.org> <20181122155915.GB27764@roeck-us.net>
In-Reply-To: <20181122155915.GB27764@roeck-us.net>
From: Loic Poulain <loic.poulain@linaro.org>
Date: Thu, 22 Nov 2018 17:07:30 +0100
Message-ID: <CAMZdPi9yeFEussm=z0mng2iCiR7xyFUeWbSw=efMBn78yjzGAQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] watchdog: Add pm8916 watchdog driver
Content-Type: multipart/alternative; boundary="0000000000008b5c58057b4312d5"
To: Guenter Roeck <linux@roeck-us.net>
Cc: wim@linux-watchdog.org, Rob Herring <robh+dt@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-watchdog@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, Andy Gross <andy.gross@linaro.org>
List-ID: <devicetree@vger.kernel.org>

--0000000000008b5c58057b4312d5
Content-Type: text/plain; charset="UTF-8"

Hi Guenter,

On Thu, 22 Nov 2018 at 16:59, Guenter Roeck <linux@roeck-us.net> wrote:

> On Wed, Nov 21, 2018 at 06:27:42PM +0100, Loic Poulain wrote:
> > The PM816 module is a versatile PMIC with many diverse functions
> > integrated, including, a watchdog.
> > This watchdog is subcomponent of the PON (Power On) peripheral,
> > in the same way as pwrkey/resin buttons.
> > It works with two timers (2-stages), the first one generates an
> > IRQ to the main SoC (APQ8016/MSM8916), the second one performs
> > the reset.
> >
> > This driver expects the following device hierarchy:
> > [pm8916]->[pm8916-pon]->[pm8916-wdt]
> >
> > It uses the pm8916 regmap to access PM8916 registers.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > ---
> >  v2: SPDX license
> >      headers ordering
> >      coding styles / tabs / multi-line comments
> >      pretimeout / bark interrupt
> >      WDIOF_MAGICCLOSE flag
> >      timeout init via fdt
> >      devm usage
> >
> >  drivers/watchdog/Kconfig      |   8 ++
> >  drivers/watchdog/Makefile     |   1 +
> >  drivers/watchdog/pm8916_wdt.c | 214
> ++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 223 insertions(+)
> >  create mode 100644 drivers/watchdog/pm8916_wdt.c
> >
> > diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> > index 2d64333..ef2c2b5 100644
> > --- a/drivers/watchdog/Kconfig
> > +++ b/drivers/watchdog/Kconfig
> > @@ -847,6 +847,14 @@ config SPRD_WATCHDOG
> >         Say Y here to include watchdog timer supported
> >         by Spreadtrum system.
> >
> > +config PM8916_WATCHDOG
> > +     tristate "QCOM PM8916 pmic watchdog"
> > +     depends on OF && MFD_SPMI_PMIC
> > +     select WATCHDOG_CORE
> > +     help
> > +       Say Y here to include support watchdog timer embedded into the
> > +       pm8916 module.
> > +
> >  # X86 (i386 + ia64 + x86_64) Architecture
> >
> >  config ACQUIRE_WDT
> > diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> > index f69cdff..cc90e72 100644
> > --- a/drivers/watchdog/Makefile
> > +++ b/drivers/watchdog/Makefile
> > @@ -92,6 +92,7 @@ obj-$(CONFIG_STM32_WATCHDOG) += stm32_iwdg.o
> >  obj-$(CONFIG_UNIPHIER_WATCHDOG) += uniphier_wdt.o
> >  obj-$(CONFIG_RTD119X_WATCHDOG) += rtd119x_wdt.o
> >  obj-$(CONFIG_SPRD_WATCHDOG) += sprd_wdt.o
> > +obj-$(CONFIG_PM8916_WATCHDOG) += pm8916_wdt.o
> >
> >  # X86 (i386 + ia64 + x86_64) Architecture
> >  obj-$(CONFIG_ACQUIRE_WDT) += acquirewdt.o
> > diff --git a/drivers/watchdog/pm8916_wdt.c
> b/drivers/watchdog/pm8916_wdt.c
> > new file mode 100644
> > index 0000000..25d1110
> > --- /dev/null
> > +++ b/drivers/watchdog/pm8916_wdt.c
> > @@ -0,0 +1,214 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +#include <linux/bitops.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/property.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/watchdog.h>
> > +
> > +#define PON_INT_RT_STS                       0x10
> > +#define PMIC_WD_BARK_STS_BIT         BIT(6)
> > +
> > +#define PON_PMIC_WD_RESET_S1_TIMER   0x54
> > +#define PON_PMIC_WD_RESET_S2_TIMER   0x55
> > +
> > +#define PON_PMIC_WD_RESET_S2_CTL     0x56
> > +#define RESET_TYPE_WARM                      0x01
> > +#define RESET_TYPE_SHUTDOWN          0x04
> > +#define RESET_TYPE_HARD                      0x07
> > +
> > +#define PON_PMIC_WD_RESET_S2_CTL2    0x57
> > +#define S2_RESET_EN_BIT                      BIT(7)
> > +
> > +#define PON_PMIC_WD_RESET_PET                0x58
> > +#define WATCHDOG_PET_BIT             BIT(0)
> > +
> > +#define PM8916_WDT_DEFAULT_TIMEOUT   32
> > +#define PM8916_WDT_MIN_TIMEOUT               1
> > +#define PM8916_WDT_MAX_TIMEOUT               127
> > +
> > +struct pm8916_wdt {
> > +     struct device *dev;
>
> Not used anywhere.
>
> > +     struct regmap *regmap;
> > +     struct watchdog_device wdev;
> > +     u32 baseaddr;
> > +     int irq;
>
> Not used anywhere except for the probe function, and there it can be
> kept internal.
>
>
Thanks for the sharp-eyed review, I'll send a v3.

Guenter
>

--0000000000008b5c58057b4312d5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Guenter,<br><div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr">On Thu, 22 Nov 2018 at 16:59, Guenter Roeck &lt;<a href=3D"mailto=
:linux@roeck-us.net">linux@roeck-us.net</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">On Wed, Nov 21, 2018 at 06:27:42PM +0100, Loic Poulain =
wrote:<br>
&gt; The PM816 module is a versatile PMIC with many diverse functions<br>
&gt; integrated, including, a watchdog.<br>
&gt; This watchdog is subcomponent of the PON (Power On) peripheral,<br>
&gt; in the same way as pwrkey/resin buttons.<br>
&gt; It works with two timers (2-stages), the first one generates an<br>
&gt; IRQ to the main SoC (APQ8016/MSM8916), the second one performs<br>
&gt; the reset.<br>
&gt; <br>
&gt; This driver expects the following device hierarchy:<br>
&gt; [pm8916]-&gt;[pm8916-pon]-&gt;[pm8916-wdt]<br>
&gt; <br>
&gt; It uses the pm8916 regmap to access PM8916 registers.<br>
&gt; <br>
&gt; Signed-off-by: Loic Poulain &lt;<a href=3D"mailto:loic.poulain@linaro.=
org" target=3D"_blank">loic.poulain@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 v2: SPDX license<br>
&gt;=C2=A0 =C2=A0 =C2=A0 headers ordering<br>
&gt;=C2=A0 =C2=A0 =C2=A0 coding styles / tabs / multi-line comments<br>
&gt;=C2=A0 =C2=A0 =C2=A0 pretimeout / bark interrupt<br>
&gt;=C2=A0 =C2=A0 =C2=A0 WDIOF_MAGICCLOSE flag<br>
&gt;=C2=A0 =C2=A0 =C2=A0 timeout init via fdt<br>
&gt;=C2=A0 =C2=A0 =C2=A0 devm usage<br>
&gt; <br>
&gt;=C2=A0 drivers/watchdog/Kconfig=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 ++<=
br>
&gt;=C2=A0 drivers/watchdog/Makefile=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<b=
r>
&gt;=C2=A0 drivers/watchdog/pm8916_wdt.c | 214 ++++++++++++++++++++++++++++=
++++++++++++++<br>
&gt;=C2=A0 3 files changed, 223 insertions(+)<br>
&gt;=C2=A0 create mode 100644 drivers/watchdog/pm8916_wdt.c<br>
&gt; <br>
&gt; diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig<br>
&gt; index 2d64333..ef2c2b5 100644<br>
&gt; --- a/drivers/watchdog/Kconfig<br>
&gt; +++ b/drivers/watchdog/Kconfig<br>
&gt; @@ -847,6 +847,14 @@ config SPRD_WATCHDOG<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Say Y here to include watchdog timer =
supported<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0by Spreadtrum system.<br>
&gt;=C2=A0 <br>
&gt; +config PM8916_WATCHDOG<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tristate &quot;QCOM PM8916 pmic watchdog&quot;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on OF &amp;&amp; MFD_SPMI_PMIC<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select WATCHDOG_CORE<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Say Y here to include support watchdog tim=
er embedded into the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pm8916 module.<br>
&gt; +<br>
&gt;=C2=A0 # X86 (i386 + ia64 + x86_64) Architecture<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 config ACQUIRE_WDT<br>
&gt; diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile<br>
&gt; index f69cdff..cc90e72 100644<br>
&gt; --- a/drivers/watchdog/Makefile<br>
&gt; +++ b/drivers/watchdog/Makefile<br>
&gt; @@ -92,6 +92,7 @@ obj-$(CONFIG_STM32_WATCHDOG) +=3D stm32_iwdg.o<br>
&gt;=C2=A0 obj-$(CONFIG_UNIPHIER_WATCHDOG) +=3D uniphier_wdt.o<br>
&gt;=C2=A0 obj-$(CONFIG_RTD119X_WATCHDOG) +=3D rtd119x_wdt.o<br>
&gt;=C2=A0 obj-$(CONFIG_SPRD_WATCHDOG) +=3D sprd_wdt.o<br>
&gt; +obj-$(CONFIG_PM8916_WATCHDOG) +=3D pm8916_wdt.o<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # X86 (i386 + ia64 + x86_64) Architecture<br>
&gt;=C2=A0 obj-$(CONFIG_ACQUIRE_WDT) +=3D acquirewdt.o<br>
&gt; diff --git a/drivers/watchdog/pm8916_wdt.c b/drivers/watchdog/pm8916_w=
dt.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..25d1110<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/watchdog/pm8916_wdt.c<br>
&gt; @@ -0,0 +1,214 @@<br>
&gt; +// SPDX-License-Identifier: GPL-2.0<br>
&gt; +#include &lt;linux/bitops.h&gt;<br>
&gt; +#include &lt;linux/interrupt.h&gt;<br>
&gt; +#include &lt;linux/kernel.h&gt;<br>
&gt; +#include &lt;linux/module.h&gt;<br>
&gt; +#include &lt;linux/of.h&gt;<br>
&gt; +#include &lt;linux/property.h&gt;<br>
&gt; +#include &lt;linux/platform_device.h&gt;<br>
&gt; +#include &lt;linux/regmap.h&gt;<br>
&gt; +#include &lt;linux/watchdog.h&gt;<br>
&gt; +<br>
&gt; +#define PON_INT_RT_STS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x10<br>
&gt; +#define PMIC_WD_BARK_STS_BIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(6)<=
br>
&gt; +<br>
&gt; +#define PON_PMIC_WD_RESET_S1_TIMER=C2=A0 =C2=A00x54<br>
&gt; +#define PON_PMIC_WD_RESET_S2_TIMER=C2=A0 =C2=A00x55<br>
&gt; +<br>
&gt; +#define PON_PMIC_WD_RESET_S2_CTL=C2=A0 =C2=A0 =C2=A00x56<br>
&gt; +#define RESET_TYPE_WARM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01<br>
&gt; +#define RESET_TYPE_SHUTDOWN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x04<br=
>
&gt; +#define RESET_TYPE_HARD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x07<br>
&gt; +<br>
&gt; +#define PON_PMIC_WD_RESET_S2_CTL2=C2=A0 =C2=A0 0x57<br>
&gt; +#define S2_RESET_EN_BIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(7)<br>
&gt; +<br>
&gt; +#define PON_PMIC_WD_RESET_PET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0x58<br>
&gt; +#define WATCHDOG_PET_BIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0BIT(0)<br>
&gt; +<br>
&gt; +#define PM8916_WDT_DEFAULT_TIMEOUT=C2=A0 =C2=A032<br>
&gt; +#define PM8916_WDT_MIN_TIMEOUT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A01<br>
&gt; +#define PM8916_WDT_MAX_TIMEOUT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0127<br>
&gt; +<br>
&gt; +struct pm8916_wdt {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device *dev;<br>
<br>
Not used anywhere.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct regmap *regmap;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct watchdog_device wdev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 baseaddr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int irq;<br>
<br>
Not used anywhere except for the probe function, and there it can be<br>
kept internal.<br>
<br></blockquote><div><br></div><div>Thanks for the sharp-eyed review,<span=
 class=3D"gmail-sb-0"><span class=3D"gmail-dt"><span class=3D"gmail-dtText"=
><span class=3D"ex-sent gmail-t gmail-no-aq gmail-sents"></span><span class=
=3D"ex-sent gmail-t gmail-no-aq gmail-sents"> I&#39;ll send a v3.</span></s=
pan></span></span></div><div><span class=3D"gmail-sb-0"><span class=3D"gmai=
l-dt"><span class=3D"gmail-dtText"><span class=3D"ex-sent gmail-t gmail-no-=
aq gmail-sents"><br></span></span></span></span> </div><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">
Guenter<br>
</blockquote></div></div></div>

--0000000000008b5c58057b4312d5--
