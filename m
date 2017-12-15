From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 20/25] arm: kirkwood: dts: Remove leading 0x and 0s from
 bindings notation
Date: Fri, 15 Dec 2017 14:03:22 +0100
Message-ID: <20171215130322.GG4213@lunn.ch>
References: <20171215124653.30902-1-malat@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171215124653.30902-1-malat@debian.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathieu Malaterre <malat@debian.org>
Cc: Rob Herring <robh+dt@kernel.org>, Jason Cooper <jason@lakedaemon.net>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

> Warning (unit_address_format): Node /XXX unit name should not have leading "0x"
> 
> and
> 
> Warning (unit_address_format): Node /XXX unit name should not have leading 0s

Humm, it actually looks like the compiler is broken. None of the lines
you are changing in this, or the orion5x file, have 0x or leading 0.

       Andrew
