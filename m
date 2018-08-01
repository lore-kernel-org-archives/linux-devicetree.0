Return-Path: <SRS0=6n5Z=KQ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-ve1eur01on0131.outbound.protection.outlook.com ([104.47.1.131]:60606
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387716AbeHAMdX (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 1 Aug 2018 08:33:23 -0400
Subject: Re: [PATCH] spi: pl022: Add OF binding to disable DMA usage
References: <20180724112753.6020-1-alexander.sverdlin@nokia.com>
 <20180725170644.GE6315@sirena.org.uk>
 <150e4a91-e607-ee7c-20bc-9ed81019f1da@nokia.com>
 <20180801103949.GE5509@sirena.org.uk>
From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Message-ID: <a63a2c81-e624-9a7c-172d-c26159696fae@nokia.com>
Date: Wed, 1 Aug 2018 12:47:01 +0200
MIME-Version: 1.0
In-Reply-To: <20180801103949.GE5509@sirena.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Hello Mark,

On 01/08/18 12:39, Mark Brown wrote:
>>> this or if we shouldn't instead be looking at improving the driver to
>>> work better in systems with limited channels, for example by only
>>> claiming the channels when it's active (since it can fall back to PIO if
>>> it doesn't get them).  That might be too heavyweight though, possibly
>> yes, this is an option as well, but at the time we need to take this decision
>> the bus scan has not yet been performed. We could scan all the devices in
>> the DT and check if any of them requires DMA. This would mean, that
>> probe() of the PL022 driver will include similar code to the bus scan
>> that anyway will happen later just to take the decision on DMA usage.
>> But I'm fine with that. If this sounds better than new boolean DT binding,
>> I'll send another patch.
> I'm not 100% clear I follow what you mean by bus scan here but I *think*
> that sounds about right.  The channel request/release could be factored
> out into helper functions to minimize duplication.

Rob has an opinion that the driver should only claim the channels explicitly
specified in DT. This sounds about right, but this would be behavioral change.
What do you think?

-- 
Best regards,
Alexander Sverdlin.
