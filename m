From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: Re: [RFC PATCH 0/6] Armada 38x comphy driver to support 2.5Gbps
 networking
Date: Thu, 15 Nov 2018 11:02:20 +0100
Message-ID: <20181115110220.77cff36d@bootlin.com>
References: <20181112122933.GD30658@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20181112122933.GD30658@n2100.armlinux.org.uk>
Sender: netdev-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Kishon Vijay Abraham I <kishon@ti.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
List-Id: devicetree@vger.kernel.org

Hello Russell,

On Mon, 12 Nov 2018 12:29:33 +0000
Russell King - ARM Linux <linux@armlinux.org.uk> wrote:

>Hi,
>
>This series adds support for dynamically switching between 1Gbps
>and 2.5Gbps networking for the Marvell Armada 38x SoCs, tested on
>Armada 388 on the Clearfog platform.

I've performed some tests on my side on a Clearfog too, and also on an
Armada 385 board. It works fine on both setups.

Thanks for implementing this,

Maxime
