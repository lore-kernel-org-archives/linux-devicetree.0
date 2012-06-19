From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 1/2] regulator: support for regulator match by regulator-compatible
Date: Tue, 19 Jun 2012 17:36:09 +0530
Message-ID: <4FE06B31.3050306@nvidia.com>
References: <1340085087-6608-1-git-send-email-ldewangan@nvidia.com> <1340085087-6608-2-git-send-email-ldewangan@nvidia.com> <20120619093211.GB3974@opensource.wolfsonmicro.com> <4FE04788.5040008@nvidia.com> <20120619104254.GD3974@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20120619104254.GD3974@opensource.wolfsonmicro.com>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: "lrg@ti.com" <lrg@ti.com>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "sameo@linux.intel.com" <sameo@linux.intel.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 19 June 2012 04:13 PM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Tue, Jun 19, 2012 at 03:04:00PM +0530, Laxman Dewangan wrote:
>
>> Agree. Currently following regulators are using this (based on grep)
>> mfd/tps6586x.c
>> regulator/ab8500.c
>> regulator/db8500-prcmu.c
>> and regulator/tps65910.
>
> I've no concerns with the interface or the code itself other than the
> usability issue with partial deployment so if you could do the updates
> for the other drivers that'd be great.  I'll hold off on applying this
> until we've got everything else updated.

Mark,
Just thinking on optimizing the changes require, we can do it in 3 
patches only:
- In place of adding new api of_regulator_match_by_compatible(), we can 
modify the existing of_regulator_match() itself  to look for 
regulator-compatible for matching. This can be done in first patch.
- Need not to change the .c files, here just change the documentation of 
these regulator dt binding. All can be done in second patch.
- Change the dts file to have this policy and seeing only on 
arm/boot/dts/db8500.dtsi for ab8500 and db8500-prcmu. So it will be 
third patch .

We will not need any change on above c files as the api is not going to 
change.

Require your opinion.






