From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: Re: [PATCH v8 14/21] v4l: async: Allow binding notifiers to
 sub-devices
Date: Thu, 7 Sep 2017 14:02:14 +0200
Message-ID: <62199083-9d61-daa5-f16a-c3d29ed94407@xs4all.nl>
References: <20170905130553.1332-1-sakari.ailus@linux.intel.com>
 <20170905130553.1332-15-sakari.ailus@linux.intel.com>
 <910b3d01-a8a4-2363-4b24-ed0edd1e1f4d@xs4all.nl>
 <20170907083209.3xtaxwhrfmgrtpfz@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170907083209.3xtaxwhrfmgrtpfz-S+BSfZ9RZZmRSg0ZkenSGLdO1Tsj/99ntUK59QYPAWc@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Cc: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/07/17 10:32, Sakari Ailus wrote:
> Hi Hans,
> 
> On Wed, Sep 06, 2017 at 10:46:31AM +0200, Hans Verkuil wrote:
>> On 09/05/2017 03:05 PM, Sakari Ailus wrote:

>>> diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
>>> index 3bc8a7c0d83f..12739be44bd1 100644
>>> --- a/include/media/v4l2-async.h
>>> +++ b/include/media/v4l2-async.h
>>> @@ -102,7 +102,9 @@ struct v4l2_async_notifier_operations {
>>>   * @num_subdevs: number of subdevices used in the subdevs array
>>>   * @max_subdevs: number of subdevices allocated in the subdevs array
>>>   * @subdevs:	array of pointers to subdevice descriptors
>>> - * @v4l2_dev:	pointer to struct v4l2_device
>>> + * @v4l2_dev:	v4l2_device of the master, for subdev notifiers NULL
>>> + * @sd:		sub-device that registered the notifier, NULL otherwise
>>> + * @master:	master notifier carrying @v4l2_dev
>>
>> I think this description is out of date. It is really the parent notifier,
>> right? Should 'master' be renamed to 'parent'?
> 
> You could view it as one, yes. What is known is that the notifier is
> related, and through which the v4l2_dev can be found. I'll rename it as
> "parent".
> 
> I'll use root in the commit message as well.
> 
>>
>> Same problem with the description of @v4l2_dev: it's the v4l2_device of the
>> root/top-level notifier.
> 
> "v4l2_device of the root notifier, NULL otherwise"?

Ack.

	Hans

> 
>>
>>>   * @waiting:	list of struct v4l2_async_subdev, waiting for their drivers
>>>   * @done:	list of struct v4l2_subdev, already probed
>>>   * @list:	member in a global list of notifiers
>>> @@ -113,6 +115,8 @@ struct v4l2_async_notifier {
>>>  	unsigned int max_subdevs;
>>>  	struct v4l2_async_subdev **subdevs;
>>>  	struct v4l2_device *v4l2_dev;
>>> +	struct v4l2_subdev *sd;
>>> +	struct v4l2_async_notifier *master;
>>>  	struct list_head waiting;
>>>  	struct list_head done;
>>>  	struct list_head list;
>>> @@ -128,6 +132,16 @@ int v4l2_async_notifier_register(struct v4l2_device *v4l2_dev,
>>>  				 struct v4l2_async_notifier *notifier);
>>>  
>>>  /**
>>> + * v4l2_async_subdev_notifier_register - registers a subdevice asynchronous
>>> + *					 notifier for a sub-device
>>> + *
>>> + * @sd: pointer to &struct v4l2_subdev
>>> + * @notifier: pointer to &struct v4l2_async_notifier
>>> + */
>>> +int v4l2_async_subdev_notifier_register(struct v4l2_subdev *sd,
>>> +					struct v4l2_async_notifier *notifier);
>>> +
>>> +/**
>>>   * v4l2_async_notifier_unregister - unregisters a subdevice asynchronous notifier
>>>   *
>>>   * @notifier: pointer to &struct v4l2_async_notifier
>>>
>>
>> This v8 is much better and is getting close.
> 
> Thanks!
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
