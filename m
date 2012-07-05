From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] regulator: tps65910: add support for input supply
Date: Thu, 05 Jul 2012 13:17:43 -0600
Message-ID: <4FF5E857.7020204@wwwdotorg.org>
References: <1341497004-23537-1-git-send-email-ldewangan@nvidia.com> <4FF5E66A.6010108@wwwdotorg.org> <20120705191129.GQ4111@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120705191129.GQ4111@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, grant.likely@secretlab.ca, rob.herring@calxeda.com, lrg@ti.com, swarren@nvidia.com, sameo@linux.intel.com, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On 07/05/2012 01:11 PM, Mark Brown wrote:
> On Thu, Jul 05, 2012 at 01:09:30PM -0600, Stephen Warren wrote:
>> On 07/05/2012 08:03 AM, Laxman Dewangan wrote:
> 
>>> +- vin-xxx-supply: Input voltage supply regulator.
> 
>> It'd be nice to name these simply xxx-supply; the "vin-" seems
>> redundant.
> 
> I suspect the pin is named vin_supply (ie, vin subscript supply) in
> the datasheet so this is idiomatic.

That's certainly true on some of the PMICs we use, but not this one
according to the datasheet I looked at.
