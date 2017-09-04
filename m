From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: Re: [PATCH v7 04/18] v4l: fwnode: Support generic parsing of graph
 endpoints in a device
Date: Mon, 4 Sep 2017 19:37:09 +0200
Message-ID: <cad608c6-93b6-d791-a14a-a5b38fe6e1bf@xs4all.nl>
References: <20170903174958.27058-1-sakari.ailus@linux.intel.com>
 <20170903174958.27058-5-sakari.ailus@linux.intel.com>
 <e07f9b4d-e8dc-5598-98ee-3c69e3100b81@xs4all.nl>
 <20170904155415.nak4dofd2k6ytupa@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170904155415.nak4dofd2k6ytupa-S+BSfZ9RZZmRSg0ZkenSGLdO1Tsj/99ntUK59QYPAWc@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Cc: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/04/2017 05:54 PM, Sakari Ailus wrote:
>>> +/**
>>> + * v4l2_async_notifier_parse_fwnode_endpoints - Parse V4L2 fwnode endpoints in a
>>> + *						device node
>>> + * @dev: the device the endpoints of which are to be parsed
>>> + * @notifier: notifier for @dev
>>> + * @asd_struct_size: size of the driver's async sub-device struct, including
>>> + *		     sizeof(struct v4l2_async_subdev). The &struct
>>> + *		     v4l2_async_subdev shall be the first member of
>>> + *		     the driver's async sub-device struct, i.e. both
>>> + *		     begin at the same memory address.
>>> + * @parse_endpoint: Driver's callback function called on each V4L2 fwnode
>>> + *		    endpoint. Optional.
>>> + *		    Return: %0 on success
>>> + *			    %-ENOTCONN if the endpoint is to be skipped but this
>>> + *				       should not be considered as an error
>>> + *			    %-EINVAL if the endpoint configuration is invalid
>>> + *
>>> + * Parse the fwnode endpoints of the @dev device and populate the async sub-
>>> + * devices array of the notifier. The @parse_endpoint callback function is
>>> + * called for each endpoint with the corresponding async sub-device pointer to
>>> + * let the caller initialize the driver-specific part of the async sub-device
>>> + * structure.
>>> + *
>>> + * The notifier memory shall be zeroed before this function is called on the
>>> + * notifier.
>>> + *
>>> + * This function may not be called on a registered notifier and may be called on
>>> + * a notifier only once. When using this function, the user may not access the
>>> + * notifier's subdevs array nor change notifier's num_subdevs field, these are
>>> + * reserved for the framework's internal use only.
>>
>> I don't think the sentence "When using...only" makes any sense. How would you
>> even be able to access any of the notifier fields? You don't have access to it
>> from the parse_endpoint callback.
> 
> Not from the parse_endpoint callback. The notifier is first set up by the
> driver, and this text applies to that --- whether or not parse_endpoint is
> given.

What you mean is "After calling this function..." since v4l2_async_notifier_release()
needs this to release all the memory.

I'll take another look at this text when I see v8.

Regards,

	Hans

> 
>>
>> I think it can just be dropped.
>>
>>> + *
>>> + * The @struct v4l2_fwnode_endpoint passed to the callback function
>>> + * @parse_endpoint is released once the function is finished. If there is a need
>>> + * to retain that configuration, the user needs to allocate memory for it.
>>> + *
>>> + * Any notifier populated using this function must be released with a call to
>>> + * v4l2_async_notifier_release() after it has been unregistered and the async
>>> + * sub-devices are no longer in use.
>>> + *
>>> + * Return: %0 on success, including when no async sub-devices are found
>>> + *	   %-ENOMEM if memory allocation failed
>>> + *	   %-EINVAL if graph or endpoint parsing failed
>>> + *	   Other error codes as returned by @parse_endpoint
>>> + */
>>> +int v4l2_async_notifier_parse_fwnode_endpoints(
>>> +	struct device *dev, struct v4l2_async_notifier *notifier,
>>> +	size_t asd_struct_size,
>>> +	int (*parse_endpoint)(struct device *dev,
>>> +			      struct v4l2_fwnode_endpoint *vep,
>>> +			      struct v4l2_async_subdev *asd));
>>> +
>>>  #endif /* _V4L2_FWNODE_H */
>>>
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
