From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v4 03/10] mfd: mt6397: modify suspend/resume behavior
Date: Mon, 12 Aug 2019 12:00:10 +0100
Message-ID: <20190812110010.GQ26727@dell>
References: <1564982518-32163-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1564982518-32163-4-git-send-email-hsin-hsiung.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1564982518-32163-4-git-send-email-hsin-hsiung.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, Eddie Huang <eddie.huang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Thomas Gleixner <tglx@linutronix.de>, Richard Fontana <rfontana@redhat.com>, Kate Stewart <kstewart@linuxfoundation.org>, Allison Randal <allison@lohutok.net>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org

On Mon, 05 Aug 2019, Hsin-Hsiung Wang wrote:

> Some pmics don't need backup interrupt settings, so we change to use
> pm notifier for the pmics which are necessary to store settings.
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  drivers/mfd/mt6397-core.c       | 89 +++++++++++++++++------------------------
>  drivers/mfd/mt6397-irq.c        | 33 +++++++++++++++
>  include/linux/mfd/mt6397/core.h |  3 ++
>  3 files changed, 73 insertions(+), 52 deletions(-)

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
