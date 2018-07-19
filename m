Return-Path: <SRS0=Hazi=KD=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-ve1eur01on0098.outbound.protection.outlook.com ([104.47.1.98]:51161
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730049AbeGSMn5 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 19 Jul 2018 08:43:57 -0400
Subject: Re: [PATCH V2 2/2] Documentation: dt-bindings: add adi,adgs1408 doc
References: <20180717134416.5865-1-mircea.caprioru@analog.com>
 <e33b328f-8cd7-6bd5-bd01-9033e0b91cd3@axentia.se>
 <afe3957216c82e7d7514d52530e3ae87f987924f.camel@analog.com>
 <95c37d42-6172-1c17-5843-8aaa919941d8@axentia.se>
 <e29eef87fae74581785eb653ae9424712fa1a824.camel@analog.com>
From: Peter Rosin <peda@axentia.se>
Message-ID: <366d56f6-0053-3ca4-6985-4ef7557d42a1@axentia.se>
Date: Thu, 19 Jul 2018 14:00:57 +0200
MIME-Version: 1.0
In-Reply-To: <e29eef87fae74581785eb653ae9424712fa1a824.camel@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: "Caprioru, Mircea" <Mircea.Caprioru@analog.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc: "davem@davemloft.net" <davem@davemloft.net>, "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>, "rdunlap@infradead.org" <rdunlap@infradead.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 2018-07-19 13:05, Caprioru, Mircea wrote:
> On Thu, 2018-07-19 at 11:09 +0200, Peter Rosin wrote:
>> On 2018-07-19 09:26, Caprioru, Mircea wrote:
>>> On Wed, 2018-07-18 at 15:09 +0200, Peter Rosin wrote:
>>>> On 2018-07-17 15:44, Mircea Caprioru wrote:
>>>>> Adding dt-bindings documentation for adgs1408/1409 multiplexer.
>>>>> The
>>>>> bindings follow the standard SPI and mux bindings and do not
>>>>> require any
>>>>> additional custom properties.
>>>>
>>>> However, both chips have general purpose output pins. I think it
>>>> is
>>>> customary to document the bindings for such things while at it?
>>>
>>> This functionality is not yet implemented in the driver. It does
>>> not
>>> make sense to document it just yet. Will add it when the driver
>>> implements it.
>>
>> I disagree, and I also think 2/2 should come before 1/2, just to show
>> that things are done in the proper order. That makes it clear that
>> the
>> driver does not implement random (or not yet existing) device-tree
>> bindings.
>>
>> The bindings should not document the driver, they should document
>> the hardware/interfaces.
> 
> I was thinking of adding a custom property adi,gpos = <0 0 0 0>; to
> configure the general purpose outputs but i am open to any sugestions.
> What do you think of this approach ?

No need for custom properties... Look at how e.g. adi,adg792a.txt
handles the GPOs that are present on adg792g.

Cheers,
Peter
