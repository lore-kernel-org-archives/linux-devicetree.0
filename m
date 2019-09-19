From: Frank Wunderlich <frank-w@public-files.de>
Subject: Re: Aw: Re: [BUG] [PATCH v5 02/10] mfd: mt6397: extract irq related code from core driver
Date: Thu, 19 Sep 2019 20:59:35 +0200
Message-ID: <904EC97A-486D-4C22-9D36-838D25EB7A6F@public-files.de>
References: <1566531931-9772-1-git-send-email-hsin-hsiung.wang@mediatek.com> <1566531931-9772-3-git-send-email-hsin-hsiung.wang@mediatek.com> <trinity-1f82bff1-535e-47cd-9a2f-8faccb56e356-1566562433314@3c-app-gmx-bs11> <e8a918ab-3e7a-b487-db77-df28d56518ce@gmail.com> <0A87F427-2D81-412A-9549-09A51A021799@public-files.de> <b5a21908-faee-17d1-ce26-99b941c0fa70@gmail.com> <trinity-a57f08bb-e30e-4e74-911c-c40e335d00da-1566580580817@3c-app-gmx-bs75> <1567059876.15320.3.camel@mtksdaap41>
Reply-To: frank-w@public-files.de
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1567059876.15320.3.camel@mtksdaap41>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mediatek@lists.infradead.org, Hsin-hsiung Wang <hsin-hsiung.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, srv_heupstream@mediatek.com, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Brown <broonie@kernel.org>, Sean Wang <sean.wang@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Richard Fontana <rfontana@redhat.com>, Rob Herring <robh+dt@kernel.org>, Kate Stewart <kstewart@linuxfoundation.org>, =?ISO-8859-1?Q?=22Ren=E9_van_Dorst=22?= <opensource@vdorst.com>, Thomas Gleixner <tglx@linutronix.de>, Eddie Huang <eddie.huang@mediatek.com>, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi

When is new version ready? First 2 patches are still in next for 5=2E4 and=
 i see no fix so i guess it is still broken=2E

Regards Frank

Am 29=2E August 2019 08:24:36 MESZ schrieb Hsin-hsiung Wang <hsin-hsiung=
=2Ewang@mediatek=2Ecom>:
>Hi Frank/Matthias,
>
>Thanks for your comments=2E
>The root cause seems I didn't split the code well=2E
>I will fix it in the next version=2E
