Return-Path: <SRS0=A/SL=6T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8071EC47254
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 18:02:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5F630206B8
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 18:02:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730184AbgEESCR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 5 May 2020 14:02:17 -0400
Received: from foss.arm.com ([217.140.110.172]:46892 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729877AbgEESCR (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 5 May 2020 14:02:17 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB08631B;
        Tue,  5 May 2020 11:02:16 -0700 (PDT)
Received: from [192.168.2.22] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 846713F305;
        Tue,  5 May 2020 11:02:15 -0700 (PDT)
Subject: Re: [PATCH 03/16] dt-bindings: ehci/ohci: Allow iommus property
 (fixed subject line)
To:     Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20200505165212.76466-1-andre.przywara@arm.com>
 <20200505165212.76466-4-andre.przywara@arm.com>
 <eee99db5-4100-5064-97c0-abf54d2eec15@arm.com>
From:   =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>
Organization: ARM Ltd.
Message-ID: <2f7ee405-5950-c40e-80d6-43aef5c203bc@arm.com>
Date:   Tue, 5 May 2020 19:01:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <eee99db5-4100-5064-97c0-abf54d2eec15@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 05/05/2020 18:51, Robin Murphy wrote:
> On 2020-05-05 5:51 pm, Andre Przywara wrote:
>> Date: Mon, 4 May 2020 12:43:18 +0100
>> Subject: [PATCH 03/16] dt-bindings: ehci/ohci: Allow iommus property
>>
>> A OHCI/EHCI controller could be behind an IOMMU, in which case an iommus
>> property assigns the stream ID for this device.
> 
> Hmm, pretty much any DMA master device could be behind an IOMMU, and in
> a way that's basically entirely irrelevant to the device itself (and
> thus the consumer of its binding). Is there a better way we can handle
> this than repeating such "semi-standard" properties in individual
> bindings for ever more?

I was asking exactly the same question to Rob.
Indeed this is more of a parent bus property, if at all, and individual
drivers are not even aware of this.
But what is a device property is the number of device IDs that the
device uses and that would need to be translated into stream IDs.

So I think this is merely saying: just a single device ID.

And no, we couldn't come up with some more generic solution (yet). I
think a similar problem comes up with power-domains and other properties
handled by code in drivers/of.

Cheers,
Andre

> 
> Robin.
> 
>> Allow that property in the DT bindings to fix a complaint about the
>> Arm Juno
>> board's DTS file.
>>
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>> ---
>>   Documentation/devicetree/bindings/usb/generic-ehci.yaml | 3 +++
>>   Documentation/devicetree/bindings/usb/generic-ohci.yaml | 3 +++
>>   2 files changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
>> b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
>> index 10edd05872ea..20664c28bfb2 100644
>> --- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
>> +++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
>> @@ -74,6 +74,9 @@ properties:
>>     phy-names:
>>       const: usb
>>   +  iommus:
>> +    maxItems: 1
>> +
>>   required:
>>     - compatible
>>     - reg
>> diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
>> b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
>> index bcffec1f1341..ff6c04cde695 100644
>> --- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
>> +++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
>> @@ -73,6 +73,9 @@ properties:
>>     phy-names:
>>       const: usb
>>   +  iommus:
>> +    maxItems: 1
>> +
>>   required:
>>     - compatible
>>     - reg
>>

