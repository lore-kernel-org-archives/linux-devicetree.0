From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH 2/2] ARM: davinci_all_defconfig: enable the mstpri and
 ddrctl drivers
Date: Tue, 15 Nov 2016 15:42:23 +0530
Message-ID: <cbcc1774-3590-7fd7-1414-4560b7996891@ti.com>
References: <1479144724-14231-1-git-send-email-bgolaszewski@baylibre.com>
 <1479144724-14231-3-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1479144724-14231-3-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Russell King <linux@armlinux.org.uk>
Cc: LKML <linux-kernel@vger.kernel.org>, arm-soc <linux-arm-kernel@lists.infradead.org>, linux-drm <dri-devel@lists.freedesktop.org>, linux-devicetree <devicetree@vger.kernel.org>, Jyri Sarha <jsarha@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, David Airlie <airlied@linux.ie>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

On Monday 14 November 2016 11:02 PM, Bartosz Golaszewski wrote:
> With the da8xx memory controller and master peripheral priority
> drivers merged and corresponding device tree changes in place we can
> now enable appropriate options by default.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Applied to v4.10/defconfig

Thanks,
Sekhar
