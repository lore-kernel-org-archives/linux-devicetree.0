From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: Re: [PATCH v7 15/18] v4l2-fwnode: Add convenience function for
 parsing generic references
Date: Mon, 4 Sep 2017 19:38:42 +0200
Message-ID: <3921fde8-6192-87d7-9c5d-5dd2035a9565@xs4all.nl>
References: <20170903174958.27058-1-sakari.ailus@linux.intel.com>
 <20170903174958.27058-16-sakari.ailus@linux.intel.com>
 <0bb75f81-cc81-a4bf-f2af-41862c1d777a@xs4all.nl>
 <20170904163400.z26qmxuejhgdcmrw@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170904163400.z26qmxuejhgdcmrw-S+BSfZ9RZZmRSg0ZkenSGLdO1Tsj/99ntUK59QYPAWc@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Cc: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/04/2017 06:34 PM, Sakari Ailus wrote:
>>>  MODULE_LICENSE("GPL");
>>>  MODULE_AUTHOR("Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>");
>>>  MODULE_AUTHOR("Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>");
>>> diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
>>> index 6d125f26ec84..52f528162818 100644
>>> --- a/include/media/v4l2-fwnode.h
>>> +++ b/include/media/v4l2-fwnode.h
>>> @@ -254,4 +254,32 @@ int v4l2_async_notifier_parse_fwnode_endpoints(
>>>  			      struct v4l2_fwnode_endpoint *vep,
>>>  			      struct v4l2_async_subdev *asd));
>>>  
>>> +/**
>>> + * v4l2_fwnode_reference_parse - parse references for async sub-devices
>>> + * @dev: the device node the properties of which are parsed for references
>>
>> the device node whose properties are...
> 
> Both mean the same thing.

Yes, but I think your sentence is a bit awkward. Just my opinion, though.

Regards,

	Hans
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
