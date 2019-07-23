From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 5/5] ARM: dts: armada385-wd-mcex2u: Add DTS file for WD
 My Cloud EX2 Ultra
Date: Tue, 23 Jul 2019 15:48:17 +0200
Message-ID: <20190723134817.GB2381@lunn.ch>
References: <cover.1563822216.git.evgenyz@gmail.com>
 <fd2a97d627c21a7e92a9a1aa15cf26c608d1e383.1563822216.git.evgenyz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <fd2a97d627c21a7e92a9a1aa15cf26c608d1e383.1563822216.git.evgenyz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Evgeny Kolesnikov <evgenyz@gmail.com>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jason Cooper <jason@lakedaemon.net>, Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

> +		internal-regs {
> +			timer@c200 {
> +				status = "disabled";
> +			};
> +
> +			i2c0: i2c@11000 {
> +				status = "okay";
> +				clock-frequency = <100000>;
> +			};
> +
> +			i2c1: i2c@11100 {
> +				status = "okay";
> +				clock-frequency = <100000>;
> +			};

It is a bit unusual to enable i2c busses when there is nothing on
them.

> +			ethernet@34000 {
> +				phy = <&phy0>;

phy has been deprecated. Please use phy-handle.

    Andrew
