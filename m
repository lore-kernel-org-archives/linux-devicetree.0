From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH] regulator: tps65910: add support for input supply
Date: Fri, 6 Jul 2012 12:15:12 +0530
Message-ID: <4FF68978.80703@nvidia.com>
References: <1341497004-23537-1-git-send-email-ldewangan@nvidia.com> <4FF5E66A.6010108@wwwdotorg.org> <20120705191129.GQ4111@opensource.wolfsonmicro.com> <4FF5E857.7020204@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4FF5E857.7020204@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "lrg@ti.com" <lrg@ti.com>, Stephen Warren <swarren@nvidia.com>, "sameo@linux.intel.com" <sameo@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Friday 06 July 2012 12:47 AM, Stephen Warren wrote:
> On 07/05/2012 01:11 PM, Mark Brown wrote:
>> On Thu, Jul 05, 2012 at 01:09:30PM -0600, Stephen Warren wrote:
>>> On 07/05/2012 08:03 AM, Laxman Dewangan wrote:
>>>> +- vin-xxx-supply: Input voltage supply regulator.
>>> It'd be nice to name these simply xxx-supply; the "vin-" seems
>>> redundant.
>> I suspect the pin is named vin_supply (ie, vin subscript supply) in
>> the datasheet so this is idiomatic.
> That's certainly true on some of the PMICs we use, but not this one
> according to the datasheet I looked at.
As per datasheet of tps65910 and tps65911, the prefix "vin" is not 
there. I took from the other patch discussion.
I will remove it and then send new patch.
