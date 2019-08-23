From: Frank Wunderlich <frank-w@public-files.de>
Subject: Re: [BUG] [PATCH v5 02/10] mfd: mt6397: extract irq related code from core driver
Date: Fri, 23 Aug 2019 17:53:15 +0200
Message-ID: <4F1618E8-7D0E-41D1-AF27-5FCD2CFB41E4@public-files.de>
References: <1566531931-9772-1-git-send-email-hsin-hsiung.wang@mediatek.com> <1566531931-9772-3-git-send-email-hsin-hsiung.wang@mediatek.com> <trinity-1f82bff1-535e-47cd-9a2f-8faccb56e356-1566562433314@3c-app-gmx-bs11> <e8a918ab-3e7a-b487-db77-df28d56518ce@gmail.com>
Reply-To: frank-w@public-files.de
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e8a918ab-3e7a-b487-db77-df28d56518ce@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, srv_heupstream@mediatek.com, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sean Wang <sean.wang@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, Richard Fontana <rfontana@redhat.com>, Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org, =?ISO-8859-1?Q?Ren=E9_van_Dorst?= <opensource@vdorst.com>, Thomas Gleixner <tglx@linutronix.de>, Eddie Huang <eddie.huang@mediatek.com>, Lee Jones <lee.jones@linaro.org>, Kate Stewart <kstewart@linuxfoundation.org>, linux-rtc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Seems chip-id in 5=2E3 is read here

https://git=2Ekernel=2Eorg/pub/scm/linux/kernel/git/torvalds/linux=2Egit/t=
ree/drivers/mfd/mt6397-core=2Ec?h=3Dv5=2E3-rc5#n282

It is before platform_get_irq which may call irq-init changed in the probl=
ematic commit=2E

I will add a dev_info here in next-code to see value of id
