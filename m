From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH v4 6/6] arm64: dts: marvell: enable GICP and ICU on Armada 7K/8K
Date: Tue, 20 Jun 2017 17:42:14 +0200
Message-ID: <87fueu3bu1.fsf@free-electrons.com>
References: <20170620140722.31646-1-thomas.petazzoni@free-electrons.com>
        <20170620140722.31646-7-thomas.petazzoni@free-electrons.com>
        <87tw3a3dy4.fsf@free-electrons.com>
        <20170620173651.6370ea58@windsurf.lan>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170620173651.6370ea58@windsurf.lan> (Thomas Petazzoni's
        message of "Tue, 20 Jun 2017 17:36:51 +0200")
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-arm-kernel@lists.infradead.org, Nadav Haklai <nadavh@marvell.com>, Hanna Hawa <hannah@marvell.com>, Yehuda Yitschak <yehuday@marvell.com>, Antoine Tenart <antoine.tenart@free-electrons.com>, =?utf-8?Q?Miqu?= =?utf-8?Q?=C3=A8l?= Raynal <miquel.raynal@free-electrons.com>
List-Id: devicetree@vger.kernel.org

Hi Thomas,
 
 On mar., juin 20 2017, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Tue, 20 Jun 2017 16:56:35 +0200, Gregory CLEMENT wrote:
>
>> > +#include <dt-bindings/interrupt-controller/mvebu-icu.h>  
>> 
>> With this line you created a dependency with the patch "irqchip:
>> irq-mvebu-icu: new driver for Marvell ICU". And without it the dtb is
>> not buidable.
>> 
>> So either I wait for the next kernel release to apply it or I will need
>> a stable branch with the commit adding the mvebu-icu.h file.
>
> Alternatively, I could change the patch to use hardcoded values for now
> (i.e replace ICU_GRP_NSR everywhere by 0x0), and then change it during
> the next kernel cycle to use the #define value. I would really prefer
> such a solution to a solution where merging the entire ICU DT change
> would be delayed by one cycle.

As we start to be short in time then not having an external dependency
is easier so use the hardcoded value in your v5 series, and we will
switch to #define value in the next cycle.

Thanks,

Gregory

>
> Let me know what you prefer. Maybe Marc can say if the irqchip
> maintainers can provide a stable branch containing the mvebu-icu.h file.
>
> Best regards,
>
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
