From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 2/2] ARM: mvebu: Added dts defintion for Lenovo Iomega
 ix4-300d NAS
Date: Sun, 27 Jul 2014 03:52:44 +0200
Message-ID: <20140727015244.GA31974@lunn.ch>
References: <1406418436-61452-1-git-send-email-yahoo@perenite.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1406418436-61452-1-git-send-email-yahoo@perenite.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Benoit Masson <yahoo@perenite.com>
Cc: benoitm@perenite.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, jason@lakedaemon.net, andrew@lunn.ch, gregory.clement@free-electrons.com, sebastian.hesselbarth@googlemail.com
List-Id: devicetree@vger.kernel.org

Hi Benoit

> +			i2c@11000 {
> +				compatible = "marvell,mv78230-a0-i2c",
> +					"marvell,mv64xxx-i2c";

The point of my patches is that you don't need the
"marvell,mv78230-a0-i2c". It will work out at runtime if the SoC is A0
stepping and automatically enable the workaround. Please test with
only "marvell,mv64xxx-i2c";

     Andrew
