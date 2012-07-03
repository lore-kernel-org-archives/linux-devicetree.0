From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 1/2] regulator: fixed: use devm_* for gpio request
Date: Tue, 3 Jul 2012 14:18:23 +0530
Message-ID: <4FF2B1D7.30205@nvidia.com>
References: <1341223645-7817-1-git-send-email-ldewangan@nvidia.com> <20120702172916.GL25093@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120702172916.GL25093@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: "lrg@ti.com" <lrg@ti.com>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "rob@landley.net" <rob@landley.net>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Monday 02 July 2012 10:59 PM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Mon, Jul 02, 2012 at 03:37:24PM +0530, Laxman Dewangan wrote:
>> Use devm_* version of gpio APIs gpio_request_one() for
>> requesting gpios.
>> This avoid extra code for freeing gpios.
> This can't be applied yet since the export for the devm version hasn't
> been applied so it won't build and also conflicts with the factoring out
> of the GPIO code to the core.
>
Oops, then lets ignore the 1/2 for now. If require, we will revisit later.

But what about 2/2? Does it look good? I can send that as separate patch 
if it is fine.
