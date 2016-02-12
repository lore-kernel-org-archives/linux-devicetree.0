From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH 1/4] dma: mmp_pdma: Add the #requestors DT property documentation
Date: Fri, 12 Feb 2016 21:55:53 +0100
Message-ID: <87vb5t1wdi.fsf@belgarion.home>
References: <1455225798-9510-1-git-send-email-robert.jarzmik@free.fr>
	<1455225798-9510-2-git-send-email-robert.jarzmik@free.fr>
	<2622040.i4begfCjyO@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2622040.i4begfCjyO@wuerfel> (Arnd Bergmann's message of "Thu, 11
	Feb 2016 22:59:51 +0100")
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Vinod Koul <vinod.koul@intel.com>, Haojian Zhuang <haojian.zhuang@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Daniel Mack <daniel@zonque.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Arnd Bergmann <arnd@arndb.de> writes:

> On Thursday 11 February 2016 22:23:15 Robert Jarzmik wrote:
>> @@ -12,6 +12,8 @@ Required properties:
>>  Optional properties:
>>  - #dma-channels: Number of DMA channels supported by the controller (defaults
>>    to 32 when not specified)
>> +- #requestors: Number of DMA requestor lines supported by the controller
>> +  (defaults to 0 when not specified)
>>  
>> 
>
> Most other ones use "#dma-requests" as the property name here, I think it makes
> sense to stay with that convention.

Most certainly, for v2.

I'll await for a couple of days for other reviews, especially Vinod's one and
Haojian's ack for the .h change.

Cheers.

-- 
Robert
