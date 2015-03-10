From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v4] media: i2c: add support for omnivision's ov2659 sensor
Date: Tue, 10 Mar 2015 03:35:57 +0200
Message-ID: <20150310013556.GF11954@valkosipuli.retiisi.org.uk>
References: <1425814407-22766-1-git-send-email-prabhakar.csengg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1425814407-22766-1-git-send-email-prabhakar.csengg@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lad Prabhakar <prabhakar.csengg@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Hans Verkuil <hans.verkuil@cisco.com>, LMML <linux-media@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Prabhakar,

On Sun, Mar 08, 2015 at 11:33:27AM +0000, Lad Prabhakar wrote:
...
> +static struct ov2659_platform_data *
> +ov2659_get_pdata(struct i2c_client *client)
> +{
> +	struct ov2659_platform_data *pdata;
> +	struct device_node *endpoint;
> +	int ret;
> +
> +	if (!IS_ENABLED(CONFIG_OF) || !client->dev.of_node) {
> +		dev_err(&client->dev, "ov2659_get_pdata: DT Node found\n");
> +		return client->dev.platform_data;
> +	}
> +
> +	endpoint = of_graph_get_next_endpoint(client->dev.of_node, NULL);
> +	if (!endpoint)
> +		return NULL;
> +
> +	pdata = devm_kzalloc(&client->dev, sizeof(*pdata), GFP_KERNEL);
> +	if (!pdata)
> +		goto done;
> +
> +	ret = of_property_read_u32(endpoint, "link-frequencies",
> +				   &pdata->link_frequency);

This is actually documented as being a 64-bit array.

The smiapp wasn't even reading it from the endpoint node. Oh well...

-- 
Regards,

Sakari Ailus
e-mail: sakari.ailus@iki.fi	XMPP: sailus@retiisi.org.uk
