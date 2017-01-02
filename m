From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v7 3/5] drm: bridge: add support for TI ths8135
Date: Mon, 2 Jan 2017 16:38:00 +0530
Message-ID: <0b47c27e-cda4-b5f6-ff3c-da74c40ed204@ti.com>
References: <1481623759-12786-1-git-send-email-bgolaszewski@baylibre.com>
 <1481623759-12786-4-git-send-email-bgolaszewski@baylibre.com>
 <dbb47a8f-07be-19d6-e77b-f5c06fd39c61@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <dbb47a8f-07be-19d6-e77b-f5c06fd39c61@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Archit Taneja <architt@codeaurora.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Jyri Sarha <jsarha@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, David Airlie <airlied@linux.ie>, Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Russell King <linux@armlinux.org.uk>, Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: LKML <linux-kernel@vger.kernel.org>, arm-soc <linux-arm-kernel@lists.infradead.org>, linux-drm <dri-devel@lists.freedesktop.org>, linux-devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Archit,

On Wednesday 14 December 2016 10:35 AM, Archit Taneja wrote:
> 
> 
> On 12/13/2016 03:39 PM, Bartosz Golaszewski wrote:
>> THS8135 is a configurable video DAC, but no configuration is actually
>> necessary to make it work.
>>
>> For now use the dumb-vga-dac driver to support it.
> 
> Queued to drm-misc-next

This patch and 2/5 are not in v4.10 kernel. Did you mean to queue them
to v4.10?

Thanks,
Sekhar
