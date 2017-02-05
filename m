From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 12/24] add mux and video interface bridge entity
 functions
Date: Sun, 05 Feb 2017 17:36:59 +0200
Message-ID: <6948005.DnfziI9GIJ@avalon>
References: <1483755102-24785-1-git-send-email-steve_longerbeam@mentor.com>
 <1483755102-24785-13-git-send-email-steve_longerbeam@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1483755102-24785-13-git-send-email-steve_longerbeam@mentor.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Steve Longerbeam <slongerbeam@gmail.com>
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, nick@shmanahar.org, songjun.wu@microchip.com, hverkuil@xs4all.nl, robert.jarzmik@free.fr, devel@driverdev.osuosl.org, markus.heiser@darmarit.de, laurent.pinchart+renesas@ideasonboard.com, linux@armlinux.org.uk, geert@linux-m68k.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, arnd@arndb.de, mchehab@kernel.org, bparrot@ti.com, robh+dt@kernel.org, horms+renesas@verge.net.au, tiffany.lin@mediatek.com, linux-arm-kernel@lists.infradead.org, niklas.soderlund+renesas@ragnatech.se, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, jean-christophe.trotin@st.com, p.zabel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.org, sudipm.mukherjee@gmail.com
List-Id: devicetree@vger.kernel.org

Hi Steve,

Thank you for the patch

On Friday 06 Jan 2017 18:11:30 Steve Longerbeam wrote:
> From: Philipp Zabel <p.zabel@pengutronix.de>
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  Documentation/media/uapi/mediactl/media-types.rst | 22 ++++++++++++++++++++
>  include/uapi/linux/media.h                        |  6 ++++++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/Documentation/media/uapi/mediactl/media-types.rst
> b/Documentation/media/uapi/mediactl/media-types.rst index 3e03dc2..023be29
> 100644
> --- a/Documentation/media/uapi/mediactl/media-types.rst
> +++ b/Documentation/media/uapi/mediactl/media-types.rst
> @@ -298,6 +298,28 @@ Types and flags used to represent the media graph
> elements received on its sink pad and outputs the statistics data on
>  	  its source pad.
> 
> +    -  ..  row 29
> +
> +       ..  _MEDIA-ENT-F-MUX:
> +
> +       -  ``MEDIA_ENT_F_MUX``
> +
> +       - Video multiplexer. An entity capable of multiplexing must have at
> +         least two sink pads and one source pad, and must pass the video
> +         frame(s) received from the active sink pad to the source pad.
> Video
> +         frame(s) from the inactive sink pads are discarded.

Apart from the comment made by Hans regarding the macro name, this looks good 
to me.

> +    -  ..  row 30
> +
> +       ..  _MEDIA-ENT-F-VID-IF-BRIDGE:
> +
> +       -  ``MEDIA_ENT_F_VID_IF_BRIDGE``
> +
> +       - Video interface bridge. A video interface bridge entity must have
> at
> +         least one sink pad and one source pad. It receives video frame(s)
> on
> +         its sink pad in one bus format (HDMI, eDP, MIPI CSI-2, ...) and
> +         converts them and outputs them on its source pad in another bus
> format
> +         (eDP, MIPI CSI-2, parallel, ...).


The first sentence mentions *at least* one sink pad and one source pad, and 
the second one refers to "its sink pad" and "its source pad". This is a bit 
confusing. An easy option would be to require a single sink and a single 
source pad, but that would exclude bridges that combine a multiplexer.

I also wonder whether "bridge" is the appropriate word here. Transceiver might 
be a better choice, to insist on the fact that one of the two pads corresponds 
to a physical interface that has special electrical properties (such as HDMI, 
eDP, or CSI-2 that all require PHYs).

>  ..  tabularcolumns:: |p{5.5cm}|p{12.0cm}|
> 
> diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
> index 4890787..08a8bfa 100644
> --- a/include/uapi/linux/media.h
> +++ b/include/uapi/linux/media.h
> @@ -105,6 +105,12 @@ struct media_device_info {
>  #define MEDIA_ENT_F_PROC_VIDEO_STATISTICS	(MEDIA_ENT_F_BASE + 0x4006)
> 
>  /*
> + * Switch and bridge entitites
> + */
> +#define MEDIA_ENT_F_MUX				(MEDIA_ENT_F_BASE + 
0x5001)
> +#define MEDIA_ENT_F_VID_IF_BRIDGE		(MEDIA_ENT_F_BASE + 0x5002)
> +
> +/*
>   * Connectors
>   */
>  /* It is a responsibility of the entity drivers to add connectors and links
> */

-- 
Regards,

Laurent Pinchart
