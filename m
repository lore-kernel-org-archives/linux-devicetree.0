From: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v14 07/28] rcar-vin: Use generic parser for parsing fwnode
 endpoints
Date: Mon, 2 Oct 2017 15:24:05 +0300
Message-ID: <82a055f5-b0ad-bcd2-7d28-f256163a288c@linux.intel.com>
References: <20170925222540.371-1-sakari.ailus@linux.intel.com>
 <20170925222540.371-8-sakari.ailus@linux.intel.com>
 <20170930131709.GP17182@bigcity.dyn.berto.se>
 <3f940721-f190-4662-cfda-d99a0d97bf08@linux.intel.com>
 <20171002121422.GQ17182@bigcity.dyn.berto.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171002121422.GQ17182-ofJ5d6taAgIKcZgyrm77+z0dHWC0CY5B@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hejssan,

On 10/02/17 15:14, Niklas Söderlund wrote:
> Hi Sakari,
> 
> On 2017-10-02 14:58:10 +0300, Sakari Ailus wrote:
>> Hi Niklas,
>>
>> On 09/30/17 16:17, Niklas Söderlund wrote:
>>> Hi Sakari,
>>>
>>> Thanks for your patch, I like it. Unfortunately it causes issues :-(
>>>
>>> I picked the first 7 patches of this series on top of media-next and it 
>>> produce problems when tested on Koelsch with CONFIG_OF_DYNAMIC=y.
>>>
>>> 1. It print's 'OF: ERROR: Bad of_node_put() on /video@e6ef0000/port' 
>>>    messages during boot.
>>
>> Do you have your own patch to fix fwnode_graph_get_port_parent()
>> applied? I noticed it doesn't seem to be in Rob's tree; let's continue
>> in the other thread.
>>
>> <URL:https://www.mail-archive.com/linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg117450.html>
> 
> To produce this issue the fix is not applied. But as I try to describe 
> at the end of my email applying it fixes both issues. So I think this 
> patch is correct (and that is why I Acked it) but my concern is that if 
> it's picked up before the fwnode_graph_get_port_parent() issue is sorted 
> out there will be problems for rcar-vin, and if possible I would like to 
> avoid that.

Oops. I missed that between the oops log and the patch. X-)

Well, good to hear that this isn't an actual bug in this set. I'll try
to be careful in sending pull requests. :-) The same issue would be
present in any other driver using the new convenience functions.

-- 
Kind regards,

Sakari Ailus
sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
