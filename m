From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v3 1/2] dt-bindings: media: Add Cadence MIPI-CSI2 TX
 Device Tree bindings
Date: Thu, 8 Feb 2018 11:07:24 +0200
Message-ID: <20180208090724.fjwbwoleahrtb7rn@valkosipuli.retiisi.org.uk>
References: <20180207142643.15746-1-maxime.ripard@bootlin.com>
 <20180207142643.15746-2-maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-media-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180207142643.15746-2-maxime.ripard@bootlin.com>
Sender: linux-media-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, Richard Sproul <sproul@cadence.com>, Alan Douglas <adouglas@cadence.com>, Steve Creaney <screaney@cadence.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Boris Brezillon <boris.brezillon@bootlin.com>, Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>, Hans Verkuil <hans.verkuil@cisco.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Benoit Parrot <bparrot@ti.com>, nm@ti.com, Simon Hatliff <hatliff@cadence.com>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 07, 2018 at 03:26:42PM +0100, Maxime Ripard wrote:
> The Cadence MIPI-CSI2 TX controller is a CSI2 bridge that supports up to 4
> video streams and can output on up to 4 CSI-2 lanes, depending on the
> hardware implementation.
> 
> It can operate with an external D-PHY, an internal one or no D-PHY at all
> in some configurations.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
e-mail: sakari.ailus@iki.fi
