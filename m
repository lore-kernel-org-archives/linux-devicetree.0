From: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 1/7] drm/bridge: Support hotplugging panel-bridge.
Date: Tue, 27 Jun 2017 12:23:25 +0530
Message-ID: <28e370bb-cb81-a564-6a17-0253b95f5370@codeaurora.org>
References: <20170615204130.19255-1-eric@anholt.net>
 <20170615204130.19255-2-eric@anholt.net>
 <777ee1b1-e5ce-ea29-8a48-f792354a22d1@codeaurora.org>
 <871sqkouvr.fsf@eliezer.anholt.net>
 <8e148170-b626-b426-3c94-b93d2746f4ce@codeaurora.org>
 <871sqe7ei0.fsf@eliezer.anholt.net>
 <CA+M3ks6T5aXjVuiYirw+j0UMt-x6tPjoeBXfOTAH8DXQNW-5sA@mail.gmail.com>
 <dd33044e-46d6-6f33-1011-b0bc343ddc96@codeaurora.org>
 <20170622112332.7ec7b65c@bbrezillon> <87o9te1igt.fsf@eliezer.anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87o9te1igt.fsf-omZaPlIz5HhaEpDpdNBo/KxOck334EZe@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Philippe Cornu <philippe.cornu-qxv4g6HH51o@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 06/24/2017 03:20 AM, Eric Anholt wrote:
> Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> writes:
> 
>> On Thu, 22 Jun 2017 13:47:43 +0530
>> Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
>>
>>> On 06/22/2017 01:20 PM, Benjamin Gaignard wrote:
>>>> 2017-06-20 19:31 GMT+02:00 Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>:
>>>>> Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> writes:
>>>>>   
>>>>>> On 06/16/2017 08:13 PM, Eric Anholt wrote:
>>>>>>> Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> writes:
>>>>>>>   
>>>>>>>> On 06/16/2017 02:11 AM, Eric Anholt wrote:
>>>>>>>>> If the panel-bridge is being set up after the drm_mode_config_reset(),
>>>>>>>>> then the connector's state would never get initialized, and we'd
>>>>>>>>> dereference the NULL in the hotplug path.  We also need to register
>>>>>>>>> the connector, so that userspace can get at it.
>>>>>>>>>   
>>>>>>>>
>>>>>>>> Shouldn't the KMS driver make sure the panel-bridge is set up before
>>>>>>>> drm_mode_config_reset? Is it the case when we're inserting the
>>>>>>>> panel-bridge driver as a module?
>>>>>>>>
>>>>>>>>
>>>>>>>> All the connectors that have been added are registered automatically
>>>>>>>> when drm_dev_register() is called by the KMS driver. Registering a
>>>>>>>> connector in the middle of setting up our driver is prone to race
>>>>>>>> conditions if the userspace decides to use them immediately.
>>>>>>>
>>>>>>> Yeah, this is fixing initializing panel_bridge at DSI host_attach time,
>>>>>>> which in the case of a panel module that creates the DSI device
>>>>>>> (adv7533-style, like you said I should use as a reference) will be after
>>>>>>> drm_mode_config_reset() and drm_dev_register().
>>>>>>
>>>>>> Okay. In the case of the msm kms driver, we defer probe until the
>>>>>> adv7533 module is inserted, only then we proceed to drm_mode_config_reset()
>>>>>> and drm_dev_register(). I assumed this was the general practice followed by
>>>>>> most kms drivers. I.,e the kms driver defers probe until all connector
>>>>>> related modules are inserted, and only then proceed to create a drm device.
>>>>>
>>>>> The problem, though, is the panel driver needs the MIPI DSI host to
>>>>> exist to call mipi_dsi_device_register_full() during the probe process.
>>>>> The adv7533 driver gets around this by registering the DSI device in the
>>>>> bridge attach step, but drm_panel doesn't have an attach step.
>>>
>>> I'm not sure how we can get around this. We had discussion about this on irc
>>> recently, but couldn't come up with a good conclusion. We could come up with a
>>> panel_attach() callback to make it similar to bridges, but that's just us avoiding
>>> the real issue.
>>
>> How about making DSI dev registration fully asynchronous, that is, DSI
>> devs declared in the DT under the DSI host node will be
>> registered/attached at probe time, and devs using another control bus
>> (like the adv7533 controller over i2c) will be registered afterwards.
>>
>> That implies moving the drm_brige registration logic outside of the DSI
>> host ->probe() path. The idea would be to check if all devs connected
>> to the DSI bus are ready at dsi_host->attach() time. If they are, we
>> can finally register the XXX -> DSI bridge. If they're not (because
>> some devs connected to the DSI bus have not been probed yet), then we
>> do not register the drm_bridge and wait for the next dsi_host->attach()
>> event.
>>
>> With this solution, I think we can avoid the chicken&egg problem where
>> the adv7533 dev is waiting for the DSI host to be probed to be able to
>> register a DSI dev with mipi_dsi_device_register_full() and the DSI
>> host needs all devs to be registered to not return -EPROBE_DEFER.
> 
> I've now tried having mipi_dsi_device_register_full() succeed early and
> just do the device-add part when the host shows up.  The problem is
> there's still mipi_dsi_attach(), which needs to be delayed until the
> panel driver fills in the rest of mipi_dsi_device's fields.  Why aren't
> those part of the info?

In the past, the only way to create mipi_dsi_devices was to add them as
children DT nodes under the DSI host node. The KMS driver calls
mipi_dsi_host_register(), which resulted in the creation of all the
children mipi_dsi_devices. The DSI host was still unaware of parameters
like number of lanes, mode_flags etc. mipi_dsi_attach() was a way by
which the DSI device could share these with its DSI host. Another use
of mipi_dsi_attach()/detach() is if the panel driver wants to notify
the DSI host an update in one of the device's fields (for example, a
change in the number of lanes).

We've recently added another way of creating mipi_dsi_devices (i.e, by
making a driver call mipi_dsi_device_register_full) for cases where there
isn't a DT representation of the DSI device.

For the second method, the need to call mipi_dsi_attach() separately becomes
sort of redundant. We could consider embedding the other mipi_dsi_device
fields (lanes etc) in mipi_dsi_device_info itself, and invoke the DSI host's
->attach() callback through mipi_dsi_device_register_full() itself. Would
that help resolving your issue?

Archit

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
