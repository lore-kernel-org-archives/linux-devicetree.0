From: Archit Taneja <architt@codeaurora.org>
Subject: Re: [PATCH 1/7] drm/bridge: Support hotplugging panel-bridge.
Date: Fri, 23 Jun 2017 19:24:49 +0530
Message-ID: <fc052035-0ba3-19ed-a43f-07f6cdcad5c7@codeaurora.org>
References: <20170615204130.19255-1-eric@anholt.net>
 <20170615204130.19255-2-eric@anholt.net>
 <777ee1b1-e5ce-ea29-8a48-f792354a22d1@codeaurora.org>
 <871sqkouvr.fsf@eliezer.anholt.net>
 <8e148170-b626-b426-3c94-b93d2746f4ce@codeaurora.org>
 <871sqe7ei0.fsf@eliezer.anholt.net>
 <CA+M3ks6T5aXjVuiYirw+j0UMt-x6tPjoeBXfOTAH8DXQNW-5sA@mail.gmail.com>
 <dd33044e-46d6-6f33-1011-b0bc343ddc96@codeaurora.org>
 <CGME20170622092354epcas1p2eb523cbfb64a4da2dc0b188df760d493@epcas1p2.samsung.com>
 <20170622112332.7ec7b65c@bbrezillon>
 <7ce4f741-309a-2eaa-381c-8033f089651a@samsung.com>
 <20170622144150.1663f649@bbrezillon>
 <004fe335-3f36-38e6-7a3e-0ad0623b29cf@samsung.com>
 <20170622153435.556fdaef@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170622153435.556fdaef@bbrezillon>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Andrzej Hajda <a.hajda@samsung.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Philippe Cornu <philippe.cornu@st.com>, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
List-Id: devicetree@vger.kernel.org



