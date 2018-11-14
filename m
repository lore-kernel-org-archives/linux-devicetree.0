From: Marcel Holtmann <marcel@holtmann.org>
Subject: Re: [Letux-kernel] [PATCH RFC] bluetooth: add uart h4 devices via
 serdev/devicetree
Date: Wed, 14 Nov 2018 08:51:17 +0100
Message-ID: <86A3A2E6-FC89-42FE-8410-9C8273EC9CF7@holtmann.org>
References: <20181110232034.17277-1-andreas@kemnade.info>
 <20181111024648.7rt7rlhaqihtqecv@earth.universe>
 <20181112215812.18ebca35@aktux>
 <2C74C837-A6D3-47C9-BE59-CCA594289B94@goldelico.com>
 <20181112222726.73m2oca7hankvcjs@earth.universe>
 <CABGGisxsdv+BTd5-HMzF8asEcWtL5F4CMzmkrBCwK=NibvqjLQ@mail.gmail.com>
 <20181113170128.0f59ef0e@kemnade.info>
Mime-Version: 1.0 (Mac OS X Mail 12.1 \(3445.101.1\))
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181113170128.0f59ef0e@kemnade.info>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Rob Herring <robh@kernel.org>, sebastian.reichel@collabora.com, hns@goldelico.com, devicetree@vger.kernel.org, Johan Hedberg <johan.hedberg@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-bluetooth@vger.kernel.org, letux-kernel@openphoenux.org
List-Id: devicetree@vger.kernel.org

Hi Andreas,

>>>>> Am 12.11.2018 um 21:59 schrieb Andreas Kemnade <andreas@kemnade.info>:
>>>>> On Sun, 11 Nov 2018 03:46:48 +0100
>>>>> Sebastian Reichel <sebastian.reichel@collabora.com> wrote:  
>>>>>> On Sun, Nov 11, 2018 at 12:20:34AM +0100, Andreas Kemnade wrote:  
>>>>>>> This is a first try to be able to use h4 devices specified in
>>>>>>> the devicetree, so you do not need to call hciattach and
>>>>>>> it can be automatically probed.
>>>>>>> 
>>>>>>> Of course, proper devicetree bindings documentation is
>>>>>>> missing. And also you would extend that by regulator/
>>>>>>> enable gpio settings.
>>>>>>> 
>>>>>>> But before proceeding further it should be checked if the
>>>>>>> general way of doing things is right.
>>>>>>> 
>>>>>>> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
>>>>>>> ---  
>>>>>> 
>>>>>> Patch looks good to me, just one note
>>>>>> 
>>>>> I found one thing myself:
>>>>> Shouldn't we have a generic compatible string like "generic-h4".
>>>>> ehci-platform.c has for example:
>>>>>       { .compatible = "generic-ehci", },  
>>>> 
>>>> There might be differences in h4 compatible devices (e.g. default
>>>> baud rate) so that I would not bet there a "generic-h4" suffices
>>>> in the long run.  
>> 
>> It will not because that doesn't define clocks, resets, gpios,
>> supplies, etc. and the interactions of all those.
>> 
> well, we need a simple supply being on when the device is on.
> Nothing more.
> 
>>> My suggestion is to use this in DT:
>>> 
>>> compatible = "wi2wi,w2cbw003-bluetooth", "<something generic>";
>>> 
> That would be my slight preference here.
> 
>>> The driver can start with supporting just the generic compatible
>>> string. If somebody finds some incompatible differences, the driver
>>> can add a custom handler for the wi2wi chip without breaking DT
>>> ABI.  
>> 
>> Any idea how many H4 devices there are? Somehow I doubt there are that
>> many to be unmanageable.
>> 
> Well, many devices are h4 devices with some more or less important
> vendor-specific commands. Well, "hciattach any" uses simple h4 protocol.
> 
> those firmware download commands and they have their own drivers.
> Most devices I had used bluetooth uart from the command line with, were
> simple enough. The other question is whether those devices will run a
> modern kernel.
> 
> No strong opinion here. 

doing the firmware load from user space via some magic tool is no longer going to work smoothly. It will be actually almost impossible with serdev. However I did post btuart.c driver which is pretty much just plain H:4. You would still somehow define the default baudraute since just picking 115200 is not always going to work.

Btw. I see nothing standing in the way of merging btuart.c driver and then go from there. Either I dig this out and submit or someone else does.

Regards

Marcel
