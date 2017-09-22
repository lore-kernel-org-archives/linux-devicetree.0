From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH 1/2] dt-bindings: media: Add Cadence MIPI-CSI2 TX Device
 Tree bindings
Date: Fri, 22 Sep 2017 15:01:06 +0300
Message-ID: <20170922120106.mfxoh34anazqakvz@valkosipuli.retiisi.org.uk>
References: <20170922114703.30511-1-maxime.ripard@free-electrons.com>
 <20170922114703.30511-2-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-media-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170922114703.30511-2-maxime.ripard@free-electrons.com>
Sender: linux-media-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, Cyprian Wronka <cwronka@cadence.com>, Richard Sproul <sproul@cadence.com>, Alan Douglas <adouglas@cadence.com>, Steve Creaney <screaney@cadence.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>, Hans Verkuil <hans.verkuil@cisco.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Benoit Parrot <bparrot@ti.com>, nm@ti.com
List-Id: devicetree@vger.kernel.org

On Fri, Sep 22, 2017 at 01:47:02PM +0200, Maxime Ripard wrote:
> The Cadence MIPI-CSI2 RX controller is a CSI2 bridge that supports up to 4

Should this be TX?

I was just thinking what does this chip do, and saw both. RX it at least
less common. :-)

-- 
Sakari Ailus
e-mail: sakari.ailus@iki.fi
