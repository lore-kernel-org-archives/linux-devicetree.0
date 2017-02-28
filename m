From: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 1/1] devicetree: of_node_put() does not require holding
 devtree_lock
Date: Tue, 28 Feb 2017 08:36:32 +0200
Message-ID: <bb5607dc-0055-a188-945b-ab385b573acb@linux.intel.com>
References: <1487755758-6066-1-git-send-email-sakari.ailus@linux.intel.com>
 <58B43DB6.4040009@gmail.com>
 <CAL_JsqJyMqaaMDU81Jes-M8jvxewJnyFD33pqd9NUCZFa0HYcg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJyMqaaMDU81Jes-M8jvxewJnyFD33pqd9NUCZFa0HYcg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob and Frank,

Rob Herring wrote:
> On Mon, Feb 27, 2017 at 8:54 AM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On 02/22/17 01:29, Sakari Ailus wrote:
>>> While holding a reference to a device_node it is allowed to put that node
>>> without holding devtree_lock spinlock. Move of_node_put() after releasing
>>> the spinlock.
>>>
>>> Signed-off-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>>
>> I would rather leave this code the way it is.
>>
>> The change is a micro-optimization that is not going to have any real
>> impact on performance.
>
> I have the same feelings.

Fair enough. Feel free to ignore the patch then.

-- 
Kind regards,

Sakari Ailus
sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
