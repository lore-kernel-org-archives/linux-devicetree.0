Return-Path: <robherring2@gmail.com>
Date: Tue, 27 Aug 2019 13:33:27 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v9 01/13] dt-bindings: connector: analog: add sdtv
 standards property
Message-ID: <20190827183327.GA24030@bogus>
References: <20190822080556.17109-1-m.felsch@pengutronix.de>
 <20190822080556.17109-2-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190822080556.17109-2-m.felsch@pengutronix.de>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com, hans.verkuil@cisco.com, jacopo+renesas@jmondi.org, robh+dt@kernel.org, laurent.pinchart@ideasonboard.com, devicetree@vger.kernel.org, kernel@pengutronix.de, linux-media@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Thu, 22 Aug 2019 10:05:44 +0200, Marco Felsch wrote:
> Some connectors no matter if in- or output supports only a limited
> range of sdtv standards. It doesn't matter if the hardware behind that
> connector supports more than the listed formats since the users are
> restriced by a label e.g. to plug only a camera into this connector
> which uses the PAL format.
> 
> This patch adds the capability to describe such limitation within the
> firmware. There are no format restrictions if the property isn't
> present, so it's completely backward compatible.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
> [1] https://patchwork.kernel.org/cover/10794703/
> 
> v8:
> Hi Rob,
> 
> I dropped your r b tag becuase of the changes I made in this version.
> Please can you have look on it again? Luckily this would be the last
> time ;-)
> 
> - move definition to include/dt-bindings/display
> - rename tvnorms.h to sdtv-standards.h
> - TVORMS_* -> SDTV_STD_*
> - add sync comments
> - adapt commit message
> - fix bindings documentation
> 
> v7:
> I kept Robs r b tag because I only changed the example and extended
> TVNORM_* macros.
> 
> - fix some style issues
> - add TVNORM_NTSC, TVNORM_525_60 and TVNORM_625_50
> 
> v6:
> - tvnorms.h: use tabs instead of spaces
> - tvnorms.h: add TVNORM_PAL and TVNORM_SECAM
> - tvnorms.h: drop rarely used TVNORM_ATSC_* norms
> 
> v2-v4:
> - nothing since the patch was squashed from series [1] into this
>   series.
> ---
>  .../display/connector/analog-tv-connector.txt |  6 ++
>  include/dt-bindings/display/sdtv-standards.h  | 76 +++++++++++++++++++
>  include/uapi/linux/videodev2.h                |  4 +
>  3 files changed, 86 insertions(+)
>  create mode 100644 include/dt-bindings/display/sdtv-standards.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
