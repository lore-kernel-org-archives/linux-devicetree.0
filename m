From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v5 0/6] ARM: mediatek: Add support for interrupt
 polarity
Date: Tue, 11 Nov 2014 12:35:49 +0100 (CET)
Message-ID: <alpine.DEB.2.11.1411111234220.3935@nanos>
References: <1414576824-16143-1-git-send-email-yingjoe.chen@mediatek.com> <20141109053820.GU3698@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141109053820.GU3698@titan.lakedaemon.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Cooper <jason@lakedaemon.net>
Cc: Yingjoe Chen <yingjoe.chen@mediatek.com>, Marc Zyngier <marc.zyngier@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Jiang Liu <jiang.liu@linux.intel.com>, arm@kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Grant Likely <grant.likely@linaro.org>, Boris BREZILLON <boris.brezillon@free-electrons.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com, yingjoe.chen@gmail.com, hc.yen@mediatek.com, eddie.huang@mediatek.com, nathan.chung@mediatek.com, yh.chen@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, Olof Johansson <olof@lixom.net>Arnd Bergmann <a>
List-Id: devicetree@vger.kernel.org

On Sun, 9 Nov 2014, Jason Cooper wrote:

> Thomas, Marc,
> 
> Could I get Acks for the core changes and gic changes when you have
> a moment?

this depends on the core irqdomain changes which are not yet in
tip. I'm waiting for Jiangs latest iteration and Marcs feedback on
those.

Thanks,

	tglx
