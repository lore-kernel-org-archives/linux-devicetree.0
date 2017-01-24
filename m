From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH v3 13/24] platform: add video-multiplexer subdevice driver
Date: Tue, 24 Jan 2017 09:44:12 -0300
Message-ID: <CABxcv=n1z7OwOctm_qmT8oBWSGK4tyvKBY6fWUOSZHfW1x=QUQ@mail.gmail.com>
References: <1483755102-24785-1-git-send-email-steve_longerbeam@mentor.com> <1483755102-24785-14-git-send-email-steve_longerbeam@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1483755102-24785-14-git-send-email-steve_longerbeam@mentor.com>
Sender: linux-media-owner@vger.kernel.org
To: Steve Longerbeam <slongerbeam@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Russell King <linux@armlinux.org.uk>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, nick@shmanahar.org, Markus Heiser <markus.heiser@darmarit.de>, Philipp Zabel <p.zabel@pengutronix.de>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Benoit Parrot <bparrot@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>, sudipm.mukherjee@gmail.com, minghsiu.tsai@mediatek.com, tiffany.lin@mediatek.com, Jean-Christophe Trotin <jean-christophe.trotin@st.com>, horms+renesas@verge.net.au, niklas.soderlund+renesas@ragnatec
List-Id: devicetree@vger.kernel.org

Hello Steve,

On Fri, Jan 6, 2017 at 11:11 PM, Steve Longerbeam <slongerbeam@gmail.com> wrote:
> From: Philipp Zabel <p.zabel@pengutronix.de>

[snip]

>
> +config VIDEO_MULTIPLEXER
> +       tristate "Video Multiplexer"
> +       depends on VIDEO_V4L2_SUBDEV_API && MEDIA_CONTROLLER

The driver can be build as a module...

> +
> +static const struct of_device_id vidsw_dt_ids[] = {
> +       { .compatible = "video-multiplexer", },
> +       { /* sentinel */ }
> +};
> +

... so you need a MODULE_DEVICE_TABLE(of, vidsw_dt_ids) here or
otherwise module autoloading won't work.

Best regards,
Javier
