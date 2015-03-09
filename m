From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] v4l: mt9v032: Add OF support
Date: Mon, 09 Mar 2015 12:57:18 +0100
Message-ID: <54FD8A9E.6040303@samsung.com>
References: <1425822349-19218-1-git-send-email-laurent.pinchart@ideasonboard.com>
 <54FD7788.2020709@samsung.com>
 <20150309105744.GD11954@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <20150309105744.GD11954@valkosipuli.retiisi.org.uk>
Sender: linux-media-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Sakari,

On 09/03/15 11:57, Sakari Ailus wrote:
>>> +static struct mt9v032_platform_data *
>>> +mt9v032_get_pdata(struct i2c_client *client)
>>> +{
>>> +	struct mt9v032_platform_data *pdata;
>>> +	struct v4l2_of_endpoint endpoint;
>>> +	struct device_node *np;
>>> +	struct property *prop;
>>> +
>>> +	if (!IS_ENABLED(CONFIG_OF) || !client->dev.of_node)
>>> +		return client->dev.platform_data;
>>> +
>>> +	np = v4l2_of_get_next_endpoint(client->dev.of_node, NULL);
>>> +	if (!np)
>>> +		return NULL;
>>> +
>>> +	if (v4l2_of_parse_endpoint(np, &endpoint) < 0)
>>> +		goto done;
>>> +
>>> +	pdata = devm_kzalloc(&client->dev, sizeof(*pdata), GFP_KERNEL);
>>> +	if (!pdata)
>>> +		goto done;
>>> +
>>> +	prop = of_find_property(np, "link-freqs", NULL);
>>
>> I suspect you meant "link-frequencies" here ?
> 
> Yes. I wonder if it'd make sense to add this to struct v4l2_of_endpoint. I
> can write a patch for that.

I don't have strong preference, sooner or later we will need to
add it there, so code duplication can be avoided. I guess it makes
sense to add such code already with a first user of it.

>>> +	if (prop) {
>>> +		size_t size = prop->length / 8;
>>> +		u64 *link_freqs;
>>> +
>>> +		link_freqs = devm_kzalloc(&client->dev,
>>> +					  size * sizeof(*link_freqs),
>>> +					  GFP_KERNEL);
>>> +		if (!link_freqs)
>>> +			goto done;
>>> +
>>> +		if (of_property_read_u64_array(np, "link-frequencies",
>>> +					       link_freqs, size) < 0)
>>> +			goto done;
>>> +
>>> +		pdata->link_freqs = link_freqs;
>>> +		pdata->link_def_freq = link_freqs[0];
>>> +	}
> 
> If you're interested in just a single value, you can use
> of_property_read_u64().
> 
>>> +	pdata->clk_pol = !!(endpoint.bus.parallel.flags &
>>> +			    V4L2_MBUS_PCLK_SAMPLE_RISING);
>>> +
>>> +done:
>>> +	of_node_put(np);
>>> +	return pdata;
>>> +}

-- 
Regards,
Sylwester
