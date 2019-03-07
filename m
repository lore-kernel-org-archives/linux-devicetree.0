From: Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH v4 6/6] usb:cdns3 Fix for stuck packets in on-chip OUT
 buffer.
Date: Thu, 7 Mar 2019 11:13:40 +0200
Message-ID: <11e29bea-98c1-03c4-a7d5-c529df2cc341@ti.com>
References: <1550173514-23573-1-git-send-email-pawell@cadence.com>
 <1550173514-23573-7-git-send-email-pawell@cadence.com>
 <67da432f-9c95-d644-65b5-dbc5b942d24c@ti.com>
 <BYAPR07MB47091C199971D677DE0FBB84DD7D0@BYAPR07MB4709.namprd07.prod.outlook.com>
 <e8616274-b0a8-6e59-b6fa-a68fed58bad7@ti.com>
 <BYAPR07MB470939C6F100336BAF6C41BFDD7D0@BYAPR07MB4709.namprd07.prod.outlook.com>
 <87va1dbokp.fsf@linux.intel.com>
 <70967a02-2f02-9ac8-e205-cdbfac5fbbae@ti.com>
 <BYAPR07MB4709F449E09AD352BA06CBA7DD4C0@BYAPR07MB4709.namprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR07MB4709F449E09AD352BA06CBA7DD4C0@BYAPR07MB4709.namprd07.prod.outlook.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Pawel Laszczak <pawell@cadence.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

On 07/03/2019 09:06, Pawel Laszczak wrote:
> Hi,
> 
>> Hi,
>>
>> On 21/02/2019 09:14, Felipe Balbi wrote:
>>>
>>> Hi,
>>>
>>> (please break your emails at 80-columns)
>>>
>>> Pawel Laszczak <pawell@cadence.com> writes:
>>>>>> One more thing. Workaround has implemented algorithm that decide for which
>>>>>> endpoint it should be enabled.  e.g for composite device MSC+NCM+ACM it
>>>>>> should work only for ACM OUT endpoint.
>>>>>>
>>>>>
>>>>> If ACM driver didn't queue the request for ACM OUT endpoint, why does the
>>>>> controller accept the data at all?
>>>>>
>>>>> I didn't understand why we need a workaround for this. It should be standard
>>>>> behaviour to NAK data if function driver didn't request for all endpoints.
>>>>
>>>> Yes, I agree with you. Controller shouldn’t accept such packet. As I know this
>>>> behavior will be fixed in RTL.
>>>>
>>>> But I assume that some older version of this controller are one the market,
>>>> and driver should work correct with them.
>>>>
>>>> In the feature this workaround can be limited only to selected controllers.
>>>>
>>>> Even now I assume that it can be enabled/disabled by module parameter.
>>>
>>> no module parameters, please. Use revision detection in runtime.
>>>
>>
>> This is about whether to enable or disable the workaround.
>> By default we don't want this workaround to be enabled.
>>
>> I'm debating whether we should have this workaround at all or not.
>>
>> It has the following problems.
>>
>> 1) It ACKs packets even when gadget end is not ready to accept the transfers.
>> 2) It stores these packets in a temporary buffer and then pushes them to the
>> gadget driver whenever the gadget driver is ready to process the data.
>> 3) Since the gadget driver can become ready at an indefinite time in the
>> future, it poses 2 problems:
>> a) It is sending stale data to the sink. (problematic at next protocol level?)
>> b) If this temporary buffer runs out we still hit the lock up issue.
>>
>> I think the right solution is to make sure that the gadget driver is always
>> reading all the enabled OUT endpoints *or* (keep the OUT endpoints disabled
>> if gadget driver is not ready to process OUT transfers).
> 
> If driver disable endpoint then it not answer for packets from host. 
> It will result that host reset the device, so I can't disable such endpoints. 
> 
> Other good solution is to change ACM driver in a way that it sends requests 
> to controller driver after enabling endpoint. The class driver could decide 

The ACM driver is doing exactly that. However, there is a large delay (depending
on when user opens the ttyACM) between endpoint enable and request queue and
that's the issue for this controller.

The endpoint is enabled whenever the host sends a SET_INTERFACE
[acm_set_alt()->gserial_connect()]
but the first request is queued only when user opens the ttyACM
[gs_open()->gs_start_io()->gs_start_rx()].

I'm don't think this sequence can be changed.
What happens if you defer gserial_connect() to be done at gs_open()?

> what should do with such not expected packets. It could delete all or e.g 
> keep only few last packets. 
> 
> This issue will be fixed in RTL but maybe driver should be compatible with previous 
> controller’s version.
> 
> By default, this workaround will be disabled or will depend on controller version.  
>>
> 
> Cheers,
> Pawel
> 

-- 
cheers,
-roger
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
