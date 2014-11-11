From: Jiang Liu <jiang.liu@linux.intel.com>
Subject: Re: [PATCH v5 0/6] ARM: mediatek: Add support for interrupt polarity
Date: Tue, 11 Nov 2014 19:41:12 +0800
Message-ID: <5461F5D8.7050700@linux.intel.com>
References: <1414576824-16143-1-git-send-email-yingjoe.chen@mediatek.com> <20141109053820.GU3698@titan.lakedaemon.net> <alpine.DEB.2.11.1411111234220.3935@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.11.1411111234220.3935@nanos>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>
Cc: Yingjoe Chen <yingjoe.chen@mediatek.com>, Marc Zyngier <marc.zyngier@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, arm@kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Grant Likely <grant.likely@linaro.org>, Boris BREZILLON <boris.brezillon@free-electrons.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com, yingjoe.chen@gmail.com, hc.yen@mediatek.com, eddie.huang@mediatek.com, nathan.chung@mediatek.com, yh.chen@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org



On 2014/11/11 19:35, Thomas Gleixner wrote:
> On Sun, 9 Nov 2014, Jason Cooper wrote:
> 
>> Thomas, Marc,
>>
>> Could I get Acks for the core changes and gic changes when you have
>> a moment?
> 
> this depends on the core irqdomain changes which are not yet in
> tip. I'm waiting for Jiangs latest iteration and Marcs feedback on
> those.
Hi Thomas,
	Sorry for dealy:)
	I think my previous version is good for merging. I only need to
update one patch to address a possible conflict on other architectures.
I'm testing the patch and should send it out soon.
Regards!
Gerry

> 
> Thanks,
> 
> 	tglx
> 
