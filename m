From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v4 0/2] media: v4l: Add support for the Cadence MIPI-CSI2 TX controller
Date: Thu, 15 Feb 2018 14:31:55 +0100
Message-ID: <20180215133157.8043-1-maxime.ripard@bootlin.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Sproul <sproul-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Alan Douglas <adouglas-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Steve Creaney <screaney-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Boris Brezillon <boris.brezillon-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>, nm-l0cyMroinI0@public.gmane.org, Simon Hatliff <hatliff-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

Here is an attempt at supporting the MIPI-CSI2 TX block from Cadence.

This IP block is able to receive 4 video streams and stream them over
a MIPI-CSI2 link using up to 4 lanes. Those streams are basically the
interfaces to controllers generating some video signals, like a camera
or a pattern generator.

It is able to map input streams to CSI2 virtual channels and datatypes
dynamically. The streaming devices choose their virtual channels
through an additional signal that is transparent to the CSI2-TX. The
datatypes however are yet another additional input signal, and can be
mapped to any CSI2 datatypes.

Since v4l2 doesn't really allow for that setup at the moment, this
preliminary version is a rather dumb one in order to start the
discussion on how to address this properly.

Let me know what you think!
Maxime

Changes from v3:
  - Added a comment about entity links walk concurrency
  - Changed the default resolution to 1280x720
  - Changed usleep_range calls to udelay
  - Reworked the reference counting mechanism to remove a race
    condition by adding a mutex instead of an atomic count
  - Changed the entity function to MEDIA_ENT_F_VID_IF_BRIDGE
  - Changed the name of the reg variable in _get_resources to dev_cfg
  - Removed the redundant error message in the devm_ioremap_resource
    error path
  - Moved the subdev s_stream call before enabling the TX bridge
  - Changed some int types to unsigned
  - Init'd the pad formats properly
  - Fixed typo in the CSI2TX_LANES_MAX define name
  - Added Sakari Acked-by

Changes from v2:
  - Use SPDX license header
  - Use the lane mapping from DT

Changes from v1:
  - Add a subdev notifier and start our downstream subdevice in
    s_stream  
  - Based the decision to enable the stream or not on the link state
    instead of whether a format was being set on the pad
  - Put the controller back in reset when stopping the pipeline
  - Clarified the enpoints number in the DT binding
  - Added a default format for the pads
  - Added some missing const
  - Added more explicit comments
  - Rebased on 4.15

Maxime Ripard (2):
  dt-bindings: media: Add Cadence MIPI-CSI2 TX Device Tree bindings
  v4l: cadence: Add Cadence MIPI-CSI2 TX driver

 .../devicetree/bindings/media/cdns,csi2tx.txt      |  98 ++++
 drivers/media/platform/cadence/Kconfig             |  11 +
 drivers/media/platform/cadence/Makefile            |   1 +
 drivers/media/platform/cadence/cdns-csi2tx.c       | 602 +++++++++++++++++++++
 4 files changed, 712 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/cdns,csi2tx.txt
 create mode 100644 drivers/media/platform/cadence/cdns-csi2tx.c

-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
