From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v2 07/10] media: platform: Add Sunxi-Cedrus VPU decoder
 driver
Date: Tue, 24 Apr 2018 12:13:28 +0300
Message-ID: <20180424091328.jsqp36nxekuj23am@paasikivi.fi.intel.com>
References: <20180419154124.17512-1-paul.kocialkowski@bootlin.com>
 <20180419154536.17846-3-paul.kocialkowski@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180419154536.17846-3-paul.kocialkowski@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Pawel Osciak <pawel@osciak.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Hans Verkuil <hans.verkuil@cisco.com>, Philipp Zabel <p.zabel@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>, Alexandre Courbot <acourbot@chromium.org>, Tomasz Figa <tfiga@chromium.org>
List-Id: devicetree@vger.kernel.org

Hi Paul

On Thu, Apr 19, 2018 at 05:45:33PM +0200, Paul Kocialkowski wrote:
> This introduces the Sunxi-Cedrus VPU driver that supports the VPU found
> in Allwinner SoCs, also known as Video Engine. It is implemented through
> a v4l2 m2m decoder device and a media device (used for media requests).
> So far, it only supports MPEG2 decoding.
> 
> Since this VPU is stateless, synchronization with media requests is
> required in order to ensure consistency between frame headers that
> contain metadata about the frame to process and the raw slice data that
> is used to generate the frame.
> 
> This driver was made possible thanks to the long-standing effort
> carried out by the linux-sunxi community in the interest of reverse
> engineering, documenting and implementing support for Allwinner VPU.

No code review yet, but DT bindings precede the driver. Please also add
the appropriate MAINTAINERS entries.

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
