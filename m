Return-Path: <SRS0=CqSa=KK=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr40105.outbound.protection.outlook.com ([40.107.4.105]:4777
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728600AbeGZKVh (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 26 Jul 2018 06:21:37 -0400
Subject: Re: [PATCH] spi: pl022: Add OF binding to disable DMA usage
References: <20180724112753.6020-1-alexander.sverdlin@nokia.com>
 <20180725170644.GE6315@sirena.org.uk>
From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Message-ID: <150e4a91-e607-ee7c-20bc-9ed81019f1da@nokia.com>
Date: Thu, 26 Jul 2018 11:04:24 +0200
MIME-Version: 1.0
In-Reply-To: <20180725170644.GE6315@sirena.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Hello Mark,

On 25/07/18 19:06, Mark Brown wrote:
>> Legacy platform instantiation of PL022 had an ability to configure DMA
>> usage on controller level. If PL022 is being instantiated from DT it still
>> claims couple of DMA channels capable of DMA_SLAVE unconditionally even if
>> there are no DMA channels specified in the DT.
>> Depending on the slave devices' configuration this might be waste of DMA
>> channels or this might even claim some precious DMA channels if there are
>> only few of them in the system.
> Hrm.  This makes sense as an expedient solution for constrained systems
> however I'm wondering if it's a good idea to bake it into the ABI like
> this or if we shouldn't instead be looking at improving the driver to
> work better in systems with limited channels, for example by only
> claiming the channels when it's active (since it can fall back to PIO if
> it doesn't get them).  That might be too heavyweight though, possibly
> even impact performance for systems that do have abundant channels and
> could interfere with other devices that aren't so able to do the
> fallback stuff.

yes, this is an option as well, but at the time we need to take this decision
the bus scan has not yet been performed. We could scan all the devices in
the DT and check if any of them requires DMA. This would mean, that
probe() of the PL022 driver will include similar code to the bus scan
that anyway will happen later just to take the decision on DMA usage.

But I'm fine with that. If this sounds better than new boolean DT binding,
I'll send another patch.

-- 
Best regards,
Alexander Sverdlin.
