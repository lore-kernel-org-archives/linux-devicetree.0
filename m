From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v9 0/7] Solve postboot supplier cleanup and optimize probe
 ordering
Date: Wed, 7 Aug 2019 19:13:26 -0700
Message-ID: <05d4f2b2-0395-476d-8c93-37b2b07bdd4f@gmail.com>
References: <20190731221721.187713-1-saravanak@google.com>
 <20190801061209.GA3570@kroah.com>
 <5a1e785d-075e-19a0-7d3d-949e1b65d726@gmail.com>
 <20190801193248.GA24916@kroah.com>
 <6366cb2a-65ea-cb44-f765-f246f3fb3bf9@gmail.com>
 <20190802063720.GA12789@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190802063720.GA12789@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Saravana Kannan <saravanak@google.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, David Collins <collinsd@codeaurora.org>, kernel-team@android.com
List-Id: devicetree@vger.kernel.org

Hi Greg, Saravana,

On 8/1/19 11:37 PM, Greg Kroah-Hartman wrote:
> On Thu, Aug 01, 2019 at 12:59:25PM -0700, Frank Rowand wrote:
>> On 8/1/19 12:32 PM, Greg Kroah-Hartman wrote:
>>> On Thu, Aug 01, 2019 at 12:28:13PM -0700, Frank Rowand wrote:
>>>> Hi Greg,
>>>>
>>>> On 7/31/19 11:12 PM, Greg Kroah-Hartman wrote:
>>>>> On Wed, Jul 31, 2019 at 03:17:13PM -0700, Saravana Kannan wrote:
>>>>>> Add device-links to track functional dependencies between devices
>>>>>> after they are created (but before they are probed) by looking at
>>>>>> their common DT bindings like clocks, interconnects, etc.
>>>>>>
>>>>>> Having functional dependencies automatically added before the devices
>>>>>> are probed, provides the following benefits:
>>>>>>
>>>>>> - Optimizes device probe order and avoids the useless work of
>>>>>>   attempting probes of devices that will not probe successfully
>>>>>>   (because their suppliers aren't present or haven't probed yet).
>>>>>>
>>>>>>   For example, in a commonly available mobile SoC, registering just
>>>>>>   one consumer device's driver at an initcall level earlier than the
>>>>>>   supplier device's driver causes 11 failed probe attempts before the
>>>>>>   consumer device probes successfully. This was with a kernel with all
>>>>>>   the drivers statically compiled in. This problem gets a lot worse if
>>>>>>   all the drivers are loaded as modules without direct symbol
>>>>>>   dependencies.
>>>>>>
>>>>>> - Supplier devices like clock providers, interconnect providers, etc
>>>>>>   need to keep the resources they provide active and at a particular
>>>>>>   state(s) during boot up even if their current set of consumers don't
>>>>>>   request the resource to be active. This is because the rest of the
>>>>>>   consumers might not have probed yet and turning off the resource
>>>>>>   before all the consumers have probed could lead to a hang or
>>>>>>   undesired user experience.
>>>>>>
>>>>>>   Some frameworks (Eg: regulator) handle this today by turning off
>>>>>>   "unused" resources at late_initcall_sync and hoping all the devices
>>>>>>   have probed by then. This is not a valid assumption for systems with
>>>>>>   loadable modules. Other frameworks (Eg: clock) just don't handle
>>>>>>   this due to the lack of a clear signal for when they can turn off
>>>>>>   resources. This leads to downstream hacks to handle cases like this
>>>>>>   that can easily be solved in the upstream kernel.
>>>>>>
>>>>>>   By linking devices before they are probed, we give suppliers a clear
>>>>>>   count of the number of dependent consumers. Once all of the
>>>>>>   consumers are active, the suppliers can turn off the unused
>>>>>>   resources without making assumptions about the number of consumers.
>>>>>>
>>>>>> By default we just add device-links to track "driver presence" (probe
>>>>>> succeeded) of the supplier device. If any other functionality provided
>>>>>> by device-links are needed, it is left to the consumer/supplier
>>>>>> devices to change the link when they probe.
>>>>>
>>>>> All now queued up in my driver-core-testing branch, and if 0-day is
>>>>> happy with this, will move it to my "real" driver-core-next branch in a
>>>>> day or so to get included in linux-next.
>>>>
>>>> I have been slow in getting my review out.
>>>>
>>>> This patch series is not yet ready for sending to Linus, so if putting
>>>> this in linux-next implies that it will be in your next pull request
>>>> to Linus, please do not put it in linux-next.
>>>
>>> It means that it will be in my pull request for 5.4-rc1, many many
>>> waeeks away from now.
>>
>> If you are willing to revert the series before the pull request _if_ I
>> have significant review issues in the next couple of days, then I am happy
>> to see the patches get exposure in linux-next.
> 
> If you have significant review issues, yes, I will be glad to revert them.

Just a heads up that I have sent review issues in reply to version 7 of this
patch series.

We'll see what the responses are to my review comments, but I am expecting
the changes are big enough to result in a new version (or a couple more
versions) of the patch series.

No rush to revert version 9 since your 5.4-rc1 pull request is still not
near, and I am glad for whatever exposure these patches are getting in
linux-next.

Thanks,

Frank

> 
> thanks,
> 
> greg k-h
> 
