From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 4/4] [media] dt-bindings: add TI VPIF documentation
Date: Mon, 21 Nov 2016 15:15:07 +0100
Message-ID: <165090919.oFnaNnsijv@wuerfel>
References: <20161119003208.10550-1-khilman@baylibre.com> <20161119003208.10550-4-khilman@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <20161119003208.10550-4-khilman@baylibre.com>
Sender: linux-media-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, devicetree@vger.kernel.org, Sekhar Nori <nsekhar@ti.com>, Axel Haslam <ahaslam@baylibre.com>, Bartosz =?utf-8?B?R2/FgmFzemV3c2tp?= <bgolaszewski@baylibre.com>, Alexandre Bailon <abailon@baylibre.com>, David Lechner <david@lechnology.com>, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

On Friday, November 18, 2016 4:32:08 PM CET Kevin Hilman wrote:
> +
> +Required properties:
> +- compatible: must be "ti,vpif-capture"
> +- reg: physical base address and length of the registers set for the device;
> +- interrupts: should contain IRQ line for the VPIF
> +
> 

Shouldn't this have a SoC specific identifier or a version number
in the compatible string? "vpif" seems rather generic, so it's
likely that TI made more than one variant of it.

	Arnd
