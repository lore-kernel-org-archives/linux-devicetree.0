From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 1/2] drm: bridge: sil902x
Date: Wed, 6 Jan 2016 14:47:36 +0100
Message-ID: <20160106134736.GR13058@pengutronix.de>
References: <1452079551-30914-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1452079551-30914-1-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Nicolas Ferre <nicolas.ferre@atmel.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Kumar Gala <galak@codeaurora.org>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>
List-Id: devicetree@vger.kernel.org

Hi Boris,

On Wed, Jan 06, 2016 at 12:25:50PM +0100, Boris Brezillon wrote:
> Add basic support for the sil902x RGB -> HDMI bridge.
> This driver does not support audio output yet.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
> Hello,
> 
> This patch is only adding basic support for the sil9022 chip.

This thing is a SiI9022 for camel case "Silicon Image" with a capital 'I',
not a small 'l'.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
