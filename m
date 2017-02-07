From: Steve Longerbeam <slongerbeam@gmail.com>
Subject: Re: [PATCH v3 16/24] media: Add i.MX media core driver
Date: Mon, 6 Feb 2017 17:54:31 -0800
Message-ID: <681b06c9-48b9-7336-ae89-c8816fe8033a@gmail.com>
References: <1483755102-24785-1-git-send-email-steve_longerbeam@mentor.com>
 <1483755102-24785-17-git-send-email-steve_longerbeam@mentor.com>
 <20170202225004.GZ27312@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20170202225004.GZ27312@n2100.armlinux.org.uk>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: mark.rutland@arm.com, andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com, nick@shmanahar.org, songjun.wu@microchip.com, hverkuil@xs4all.nl, Steve Longerbeam <steve_longerbeam@mentor.com>, robert.jarzmik@free.fr, devel@driverdev.osuosl.org, markus.heiser@darmarIT.de, laurent.pinchart+renesas@ideasonboard.com, geert@linux-m68k.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, arnd@arndb.de, mchehab@kernel.org, bparrot@ti.com, robh+dt@kernel.org, horms+renesas@verge.net.au, tiffany.lin@mediatek.com, linux-arm-kernel@lists.infradead.org, niklas.soderlund+renesas@ragnatech.se, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, jean-christophe.trotin@st.com, p.zabel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.org, sudipm.mukherjee@gmail.com
List-Id: devicetree@vger.kernel.org



On 02/02/2017 02:50 PM, Russell King - ARM Linux wrote:
> On Fri, Jan 06, 2017 at 06:11:34PM -0800, Steve Longerbeam wrote:
>> +/* register an internal subdev as a platform device */
>> +static struct imx_media_subdev *
>> +add_internal_subdev(struct imx_media_dev *imxmd,
>> +		    const struct internal_subdev *isd,
>> +		    int ipu_id)
>> +{
>> +	struct imx_media_internal_sd_platformdata pdata;
>> +	struct platform_device_info pdevinfo = {0};
>> +	struct imx_media_subdev *imxsd;
>> +	struct platform_device *pdev;
>> +
>> +	switch (isd->id->grp_id) {
>> +	case IMX_MEDIA_GRP_ID_CAMIF0...IMX_MEDIA_GRP_ID_CAMIF1:
>> +		pdata.grp_id = isd->id->grp_id +
>> +			((2 * ipu_id) << IMX_MEDIA_GRP_ID_CAMIF_BIT);
>> +		break;
>> +	default:
>> +		pdata.grp_id = isd->id->grp_id;
>> +		break;
>> +	}
>> +
>> +	/* the id of IPU this subdev will control */
>> +	pdata.ipu_id = ipu_id;
>> +
>> +	/* create subdev name */
>> +	imx_media_grp_id_to_sd_name(pdata.sd_name, sizeof(pdata.sd_name),
>> +				    pdata.grp_id, ipu_id);
>> +
>> +	pdevinfo.name = isd->id->name;
>> +	pdevinfo.id = ipu_id * num_isd + isd->id->index;
>> +	pdevinfo.parent = imxmd->dev;
>> +	pdevinfo.data = &pdata;
>> +	pdevinfo.size_data = sizeof(pdata);
>> +	pdevinfo.dma_mask = DMA_BIT_MASK(32);
>> +
>> +	pdev = platform_device_register_full(&pdevinfo);
>> +	if (IS_ERR(pdev))
>> +		return ERR_CAST(pdev);
>> +
>> +	imxsd = imx_media_add_async_subdev(imxmd, NULL, dev_name(&pdev->dev));
>> +	if (IS_ERR(imxsd))
>> +		return imxsd;
>> +
>> +	imxsd->num_sink_pads = isd->num_sink_pads;
>> +	imxsd->num_src_pads = isd->num_src_pads;
>> +
>> +	return imxsd;
>> +}
> You seem to create platform devices here, but I see nowhere that you
> ever remove them - so if you get to the lucky point of being able to
> rmmod imx-media and then try to re-insert it, you end up with a load
> of kernel warnings, one for each device created this way, and
> platform_device_register_full() fails:

Right, I never free the platform devices for the internal subdevs.
Fixed.

Steve
