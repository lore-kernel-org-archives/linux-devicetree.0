From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH] ARM: dts: add description of Netgear RN NV+v2 LCD
Date: Fri, 8 Feb 2019 14:56:50 +0100
Message-ID: <20190208135650.GD26594@lunn.ch>
References: <20190208045305.8759-1-coles.david@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190208045305.8759-1-coles.david@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Coles <coles.david@gmail.com>
Cc: devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 07, 2019 at 08:53:05PM -0800, David Coles wrote:
> GPIO pin mapping taken from NetGear NV+ v2 5.3.13 kernel sources[1]
> (see arch/arm/plat-feroceon/mv_hal/rtc/ext_rtc/usiLCD.c).

Kirkwood! It has been a while since we had a kirkwood patch. Some NAS
boxes seem to never die. Nice to see somebody still hacking on them.

> Signed-off-by: David Coles <coles.david@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
