From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
Subject: Re: [PATCH v2 0/8] Add Allwinner H6 Mali Midgard GPU
Date: Thu, 11 Apr 2019 17:01:03 +0200
Message-ID: <2219012.spPdo1bsEq@jernej-laptop>
References: <20190411105720.32357-1-peron.clem@gmail.com> <20190411123223.zyumngnlwhlvk6mf@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190411123223.zyumngnlwhlvk6mf@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: =?ISO-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>, Jagan Teki <jagan@amarulasolutions.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

Hi!

Dne četrtek, 11. april 2019 ob 14:32:23 CEST je Maxime Ripard napisal(a):
> On Thu, Apr 11, 2019 at 12:57:12PM +0200, Clément Péron wrote:
> > Hi,
> > 
> > The Allwinner H6 has a Mali-T720 MP2. The drivers are
> > out-of-tree so this series only introduce the dt-bindings.
> > 
> > The first patch is from Neil Amstrong and has been already
> > merged in linux-amlogic. It is required for this series.
> > 
> > The second patch is from Icenowy Zheng where I changed the
> > order has required by Rob Herring.
> > See: https://patchwork.kernel.org/patch/10699829/
> > 
> > The GPU opp table was taken from Jernej Škrabec's patch
> > on LibreELEC.tv.
> 
> One valuable information here would be which stack did you use,
> panfrost and mesa or the ARM stack? If so, with which driver and which
> blob?

I'm using similar binding (different clock and interrupt names, but otherwise  
same) for quiet some time now on LibreELEC with ARM proprietary userspace and 
kernel space driver (32-bit GBM version) and it works well.

It's true that I'm using OPP table, but most (if not all) of the time GPU is 
set to lowest setting as there is not much to do when rendering GUI.

Best regards,
Jernej
