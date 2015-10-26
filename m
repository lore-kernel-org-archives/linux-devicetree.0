From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [PATCH v5 4/5] ARM: dts: mt8135: enable basic SMP bringup for mt8135
Date: Mon, 26 Oct 2015 09:56:50 +0900
Message-ID: <CAMAWPa-Ed2FJY2pW67EHHKBH3_eBZx0+oWfMJwc_DhEjrf7aMg@mail.gmail.com>
References: <1443799181-50409-1-git-send-email-yingjoe.chen@mediatek.com>
	<1443799181-50409-5-git-send-email-yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1443799181-50409-5-git-send-email-yingjoe.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yingjoe Chen <yingjoe.chen@mediatek.com>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Matthias Brugger <matthias.bgg@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, srv_heupstream@mediatek.com, Arnd Bergmann <arnd@arndb.de>, Stephen Boyd <sboyd@codeaurora.org>, lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>, Olof Johansson <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Tyler Baker <tyler.baker@linaro.org>
List-Id: devicetree@vger.kernel.org

Hello,

On Sat, Oct 3, 2015 at 12:19 AM, Yingjoe Chen <yingjoe.chen@mediatek.com> wrote:
> Add arch timer node to enable arch-timer support. MT8135 firmware
> doesn't correctly setup arch-timer frequency and CNTVOFF, add
> properties to workaround this.
>
> This also set cpu enable-method to enable SMP.
>
> Signed-off-by: Yingjoe Chen <yingjoe.chen@mediatek.com>

kernelci.org started detecting new boot failures for the mt8135-evb in
the arm-soc tree[1], and the boot failures were bisected down to this
patch, which landed upstream in the form of commit d186a394bb98 (ARM:
dts: mt8135: enable basic SMP bringup for mt8135)

Maybe this new SMP support requires updating the firmware on the board
as well?  If so, the changelog should've been a bit more explicit
about firmware dependencies.

Kevin

[1] http://kernelci.org/boot/mt8135-evbp1/job/arm-soc/kernel/v4.3-rc5-795-ga4b616012d2e/defconfig/multi_v7_defconfig/lab/lab-khilman/?_id=562b1cf959b5149e07111471
