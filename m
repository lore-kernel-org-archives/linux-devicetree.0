From: Torsten Duwe <duwe@lst.de>
Subject: device tree binding for poly-phased regulators
Date: Fri, 22 Feb 2019 12:21:51 +0100
Message-ID: <20190222112151.GA23266@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Carlo Caione <carlo@caione.org>, Olliver Schinagl <oliver@schinagl.nl>, Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jagan Teki <jagan@amarulasolutions.com>, Icenowy Zheng <icenowy@aosc.io>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi!

Documentation/devicetree/bindings/mfd/axp20x.txt nicely describes the
capabilities of the X-powers PMICs; however, it seems polyphasing is
left to comments only.

May I suggest to add a property "poly-phased", just to get the discussion
started? It could be a simple property in the current case for the axp803
and axp806 ("poly-phased with you-know-which") or a phandle in the future.

BTW the axp803 datasheet is quite terse in that respect: is there one
"master" reulator whose settings are copied or does a driver have to keep
them in sync.

Anyway, comments welcome!

	Torsten
