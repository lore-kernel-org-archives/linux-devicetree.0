Return-Path: <SRS0=TnzJ=WM=xs4all.nl=hverkuil@kernel.org>
Subject: Re: [PATCH v7 01/13] dt-bindings: connector: analog: add tv norms
 property
References: <20190815115747.24018-1-m.felsch@pengutronix.de>
 <20190815115747.24018-2-m.felsch@pengutronix.de>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <76aeaa4e-4a29-5abe-1af6-fc82958e9530@xs4all.nl>
Date: Fri, 16 Aug 2019 13:11:45 +0200
MIME-Version: 1.0
In-Reply-To: <20190815115747.24018-2-m.felsch@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Marco Felsch <m.felsch@pengutronix.de>, mchehab@kernel.org, sakari.ailus@linux.intel.com, hans.verkuil@cisco.com, jacopo+renesas@jmondi.org, robh+dt@kernel.org, laurent.pinchart@ideasonboard.com
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, Rob Herring <robh@kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 8/15/19 1:57 PM, Marco Felsch wrote:
> Some connectors no matter if in- or output supports only a limited
> range of tv norms. It doesn't matter if the hardware behind that
> connector supports more than the listed formats since the users are
> restriced by a label e.g. to plug only a camera into this connector
> which uses the PAL format.
> 
> This patch adds the capability to describe such limitation within the
> firmware. There are no format restrictions if the property isn't
> present, so it's completely backward compatible.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> [1] https://patchwork.kernel.org/cover/10794703/
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
>  .../display/connector/analog-tv-connector.txt |  4 ++
>  include/dt-bindings/media/tvnorms.h           | 72 +++++++++++++++++++
>  2 files changed, 76 insertions(+)
>  create mode 100644 include/dt-bindings/media/tvnorms.h
> 
> diff --git a/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt b/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
> index 0c0970c210ab..434e8aa0398b 100644
> --- a/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
> +++ b/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
> @@ -6,6 +6,9 @@ Required properties:
>  
>  Optional properties:
>  - label: a symbolic name for the connector
> +- tvnorms: limit the supported tv norms on a connector to the given ones else

tv -> TV

> +           all tv norms are allowed. Possible video standards are defined in

tv -> TV

And a more high-level question: I think tvnorm is a very vague name. It's a term
used in media, but what does 'norm' mean anyway? 'tv_standards' or 'video_standards'
would be a lot more descriptive.

'tvnorm' is, I think, a term used only internally in the media subsystem for no
clear reason. In the V4L2 spec it talks about 'video standard'.

Sorry for being so late with raising this issue.

> +           include/dt-bindings/media/tvnorms.h.
>  
>  Required nodes:
>  - Video port for TV input
> @@ -16,6 +19,7 @@ Example
>  tv: connector {
>  	compatible = "composite-video-connector";
>  	label = "tv";
> +	tvnorms = <(TVNORM_PAL | TVNORM_NTSC)>;
>  
>  	port {
>  		tv_connector_in: endpoint {
> diff --git a/include/dt-bindings/media/tvnorms.h b/include/dt-bindings/media/tvnorms.h
> new file mode 100644
> index 000000000000..e1275673c4d6
> --- /dev/null
> +++ b/include/dt-bindings/media/tvnorms.h
> @@ -0,0 +1,72 @@
> +/* SPDX-License-Identifier: GPL-2.0-only or X11 */
> +/*
> + * Copyright 2019 Pengutronix, Marco Felsch <kernel@pengutronix.de>
> + */
> +
> +#ifndef _DT_BINDINGS_MEDIA_TVNORMS_H
> +#define _DT_BINDINGS_MEDIA_TVNORMS_H
> +
> +/* One bit for each standard */

I would add a comment here and in videodev2.h where you mention that
the two headers should remain in sync.

> +#define TVNORM_PAL_B		0x00000001
> +#define TVNORM_PAL_B1		0x00000002
> +#define TVNORM_PAL_G		0x00000004
> +#define TVNORM_PAL_H		0x00000008
> +#define TVNORM_PAL_I		0x00000010
> +#define TVNORM_PAL_D		0x00000020
> +#define TVNORM_PAL_D1		0x00000040
> +#define TVNORM_PAL_K		0x00000080
> +
> +#define TVNORM_PAL		(TVNORM_PAL_B		| \
> +				 TVNORM_PAL_B1		| \
> +				 TVNORM_PAL_G		| \
> +				 TVNORM_PAL_H		| \
> +				 TVNORM_PAL_I		| \
> +				 TVNORM_PAL_D		| \
> +				 TVNORM_PAL_D1		| \
> +				 TVNORM_PAL_K)
> +
> +#define TVNORM_PAL_M		0x00000100
> +#define TVNORM_PAL_N		0x00000200
> +#define TVNORM_PAL_Nc		0x00000400
> +#define TVNORM_PAL_60		0x00000800
> +
> +#define TVNORM_NTSC_M		0x00001000	/* BTSC */
> +#define TVNORM_NTSC_M_JP	0x00002000	/* EIA-J */
> +#define TVNORM_NTSC_443		0x00004000
> +#define TVNORM_NTSC_M_KR	0x00008000	/* FM A2 */
> +
> +#define TVNORM_NTSC		(TVNORM_NTSC_M		|\
> +				 TVNORM_NTSC_M_JP	|\

Add space before \

> +				 TVNORM_NTSC_M_KR)
> +
> +#define TVNORM_SECAM_B		0x00010000
> +#define TVNORM_SECAM_D		0x00020000
> +#define TVNORM_SECAM_G		0x00040000
> +#define TVNORM_SECAM_H		0x00080000
> +#define TVNORM_SECAM_K		0x00100000
> +#define TVNORM_SECAM_K1		0x00200000
> +#define TVNORM_SECAM_L		0x00400000
> +#define TVNORM_SECAM_LC		0x00800000
> +
> +#define TVNORM_SECAM		(TVNORM_SECAM_B		| \
> +				 TVNORM_SECAM_D		| \
> +				 TVNORM_SECAM_G		| \
> +				 TVNORM_SECAM_H		| \
> +				 TVNORM_SECAM_K		| \
> +				 TVNORM_SECAM_K1	| \
> +				 TVNORM_SECAM_L		| \
> +				 TVNORM_SECAM_LC)
> +
> +/* Standards for Countries with 60Hz Line frequency */
> +#define TVNORM_525_60		(TVNORM_PAL_M		| \
> +				 TVNORM_PAL_60		| \
> +				 TVNORM_NTSC		| \
> +				 TVNORM_NTSC_443)
> +
> +/* Standards for Countries with 50Hz Line frequency */
> +#define TVNORM_625_50		(TVNORM_PAL		|\
> +				 TVNORM_PAL_N		|\
> +				 TVNORM_PAL_Nc		|\

Add space before \

> +				 TVNORM_SECAM)
> +
> +#endif /* _DT_BINDINGS_MEDIA_TVNORMS_H */
> 

I was also wondering if this header shouldn't be in include/dt-bindings/display/
since the bindings are also described in 'display'.

Regards,

	Hans
