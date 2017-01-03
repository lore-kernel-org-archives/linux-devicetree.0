From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 1/8] ARM: dts: armada-370-rd: Utilize new DSA binding
Date: Tue, 3 Jan 2017 17:36:09 +0100
Message-ID: <20170103163609.GE32450@lunn.ch>
References: <20170102022249.10657-1-f.fainelli@gmail.com>
 <20170102022249.10657-2-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170102022249.10657-2-f.fainelli@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, vivien.didelot@savoirfairelinux.com, Russell King <linux@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Gregory Clement <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

> +
> +	switch: switch@10 {
> +		compatible = "marvell,mv88e6085";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <16>;

Hummm, a device tree question. switch@10, reg = <16>. Is there an
implicit understanding that the 10 is hex?

	 Andrew
