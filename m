From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3 03/17] arm64: dts: marvell: fix CP110 ICU node size
Date: Mon, 25 Jun 2018 17:09:34 +0200
Message-ID: <20180625170934.4cd4319a@xps13>
References: <20180622151432.1566-1-miquel.raynal@bootlin.com>
        <20180622151432.1566-4-miquel.raynal@bootlin.com>
        <87a7ric3f1.fsf@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <87a7ric3f1.fsf@bootlin.com>
Sender: stable-owner@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Haim Boot <hayim@marvell.com>, Hanna Hawa <hannah@marvell.com>, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Gregory,

On Mon, 25 Jun 2018 17:05:22 +0200, Gregory CLEMENT
<gregory.clement@bootlin.com> wrote:

> Hi Miquel,
>  
>  On ven., juin 22 2018, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> 
> > ICU size in CP110 is not 0x10 but at least 0x440 bytes long (from the
> > specification).
> >
> > Fixes: 6ef84a827c37 ("arm64: dts: marvell: enable GICP and ICU on Armada 7K/8K")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>  
> 
> This patch was part of the last PR from arm-soc for Linus and should be
> part of 4.18-rc3, so if there is new version you can drop it.
> 

Sure, thanks for the reminder.

Miquèl
