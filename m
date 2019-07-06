From: "Frank Wunderlich" <frank-w@public-files.de>
Subject: Aw: Re: Re: [PATCH v2 3/7] rtc: mt6397: improvements of rtc driver
Date: Sat, 6 Jul 2019 18:15:20 +0200
Message-ID: <trinity-a4e5f99f-00bc-4e90-9a48-64dbc6ba9c08-1562429720701@3c-app-gmx-bs42>
References: <20190703164822.17924-1-frank-w@public-files.de>
 <20190703164822.17924-4-frank-w@public-files.de>
 <20190704204336.GJ3692@piout.net>
 <trinity-7b1977bd-252b-4482-b708-cf704a9d3da1-1562340946396@3c-app-gmx-bs68>
 <20190705212448.GB12409@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190705212448.GB12409@piout.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>, Sebastian Reichel <sre@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org, Eddie Huang <eddie.huang@mediatek.com>, Thomas Gleixner <tglx@linutronix.de>, Richard Fontana <rfontana@redhat.com>, Allison Randal <allison@lohutok.net>, "David S . Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org

> Gesendet: Freitag, 05. Juli 2019 um 23:24 Uhr
> Von: "Alexandre Belloni" <alexandre.belloni@bootlin.com>

> Let's say the RTC has been used to start your platform, then the irq
> handler will be called as soon as the irq is requested, leading to a
> null pointer dereference.

i cannot test this with my platform, but i have changed it in my repo

https://github.com/frank-w/BPI-R2-4.14/commits/5.2-poweroff-mainline

> Yes and IIRC, I did comment that the rtc change also had to be separated
> from 1/7.

also this is put in separate commit, can you take a look before i post v3?

> Also, I really doubt this new compatible is necessary at all as you
> could simply directly use mediatek,mt6397-rtc.

imho this can confuse because the wrong chip-name is used in dts

regards Frank
