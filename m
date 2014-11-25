From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v8 1/4] irqchip: gic: Support hierarchy irq domain.
Date: Tue, 25 Nov 2014 11:27:29 +0000
Message-ID: <547467A1.8000900@arm.com>
References: <1416902662-19281-1-git-send-email-yingjoe.chen@mediatek.com> <1416902662-19281-2-git-send-email-yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1416902662-19281-2-git-send-email-yingjoe.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yingjoe Chen <yingjoe.chen@mediatek.com>, Mark Rutland <Mark.Rutland@arm.com>, Jason Cooper <jason@lakedaemon.net>, Thomas Gleixner <tglx@linutronix.de>, Jiang Liu <jiang.liu@linux.intel.com>
Cc: Boris BREZILLON <boris.brezillon@free-electrons.com>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <Pawel.Moll@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "hc.yen@mediatek.com" <hc.yen@mediatek.com>, "srv_heupstream@mediatek.com" <srv_heupstream@mediatek.com>, "yh.chen@mediatek.com" <yh.chen@mediatek.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>, Yijing Wang <wangyijing@huawei.com>, Rob Herring <robh+dt@kernel.org>, "nathan.chung@mediatek.com" <nathan.chung@mediatek.com>, "yingjoe.chen@gmail.com" <yingjoe.chen@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, "eddie.huang@mediatek.com" <eddie.huang@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>, Sascha Hauer <kernel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradea>
List-Id: devicetree@vger.kernel.org

On 25/11/14 08:04, Yingjoe Chen wrote:
> Add support to use gic as a parent for stacked irq domain.
> 
> Signed-off-by: Yingjoe Chen <yingjoe.chen@mediatek.com>

Looks good to me.

Acked-by: Marc Zyngier <marc.zyngier@arm.com>

	M.
-- 
Jazz is not dead. It just smells funny...
