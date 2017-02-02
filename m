From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCH v3 00/24] i.MX Media Driver
Date: Thu, 2 Feb 2017 22:29:25 +0000
Message-ID: <20170202222925.GW27312@n2100.armlinux.org.uk>
References: <1483755102-24785-1-git-send-email-steve_longerbeam@mentor.com>
 <20170202172245.GT27312@n2100.armlinux.org.uk>
 <20170202175600.GU27312@n2100.armlinux.org.uk>
 <4815b9c8-782a-ac67-d296-c4acb296d849@gmail.com>
 <20170202185826.GV27312@n2100.armlinux.org.uk>
 <2e1cf096-ecb8-ba3d-a554-f4cc6999ed4e@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <2e1cf096-ecb8-ba3d-a554-f4cc6999ed4e@gmail.com>
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
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, nick@shmanahar.org, songjun.wu@microchip.com, hverkuil@xs4all.nl, robert.jarzmik@free.fr, devel@driverdev.osuosl.org, markus.heiser@darmarIT.de, Steve Longerbeam <steve_longerbeam@mentor.com>, geert@linux-m68k.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, p.zabel@pengutronix.de, arnd@arndb.de, mchehab@kernel.org, bparrot@ti.com, robh+dt@kernel.org, horms+renesas@verge.net.au, tiffany.lin@mediatek.com, laurent.pinchart+renesas@ideasonboard.com, linux-arm-kernel@lists.infradead.org, niklas.soderlund+renesas@ragnatech.se, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, jean-christophe.trotin@st.com, kernel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.org, sudipm.mukherjee@gmail.com
List-Id: devicetree@vger.kernel.org

On Thu, Feb 02, 2017 at 11:12:41AM -0800, Steve Longerbeam wrote:
> Here is the current .queue_setup() op in imx-media-capture.c:
> 
> static int capture_queue_setup(struct vb2_queue *vq,
>                                unsigned int *nbuffers,
>                                unsigned int *nplanes,
>                                unsigned int sizes[],
>                                struct device *alloc_devs[])
> {
>         struct capture_priv *priv = vb2_get_drv_priv(vq);
>         struct v4l2_pix_format *pix = &priv->vdev.fmt.fmt.pix;
>         unsigned int count = *nbuffers;
> 
>         if (vq->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
>                 return -EINVAL;
> 
>         if (*nplanes) {
>                 if (*nplanes != 1 || sizes[0] < pix->sizeimage)
>                         return -EINVAL;
>                 count += vq->num_buffers;
>         }
> 
>         while (pix->sizeimage * count > VID_MEM_LIMIT)
>                 count--;

That's a weird way of writing:

	unsigned int max_num = VID_MEM_LIMIT / pix->sizeimage;
	count = max(count, max_num);

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