On 6/22/2017 7:04 PM, Boris Brezillon wrote:
> On Thu, 22 Jun 2017 15:16:47 +0200
> Andrzej Hajda <a.hajda@samsung.com> wrote:
> 
>> On 22.06.2017 14:41, Boris Brezillon wrote:
>>> On Thu, 22 Jun 2017 14:29:07 +0200
>>> Andrzej Hajda <a.hajda@samsung.com> wrote:
>>>   
>>>> On 22.06.2017 11:23, Boris Brezillon wrote:
>>>>> On Thu, 22 Jun 2017 13:47:43 +0530
>>>>> Archit Taneja <architt@codeaurora.org> wrote:
>>>>>     
>>>>>> On 06/22/2017 01:20 PM, Benjamin Gaignard wrote:
>>>>>>> 2017-06-20 19:31 GMT+02:00 Eric Anholt <eric@anholt.net>:
>>>>>>>> Archit Taneja <architt@codeaurora.org> writes:
>>>>>>>>       
>>>>>>>>> On 06/16/2017 08:13 PM, Eric Anholt wrote:
>>>>>>>>>> Archit Taneja <architt@codeaurora.org> writes:
>>>>>>>>>>       
>>>>>>>>>>> On 06/16/2017 02:11 AM, Eric Anholt wrote:
>>>>>>>>>>>> If the panel-bridge is being set up after the drm_mode_config_reset(),
>>>>>>>>>>>> then the connector's state would never get initialized, and we'd
>>>>>>>>>>>> dereference the NULL in the hotplug path.  We also need to register
>>>>>>>>>>>> the connector, so that userspace can get at it.
>>>>>>>>>>>>       
>>>>>>>>>>> Shouldn't the KMS driver make sure the panel-bridge is set up before
>>>>>>>>>>> drm_mode_config_reset? Is it the case when we're inserting the
>>>>>>>>>>> panel-bridge driver as a module?
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> All the connectors that have been added are registered automatically
>>>>>>>>>>> when drm_dev_register() is called by the KMS driver. Registering a
>>>>>>>>>>> connector in the middle of setting up our driver is prone to race
>>>>>>>>>>> conditions if the userspace decides to use them immediately.
>>>>>>>>>> Yeah, this is fixing initializing panel_bridge at DSI host_attach time,
>>>>>>>>>> which in the case of a panel module that creates the DSI device
>>>>>>>>>> (adv7533-style, like you said I should use as a reference) will be after
>>>>>>>>>> drm_mode_config_reset() and drm_dev_register().
>>>>>>>>> Okay. In the case of the msm kms driver, we defer probe until the
>>>>>>>>> adv7533 module is inserted, only then we proceed to drm_mode_config_reset()
>>>>>>>>> and drm_dev_register(). I assumed this was the general practice followed by
>>>>>>>>> most kms drivers. I.,e the kms driver defers probe until all connector
>>>>>>>>> related modules are inserted, and only then proceed to create a drm device.
>>>>>>>> The problem, though, is the panel driver needs the MIPI DSI host to
>>>>>>>> exist to call mipi_dsi_device_register_full() during the probe process.
>>>>>>>> The adv7533 driver gets around this by registering the DSI device in the
>>>>>>>> bridge attach step, but drm_panel doesn't have an attach step.
>>>>>> I'm not sure how we can get around this. We had discussion about this on irc
>>>>>> recently, but couldn't come up with a good conclusion. We could come up with a
>>>>>> panel_attach() callback to make it similar to bridges, but that's just us avoiding
>>>>>> the real issue.
>>>>> How about making DSI dev registration fully asynchronous, that is, DSI
>>>>> devs declared in the DT under the DSI host node will be
>>>>> registered/attached at probe time, and devs using another control bus
>>>>> (like the adv7533 controller over i2c) will be registered afterwards.
>>>>>
>>>>> That implies moving the drm_brige registration logic outside of the DSI
>>>>> host ->probe() path. The idea would be to check if all devs connected
>>>>> to the DSI bus are ready at dsi_host->attach() time. If they are, we
>>>>> can finally register the XXX -> DSI bridge. If they're not (because
>>>>> some devs connected to the DSI bus have not been probed yet), then we
>>>>> do not register the drm_bridge and wait for the next dsi_host->attach()
>>>>> event.
>>>> I guess you assumes that dsi-host knows all devs connected to it, thanks to:
>>>> - subnodes of the host - ie. devices controlled via dsi bus,
>>>> - graph links from host ports/endpoints - ie. devices controlled by
>>>> other buses, for example adv7533.
>>> Yep, but I think that's already a requirement when populating devices
>>> with the OF graph method (if one of the DSI output endpoint does not
>>> have a drm_bridge/panel attached to it, the DSI host driver returns
>>> -EPROBE_DEFER).
>>>   
>>>> I would separate both abstractions to make it more clear:
>>>> 1. MIPI bus should be registered early - to allow create/bind devices on it,
>>> Exactly.
>>>   
>>>> 2. drm_bridge should be registered only if all required sinks
>>>> (bridges/panels) are registered.
>>> That's true, until we find a solution to support add DRM bridge hotplug.
>>>   
>>>> First point seems OK, I am not sure about the 2nd one - if used
>>>> consistently, it would require building pipeline from sink to source.
>>> Yes.
>>
>> Since drm_bridge_attach requires encoder to be not null pipeline
>> creation would be painful:
>> 1. Every driver must call drm_of_find_panel_or_bridge on sink(s) before
>> registering bridge and cache the result for later use.
> 
> Shouldn't be hard to do since dsi_host->attach() is called each time a
> sink is added (and ready to use). All you need to do is retrieve the
> bridge pointer and put it in a list embedded in the DSI host priv
> struct. Once you have all sinks added to this list (can be checked by
> counting the number of endpoints and DSI devs at probe time), you can
> register the DSI bridge and wait for someone to call ->attach() on it.

Some of the kms drivers (including vc4) currently do the bridge
registration, and call drm_bridge_attach() in the DSI host driver's
probe path itself. I guess some of them would require some restructuring
to work with the above approach.

Other kms drivers (msm for example) already have a separate modeset_init
path where different drm objects (crtcs, encoders, bridges) are created.
That's the one that can defer rather than defer-ing the DSI host driver.

We'd want people be willing to convert their kms drivers to go ahead
with the approach.

Thanks for continuing the discussion, it was quite informative.

Regards,
Archit

> 
> In the ->attach() hook of the DSI bridge, you'll have to attach all
> sinks stored in the list to the DSI bridge. Note that right now you have
> a 1:1 relationship, which prevents you from having one DSI bridge that
> can attach to different bridges available on the DSI bus (e.g. DSI ->
> HDMI bridge on channel 0 and DSI -> LVDS bridge on channel 1).
> 
>> 2. After encoder finds directly connected bridge, it can attach it.
> 
> I don't get that one.
> 
>> 3. attach callback of every bridge should attach subsequent bridge.
> 
> Yep.
> 
>>
>> Quite complicated,
> 
> Not sure it's more complicated than what we have right now.
> 
>> maybe bridges should be chained w/o available
>> encoder, and later attached to encoder with other helper, for example
>> drm_bridge_chain_attach.
> 
> That's also a solution.
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
