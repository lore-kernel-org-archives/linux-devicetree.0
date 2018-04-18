From: Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH v2 5/6] drm/atmel-hlcdc: add support for connecting to
 tda998x HDMI encoder
Date: Wed, 18 Apr 2018 10:02:12 +0200
Message-ID: <0155b3cc-29ce-fa43-5588-b465c6ee064a@axentia.se>
References: <20180417131052.16336-1-peda@axentia.se>
 <20180417131052.16336-6-peda@axentia.se> <20180418093649.2c304f29@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180418093649.2c304f29@bbrezillon>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Daniel Vetter <daniel.vetter@intel.com>, Gustavo Padovan <gustavo@padovan.org>, Sean Paul <seanpaul@chromium.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 2018-04-18 09:36, Boris Brezillon wrote:
> On Tue, 17 Apr 2018 15:10:51 +0200
> Peter Rosin <peda@axentia.se> wrote:
> 
>> When the of-graph points to a tda998x-compatible HDMI encoder, register
>> as a component master and bind to the encoder/connector provided by
>> the tda998x driver.
> 
> Can't we do the opposite: make the tda998x driver expose its devices as
> drm bridges. I'd rather not add another way to connect external
> encoders (or bridges) to display controller drivers, especially since,
> when I asked DRM maintainers/devs what was the good approach to
> represent such external encoders they pointed me to the drm_bridge
> interface.

>From the cover letter:

"However, I don't know if the tilcdc driver is interfacing with the
tda998x driver in a sane and modern way"

So, which way is the future? Should bridges become components or should
existing bridge-like components no longer be components? Are there others?

Cheers,
Peter
