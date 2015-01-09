From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v4 00/12]  Add Armada 38x GP and AP boards support
Date: Fri, 9 Jan 2015 16:20:17 +0100
Message-ID: <20150109152017.GB18832@lunn.ch>
References: <1420738694-6163-1-git-send-email-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1420738694-6163-1-git-send-email-gregory.clement@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Boris BREZILLON <boris.brezillon@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>, Tawfik Bayouk <tawfik@marvell.com>, devicetree@vger.kernel.org, Nadav Haklai <nadavh@marvell.com>, Lior Amsalem <alior@marvell.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

> Gregory CLEMENT (5):
>   ARM: mvebu: a38x: Add more pinctrl functions
>   ARM: mvebu: a38x: Add missing labels
>   ARM: mvebu: Document the Device Tree binding for the Armada 388 SoC
>   ARM: mvebu: Add Device Tree description of the Armada 388 SoC
>   ARM: mvebu: Add Armada 388 General Purpose Development Board support

All added to mvebu/dt

> 
> Maxime Ripard (7):
>   ARM: mvebu: Rename DEBUG_LL to indicate UART index
>   ARM: mvebu: Add UART1 as DEBUG_LL possible target

Added to mvebu/soc

>   ARM: mvebu: a38x: Fix node names

All added to mvebu/dt

>   pinctrl: mvebu: a38x: Add UART1 muxing options

Linus took this one already

>   ARM: mvebu: A38x: Remove redundant pinctrl informations
>   ARM: mvebu: Add a number of pinctrl functions
>   ARM: mvebu: Add Armada 385 Access Point Development Board support

All added to mvebu/dt

Thanks
	Andrew
