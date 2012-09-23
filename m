From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] regulator: deprecate regulator-compatible DT property
Date: Sat, 22 Sep 2012 19:40:15 -0600
Message-ID: <505E687F.2060404@wwwdotorg.org>
References: <1348178697-26314-1-git-send-email-swarren@wwwdotorg.org> <20120922155620.GR4495@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120922155620.GR4495@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Liam Girdwood <lrg@ti.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, Laxman Dewangan <ldewangan@nvidia.com>, AnilKumar Ch <anilkumar@ti.com>, Stephen Warren <swarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

On 09/22/2012 09:56 AM, Mark Brown wrote:
> On Thu, Sep 20, 2012 at 04:04:57PM -0600, Stephen Warren wrote:
> 
>> Mark, if this gets into 3.7, I can fix up all the Tegra .dts files during 3.8.
> 
> I don't know which branch you generated this against but it doesn't
> apply to any of the obvious branches in my regulator tree.  There's a
> modify/delete conflict in
> 
>    Documentation/devicetree/bindings/regulator/max8907.txt
> 
> which I don't seem to have.

Oh right, that file would only be in the MFD tree. I assume that given
you attempted to apply it, there are no conceptual issues applying it
once I split it up into patches for each subsystem?
