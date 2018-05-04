From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v7 2/2] PCI: mediatek: Using chained IRQ to setup IRQ
 handle
Date: Fri, 4 May 2018 09:45:33 +0100
Message-ID: <3a2c9b1a-613b-0816-48a9-e2048ed494b4@arm.com>
References: <1525412853-24367-1-git-send-email-honghui.zhang@mediatek.com>
 <1525412853-24367-3-git-send-email-honghui.zhang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1525412853-24367-3-git-send-email-honghui.zhang@mediatek.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: honghui.zhang@mediatek.com, lorenzo.pieralisi@arm.com, bhelgaas@google.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, yingjoe.chen@mediatek.com, eddie.huang@mediatek.com, ryder.lee@mediatek.com
Cc: hongkun.cao@mediatek.com, youlin.pei@mediatek.com, yong.wu@mediatek.com, yt.shen@mediatek.com, sean.wang@mediatek.com, xinping.qian@mediatek.com
List-Id: devicetree@vger.kernel.org

On 04/05/18 06:47, honghui.zhang@mediatek.com wrote:
> From: Honghui Zhang <honghui.zhang@mediatek.com>
> 
> Using irq_chip solution to setup IRQs in order to consist
> with IRQ framework.
> 
> Signed-off-by: Honghui Zhang <honghui.zhang@mediatek.com>
> Acked-by: Ryder Lee <ryder.lee@mediatek.com>

Thanks for going the extra mile and fixing this driver.

Reviewed-by: Marc Zyngier <marc.zyngier@arm.com>

	M.
-- 
Jazz is not dead. It just smells funny...
