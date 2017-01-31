From: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: Re: [PATCH v3 21/24] media: imx: Add MIPI CSI-2 Receiver subdev
 driver
Date: Tue, 31 Jan 2017 00:01:25 +0000
Message-ID: <20170131000125.GO27312@n2100.armlinux.org.uk>
References: <1483755102-24785-1-git-send-email-steve_longerbeam@mentor.com>
 <1483755102-24785-22-git-send-email-steve_longerbeam@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1483755102-24785-22-git-send-email-steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Steve Longerbeam <steve_longerbeam@m>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 06, 2017 at 06:11:39PM -0800, Steve Longerbeam wrote:
> +static void imxcsi2_enable(struct imxcsi2_dev *csi2, bool enable)
> +{
> +	if (enable) {
> +		imxcsi2_write(csi2, 0xffffffff, CSI2_PHY_SHUTDOWNZ);
> +		imxcsi2_write(csi2, 0xffffffff, CSI2_DPHY_RSTZ);
> +		imxcsi2_write(csi2, 0xffffffff, CSI2_RESETN);
> +	} else {
> +		imxcsi2_write(csi2, 0x0, CSI2_PHY_SHUTDOWNZ);
> +		imxcsi2_write(csi2, 0x0, CSI2_DPHY_RSTZ);
> +		imxcsi2_write(csi2, 0x0, CSI2_RESETN);
> +	}
> +}
> +
> +static void imxcsi2_reset(struct imxcsi2_dev *csi2)
> +{
> +	imxcsi2_enable(csi2, false);
> +
> +	imxcsi2_write(csi2, 0x00000001, CSI2_PHY_TST_CTRL0);
> +	imxcsi2_write(csi2, 0x00000000, CSI2_PHY_TST_CTRL1);
> +	imxcsi2_write(csi2, 0x00000000, CSI2_PHY_TST_CTRL0);
> +	imxcsi2_write(csi2, 0x00000002, CSI2_PHY_TST_CTRL0);
> +	imxcsi2_write(csi2, 0x00010044, CSI2_PHY_TST_CTRL1);
> +	imxcsi2_write(csi2, 0x00000000, CSI2_PHY_TST_CTRL0);
> +	imxcsi2_write(csi2, 0x00000014, CSI2_PHY_TST_CTRL1);
> +	imxcsi2_write(csi2, 0x00000002, CSI2_PHY_TST_CTRL0);
> +	imxcsi2_write(csi2, 0x00000000, CSI2_PHY_TST_CTRL0);
> +
> +	imxcsi2_enable(csi2, true);
> +}
> +
> +static int imxcsi2_dphy_wait(struct imxcsi2_dev *csi2)
> +{
> +	u32 reg;
> +	int i;
> +
> +	/* wait for mipi sensor ready */
> +	for (i = 0; i < 50; i++) {
> +		reg = imxcsi2_read(csi2, CSI2_PHY_STATE);
> +		if (reg != 0x200)
> +			break;
> +		usleep_range(10000, 20000);
> +	}
> +
> +	if (i >= 50) {
> +		v4l2_err(&csi2->sd,
> +			 "wait for clock lane timeout, phy_state = 0x%08x\n",
> +			 reg);
> +		return -ETIME;
> +	}
> +
> +	/* wait for mipi stable */
> +	for (i = 0; i < 50; i++) {
> +		reg = imxcsi2_read(csi2, CSI2_ERR1);
> +		if (reg == 0x0)
> +			break;
> +		usleep_range(10000, 20000);
> +	}
> +
> +	if (i >= 50) {
> +		v4l2_err(&csi2->sd,
> +			 "wait for controller timeout, err1 = 0x%08x\n",
> +			 reg);
> +		return -ETIME;
> +	}
> +
> +	/* finally let's wait for active clock on the clock lane */
> +	for (i = 0; i < 50; i++) {
> +		reg = imxcsi2_read(csi2, CSI2_PHY_STATE);
> +		if (reg & (1 << 8))
> +			break;
> +		usleep_range(10000, 20000);
> +	}
> +
> +	if (i >= 50) {
> +		v4l2_err(&csi2->sd,
> +			 "wait for active clock timeout, phy_state = 0x%08x\n",
> +			 reg);
> +		return -ETIME;
> +	}
> +
> +	v4l2_info(&csi2->sd, "ready, dphy version 0x%x\n",
> +		  imxcsi2_read(csi2, CSI2_VERSION));
> +
> +	return 0;
> +}
...
> +static int imxcsi2_s_power(struct v4l2_subdev *sd, int on)
> +{
> +	struct imxcsi2_dev *csi2 = sd_to_dev(sd);
> +
> +	if (on && !csi2->on) {
> +		v4l2_info(&csi2->sd, "power ON\n");
> +		clk_prepare_enable(csi2->cfg_clk);
> +		clk_prepare_enable(csi2->dphy_clk);
> +		imxcsi2_set_lanes(csi2);
> +		imxcsi2_reset(csi2);

The iMX6 manuals call for a very specific seven sequence of initialisation
for CSI2, which begins with:

1. reset the D-PHY.
2. place MIPI sensor in LP-11 state
3. perform D-PHY initialisation
4. configure CSI2 lanes and de-assert resets and shutdown signals

Since you reset the CSI2 at power up and then release it, how do you
guarantee that the published sequence is followed?

With Philipp's driver, this is easy, because there is a prepare_stream
callback which gives the sensor an opportunity to get everything
correctly configured according to the negotiated parameters, and place
the sensor in LP-11 state.

Some sensors do not power up in LP-11 state, but need to be programmed
fully before being asked to momentarily stream.  Only at that point is
the sensor guaranteed to be in the required LP-11 state.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
