From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH 2/3] ARM: bus: da8xx-syscfg: new driver
Date: Fri, 21 Oct 2016 15:23:39 +0530
Message-ID: <278cac52-020f-da2f-54d7-e68d3b71eb65@ti.com>
References: <1476721850-454-1-git-send-email-bgolaszewski@baylibre.com>
 <2278105.geKhb8xoNC@avalon> <7h8ttj6jqo.fsf@baylibre.com>
 <1867292.F3aGJTmS2t@avalon> <7h8tti6c95.fsf@baylibre.com>
 <f6a0f61e-9d78-3df1-8e41-435eb47a1f00@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f6a0f61e-9d78-3df1-8e41-435eb47a1f00@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, Kevin Hilman <khilman@baylibre.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Russell King <linux@armlinux.org.uk>, LKML <linux-kernel@vger.kernel.org>, arm-soc <linux-arm-kernel@lists.infradead.org>, linux-drm <dri-devel@lists.freedesktop.org>, linux-devicetree <devicetree@vger.kernel.org>, Jyri Sarha <jsarha@ti.com>, David Airlie <airlied@linux.ie>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
List-Id: devicetree@vger.kernel.org

On Friday 21 October 2016 02:55 PM, Tomi Valkeinen wrote:
> On 20/10/16 22:39, Kevin Hilman wrote:
> 
>> However, after our discussion on IRC, we'll respin this without the DT
>> bindings at all.  Next version will just use static configuration data
>> in the drivers/bus driver based on SoC compatible string, since for the
>> use-cases I'm aware of, the settings are boot-time only.
> 
> If it's static boot time config, why not do it in the u-boot?

Hardware initialization dependencies with boot-loader are tough to track
and debug. The bootloader thats currently ships with the board may not
have these settings, for example. This forces everyone to update their
bootloader when shifting to mainline kernel.

Thanks,
Sekhar
