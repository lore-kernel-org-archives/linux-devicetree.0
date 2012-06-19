From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V2 2/3] regulator: dt: add policy to have property "regulator-compatible"
Date: Tue, 19 Jun 2012 12:03:27 -0600
Message-ID: <4FE0BEEF.4060100@wwwdotorg.org>
References: <1340116099-17629-1-git-send-email-ldewangan@nvidia.com> <1340116099-17629-3-git-send-email-ldewangan@nvidia.com> <4FE0BA5C.9020405@wwwdotorg.org> <20120619175354.GO3974@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120619175354.GO3974@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, grant.likely@secretlab.ca, rob.herring@calxeda.com, arnd@arndb.de, linus.walleij@linaro.org, lrg@ti.com, lee.jones@linaro.org, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 06/19/2012 11:53 AM, Mark Brown wrote:
> On Tue, Jun 19, 2012 at 11:43:56AM -0600, Stephen Warren wrote:
>> On 06/19/2012 08:28 AM, Laxman Dewangan wrote:
> 
>>> +  The regulator is matched with the regulator-compatible.
> 
>> That last sentence should be true for any chip containing
>> multiple regulators and using the standard regulator binding. As
>> such, shouldn't that property be part of regulator.txt, rather
>> than each individual regulator chip's binding document?
> 
> No, there's more than one way to skin this cat.  We can either
> have something like this where there's a single DT node for all
> regulators on the device or we can have an MFD where the regulators
> all appear separately.  This is certainly what the former case
> should be using but it's less clear for the latter.

Well, I expected the language to be something along the lines of:

Optional properties:
...
- regulator-compatible: If a regulator chip contains multiple
regulators, and if the chip's binding contains a child node that
describes each regulator, then this property indicates which regulator
this child node is intended to configure.

... although I guess you'd need something to differentiate the
MFD-style vs. plain initdata-style mechanisms

So while as you say regulator.txt might not mandate that this be the
only method of handling multiple child nodes, shouldn't it document
this method as /a/ method in a central location to avoid all the
bindings that make use of this feature from duplicating the documentation?
