From: "Frank Wunderlich" <frank-w@public-files.de>
Subject: Aw: Re: [PATCH v2 2/7] rtc: mt6397: move some common definitions
 into rtc.h
Date: Thu, 4 Jul 2019 13:49:06 +0200
Message-ID: <trinity-cc209a43-af34-4788-8b7a-8495052c8ca6-1562240946454@3c-app-gmx-bs27>
References: <20190703164822.17924-1-frank-w@public-files.de>
 <20190703164822.17924-3-frank-w@public-files.de>
 <62a4c4ce-7ab3-2f9d-a85e-be92340724a9@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <62a4c4ce-7ab3-2f9d-a85e-be92340724a9@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Richard Fontana <rfontana@redhat.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, "Paul E . McKenney" <paulmck@linux.ibm.com>, Lee Jones <lee.jones@linaro.org>, linux-rtc@vger.kernel.org, Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, Eddie Huang <eddie.huang@mediatek.com>, Allison Randal <allison@lohutok.net>, Alessandro Zummo <a.zummo@towertech.it>, Josef Friedl <josef.friedl@speed.at>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel <sre@kernel.org>, David S .
 Mill
List-Id: devicetree@vger.kernel.org

> Still missing commit message. Describe here why you need to do that.

ok, added note that headers are reused in power-off-driver

https://github.com/frank-w/BPI-R2-4.14/commits/5.2-poweroff-mainline

> Please check your email setting as discussed offline. Otherwise your patches
> won't get accepted.

tested with webmailer where it looks good :(

seems the problem is only shown when imported to patchwork

using only git sendemail in ubuntu 18.4 without any mta (have sendmail not installed) and no changes made to git sendemail except authentication.

i see that (except cover-letter which is quoted-printable) all is send with
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

so i have forced git sendemail now to
sendemail.composeencoding UTF-8

if this does not work i can try instead
sendemail.transferEncoding 8bit

regards Frank
