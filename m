From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v8 17/34] [media] add Omnivision OV5640 sensor driver
Date: Sun, 11 Jun 2017 00:55:33 +0300
Message-ID: <20170610215532.GU1019@valkosipuli.retiisi.org.uk>
References: <1496860453-6282-1-git-send-email-steve_longerbeam@mentor.com>
 <1496860453-6282-18-git-send-email-steve_longerbeam@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1496860453-6282-18-git-send-email-steve_longerbeam@mentor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Steve Longerbeam <slongerbeam@gmail.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, kernel@pengutronix.de, fabio.estevam@nxp.com, linux@armlinux.org.uk, mchehab@kernel.org, hverkuil@xs4all.nl, nick@shmanahar.org, markus.heiser@darmarIT.de, p.zabel@pengutronix.de, laurent.pinchart+renesas@ideasonboard.com, bparrot@ti.com, geert@linux-m68k.org, arnd@arndb.de, sudipm.mukherjee@gmail.com, minghsiu.tsai@mediatek.com, tiffany.lin@mediatek.com, jean-christophe.trotin@st.com, horms+renesas@verge.net.au, niklas.soderlund+renesas@ragnatech.se, robert.jarzmik@free.fr, songjun.wu@microchip.com, andrew-ct.chen@mediatek.com, gregkh@linuxfoundation.org, shuah@kernel.org, sakari.ailus@linux.intel.com, pavel@ucw.cz, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-me
List-Id: devicetree@vger.kernel.org

Hi Steve,

On Wed, Jun 07, 2017 at 11:33:56AM -0700, Steve Longerbeam wrote:
...
> +/*
> + * FIXME: remove this when a subdev API becomes available
> + * to set the MIPI CSI-2 virtual channel.
> + */
> +static unsigned int virtual_channel;
> +module_param(virtual_channel, int, 0);
> +MODULE_PARM_DESC(virtual_channel,
> +		 "MIPI CSI-2 virtual channel (0..3), default 0");

If this works for you it's a good workaround. I hope we can address the
matter properly soon --- it's related to data types, embedded data etc.

For the patch:

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Regards,

Sakari Ailus
e-mail: sakari.ailus@iki.fi	XMPP: sailus@retiisi.org.uk
