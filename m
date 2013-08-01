Return-Path: <devicetree-owner@vger.kernel.org>
Received: from hqemgate14.nvidia.com ([216.228.121.143]:3589 "EHLO
	hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755700Ab3HAPUj (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Thu, 1 Aug 2013 11:20:39 -0400
Message-ID: <51FA7FB9.8000209@nvidia.com>
Date: Thu, 1 Aug 2013 21:03:13 +0530
From: Laxman Dewangan <ldewangan@nvidia.com>
MIME-Version: 1.0
Subject: Re: [PATCH V2] drivers/rtc/rtc-palmas.c: support for backup battery
 charging
References: <1375367471-29908-1-git-send-email-ldewangan@nvidia.com> <20130801150941.GA11286@radagast>
In-Reply-To: <20130801150941.GA11286@radagast>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: "balbi@ti.com" <balbi@ti.com>
Cc: "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "rob@landley.net" <rob@landley.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rtc-linux@googlegroups.com" <rtc-linux@googlegroups.com>, "gg@slimlogic.co.uk" <gg@slimlogic.co.uk>, "kishon@ti.com" <kishon@ti.com>, Stephen Warren <swarren@nvidia.com>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "Mark.Rutland@arm.com" <Mark.Rutland@arm.com>, "ian.campbell@citrix.com" <ian.campbell@citrix.com>, "broonie@kernel.org" <broonie@kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Thursday 01 August 2013 08:39 PM, Felipe Balbi wrote:
> * PGP Signed by an unknown key
>
> Hi,
>
> On Thu, Aug 01, 2013 at 08:01:11PM +0530, Laxman Dewangan wrote:
> I wonder if this should be exposed via power_supply class, although it's
> not really a power supply. So perhaps not needed :-s

Yes, there is another charger module on the device which actually need 
the driver through power supply. Charger submodule used for charging the 
main battery through USB VBUS.




>
> looks good though (can't test as I don't have any boards available right
> now):
>
> Reviewed-by: Felipe Balbi <balbi@ti.com>

Thanks for review.
>

