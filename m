From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [PATCH v6 2/8] Documentation: of: Document graph bindings
Date: Fri, 07 Mar 2014 18:27:17 +0000
Message-ID: <20140307182717.67596C40B43@trevor.secretlab.ca>
References: <1394011242-16783-1-git-send-email-p.zabel@pengutronix.de> < 1394011242-16783-3-git-send-email-p.zabel@pengutronix.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1394011242-16783-3-git-send-email-p.zabel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <m.chehab@samsung.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Rob Herring <robh+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Wed,  5 Mar 2014 10:20:36 +0100, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> The device tree graph bindings as used by V4L2 and documented in
> Documentation/device-tree/bindings/media/video-interfaces.txt contain
> generic parts that are not media specific but could be useful for any
> subsystem with data flow between multiple devices. This document
> describes the generic bindings.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

See my comments on the previous version. My concerns are the handling of
the optional 'ports' node and the usage of reverse links.

g.
