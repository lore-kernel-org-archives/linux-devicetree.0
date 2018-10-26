From: Philipp Zabel <pza@pengutronix.de>
Subject: Re: [PATCH v2 3/3] reset: reset-zynqmp: Adding support for Xilinx
 zynqmp reset controller.
Date: Fri, 26 Oct 2018 13:08:50 +0200
Message-ID: <20181026110850.y3jivrbgjtivndvi@pengutronix.de>
References: <20181026122424.30831-1-nava.manne@xilinx.com>
 <20181026122424.30831-4-nava.manne@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181026122424.30831-4-nava.manne@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nava kishore Manne <nava.manne@xilinx.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, michal.simek@xilinx.com, rajanv@xilinx.com, jollys@xilinx.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, chinnikishore369@gmail.com
List-Id: devicetree@vger.kernel.org

On Fri, Oct 26, 2018 at 05:54:24PM +0530, Nava kishore Manne wrote:
[...]
> +static int zynqmp_reset_status(struct reset_controller_dev *rcdev,
> +			       unsigned long id)
> +{
> +	struct zynqmp_reset_data *priv = to_zynqmp_reset_data(rcdev);
> +	int val, err;
> +
> +	err = priv->eemi_ops->reset_get_status(ZYNQMP_RESET_ID + id, &val);
> +	if (!err)
> +		return err;

This should be:

	if (err)
		return err;

instead. Otherwise you end up always returning 0 on success ...

> +
> +	return val;

... and uninitialized val on error.

regards
Philipp
