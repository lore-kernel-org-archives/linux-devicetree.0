From: "Frank Wunderlich" <frank-w@public-files.de>
Subject: [BUG] [PATCH v5 02/10] mfd: mt6397: extract irq related code from
 core driver
Date: Fri, 23 Aug 2019 14:13:53 +0200
Message-ID: <trinity-1f82bff1-535e-47cd-9a2f-8faccb56e356-1566562433314@3c-app-gmx-bs11>
References: <1566531931-9772-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1566531931-9772-3-git-send-email-hsin-hsiung.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1566531931-9772-3-git-send-email-hsin-hsiung.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, srv_heupstream@mediatek.com, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kate Stewart <kstewart@linuxfoundation.org>, Sean Wang <sean.wang@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Richard Fontana <rfontana@redhat.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, Eddie Huang <eddie.huang@mediatek.com>, Hsin-
List-Id: devicetree@vger.kernel.org

Hi,

this commit breaks mt6323 pmic on BananaPi-R2

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit=
/?id=3Da4872e80ce7d2a1844328176dbf279d0a2b89bdb

resulting in this message in dmesg:

mt6397 1000d000.pwrap:mt6323: unsupported chip: 0x0
and multiple
mtk-cpufreq mtk-cpufreq: failed to initialize dvfs info for cpu0

see discussion here:
http://lists.infradead.org/pipermail/linux-mediatek/2019-August/022505.htm=
l

after reverting this one the errors are gone, please provide a fix

regards Frank


> Gesendet: Freitag, 23. August 2019 um 05:45 Uhr
> Von: "Hsin-Hsiung Wang" <hsin-hsiung.wang@mediatek.com>
> Betreff: [PATCH v5 02/10] mfd: mt6397: extract irq related code from cor=
e driver
>
> In order to support different types of irq design, we decide to add
> separate irq drivers for different design and keep mt6397 mfd core
> simple and reusable to all generations of PMICs so far.
>
> Acked-for-mfd-by: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  drivers/mfd/Makefile            |   3 +-
>  drivers/mfd/mt6397-core.c       | 146 --------------------------------
>  drivers/mfd/mt6397-irq.c        | 181 +++++++++++++++++++++++++++++++++=
+++++++
>  include/linux/mfd/mt6397/core.h |   9 ++
>  4 files changed, 192 insertions(+), 147 deletions(-)
>  create mode 100644 drivers/mfd/mt6397-irq.c
