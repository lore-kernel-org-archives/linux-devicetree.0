From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH RFC v3 02/15] [media] Add a V4L2 OF parser
Date: Wed, 23 Jan 2013 11:44:50 +0100
Message-ID: <50FFBF22.7030506@samsung.com>
References: <1356969793-27268-3-git-send-email-s.nawrocki@samsung.com>
 <1357232962-7425-1-git-send-email-s.nawrocki@samsung.com>
 <201301211235.14450.hverkuil@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <201301211235.14450.hverkuil@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, g.liakhovetski@gmx.de, laurent.pinchart@ideasonboard.com, grant.likely@secretlab.ca, rob.herring@calxeda.com, thomas.abraham@linaro.org, t.figa@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On 01/21/2013 12:35 PM, Hans Verkuil wrote:
[...]
>> +/**
>> + * v4l2_of_parse_mipi_csi2() - parse MIPI CSI-2 bus properties
>> + * @node: pointer to endpoint device_node
>> + * @endpoint: pointer to v4l2_of_endpoint data structure
>> + *
>> + * Return: 0 on success or negative error value otherwise.
>> + */
>> +int v4l2_of_parse_mipi_csi2(const struct device_node *node,
>> +			    struct v4l2_of_endpoint *endpoint)
>> +{
>> +	struct v4l2_of_mipi_csi2 *mipi_csi2 = &endpoint->mipi_csi_2;
>> +	u32 data_lanes[ARRAY_SIZE(mipi_csi2->data_lanes)];
>> +	struct property *prop;
>> +	const __be32 *lane = NULL;
>> +	u32 v;
>> +	int i = 0;
>> +
>> +	prop = of_find_property(node, "data-lanes", NULL);
>> +	if (!prop)
>> +		return -EINVAL;
>> +	do {
>> +		lane = of_prop_next_u32(prop, lane, &data_lanes[i]);
>> +	} while (lane && i++ < ARRAY_SIZE(data_lanes));
>> +
>> +	mipi_csi2->num_data_lanes = i;
>> +	while (i--)
>> +		mipi_csi2->data_lanes[i] = data_lanes[i];
>> +
>> +	if (!of_property_read_u32(node, "clock-lanes", &v))
>> +		mipi_csi2->clock_lane = v;
> 
> Hmm, the property name is 'clock-lanes', but only one lane is obtained here.
> 
> Why is the property name plural in that case?

This is how we agreed it with Guennadi, the argumentation was that it is 
more consistent with 'data-lanes'. Also I think it is better to use plural 
form right from the beginning, rather than introducing another 'clock-lanes' 
property along 'clock-lane' when there would be a need to handle busses 
with more than one clock lane in the future.

[...]
>> +/**
>> + * v4l2_of_parse_endpoint() - parse all endpoint node properties
>> + * @node: pointer to endpoint device_node
>> + * @endpoint: pointer to v4l2_of_endpoint data structure
>> + *
>> + * All properties are optional. If none are found, we don't set any flags.
>> + * This means the port has a static configuration and no properties have
>> + * to be specified explicitly.
>> + * If any properties that identify the bus as parallel are found and
>> + * slave-mode isn't set, we set V4L2_MBUS_MASTER. Similarly, if we recognise
>> + * the bus as serial CSI-2 and clock-noncontinuous isn't set, we set the
>> + * V4L2_MBUS_CSI2_CONTINUOUS_CLOCK flag.
>> + * The caller should hold a reference to @node.
>> + */
>> +void v4l2_of_parse_endpoint(const struct device_node *node,
>> +			    struct v4l2_of_endpoint *endpoint)
>> +{
>> +	const struct device_node *port_node = of_get_parent(node);
>> +	bool data_lanes_present = false;
>> +
>> +	memset(endpoint, 0, sizeof(*endpoint));
>> +
>> +	endpoint->local_node = node;
>> +
>> +	/* Doesn't matter, whether the below two calls succeed */
> 
> 'It doesn't matter whether the two calls below succeed. If they don't
> then the default value 0 is used.'
> 
> At least, that's how I understand the code.

Yeah, it's more precise this way. I'll amend it, thanks!

>> +	of_property_read_u32(port_node, "reg", &endpoint->port);
>> +	of_property_read_u32(node, "reg", &endpoint->addr);

--

Regards,
Sylwester
