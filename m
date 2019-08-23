From: Frank Wunderlich <frank-w@public-files.de>
Subject: Re: [BUG] [PATCH v5 02/10] mfd: mt6397: extract irq related code from
 core driver
Date: Fri, 23 Aug 2019 17:26:30 +0200
Message-ID: <0A87F427-2D81-412A-9549-09A51A021799@public-files.de>
References: <1566531931-9772-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1566531931-9772-3-git-send-email-hsin-hsiung.wang@mediatek.com>
 <trinity-1f82bff1-535e-47cd-9a2f-8faccb56e356-1566562433314@3c-app-gmx-bs11>
 <e8a918ab-3e7a-b487-db77-df28d56518ce@gmail.com>
Reply-To: frank-w@public-files.de
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <e8a918ab-3e7a-b487-db77-df28d56518ce@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, srv_heupstream@mediatek.com, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Brown <broonie@kernel.org>, Sean Wang <sean.wang@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Richard Fontana <rfontana@redhat.com>, Rob Herring <robh+dt@kernel.org>, Kate Stewart <kstewart@linuxfoundation.org>, =?ISO-8859-1?Q?Ren=E9_van_Dorst?= <opensource@vdorst.com>, Thomas Gleixner <tglx@linutronix.de>, Eddie Huang <eddie.huang@mediatek.com>, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
List-Id: devicetree@vger.kernel.org



Am 23. August 2019 16:56:13 MESZ schrieb Matthias Brugger <matthias.bgg@gmail.com>:
>are you sure that you provide the correct chip_id here? I saw 0x2023
>(if I
>remember correctly), while this switch checks for 0x23, 0x91 and 0x97,
>so I'm
>not sure if the problem really lies here. I didn't dig into the code to
>find out
>how the chip_id is created.

The chip-id 0x2023 is reported with 5.3-rc5, next-code says 0x0. So i guess the chipid is read out/calculated the wrong way. If calculation is not changed the read is changed compared to 5.3
