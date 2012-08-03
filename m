From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH] regulator: tps6586x: add support for SYS rail
Date: Fri, 3 Aug 2012 11:39:49 +0530
Message-ID: <501B6B2D.90508@nvidia.com>
References: <1343906193-8309-1-git-send-email-ldewangan@nvidia.com> <501AAE55.3080504@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <501AAE55.3080504@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: "broonie@opensource.wolfsonmicro.com" <broonie@opensource.wolfsonmicro.com>, "sameo@linux.intel.com" <sameo@linux.intel.com>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Stephen Warren <swarren@nvidia.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Thursday 02 August 2012 10:14 PM, Stephen Warren wrote:
> On 08/02/2012 05:16 AM, Laxman Dewangan wrote:
> I believe you need to following patch on top of this, or the sys-supply
> property is not used:

yes, it was missed. I tested with this and it worked fine. Thanks for 
pointing this.

>
> BTW, this patch touches both the regulator and MFD trees. I'm not sure
> who will apply it. I think it relies on the patch to this driver Mark
> recently applied in the regulator tree (for 3.7 I think) doesn't it, at
> least for context?

I looked Mark's regulator for-next and all changes from MFD from Samuel 
is available so I think it will not be issue to apply.
