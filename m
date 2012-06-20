From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V3 2/3] regulator: dt: regulator match by regulator-compatible
Date: Wed, 20 Jun 2012 13:51:27 -0600
Message-ID: <4FE229BF.4080109@wwwdotorg.org>
References: <1340194987-23654-1-git-send-email-ldewangan@nvidia.com> <1340194987-23654-3-git-send-email-ldewangan@nvidia.com> <201206201924.09618.arnd@arndb.de> <20120620194609.GA4037@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20120620194609.GA4037@opensource.wolfsonmicro.com>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Laxman Dewangan <ldewangan@nvidia.com>, lrg@ti.com, rob.herring@calxeda.com, grant.likely@secretlab.ca, linus.walleij@linaro.org, lee.jones@linaro.org, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 06/20/2012 01:46 PM, Mark Brown wrote:
> On Wed, Jun 20, 2012 at 07:24:09PM +0000, Arnd Bergmann wrote:
> 
>> 1. What is it that the new property can express that cannot
>> already be expressed by using the phandle.
> 
> As well as being able to refer to the object from within the device
> tree we also need to be able to tell what the object represents -
> we have a bunch of regulators in an array under a node for a PMIC
> and we want to know which regulator on the physical device each
> array entry corresponds to.  Previously this was being done by
> parsing the phandle name but that

s/phandle name/node name/ in that line I think.

At least, I don't think it's common to refer to nodes as phandles;
phandles are usually the values used at "client" sites to refer to
nodes IIUC.

> means we can't have more than one device with the same set of
> names.
> 
>> 2. Why is it called "regulator-compatible"? If it's similar to
>> the "compatible" property, don't you have to have a binding for
>> each possible string? If it's not related to the "compatible"
>> property, why is it named in a similar way?
> 
> Yes, there are bindings defined already for all the relevant
> devices. Elsewhere in the binding document you'll see a list of all
> the regulators on the PMIC and the names by which the device tree
> binding knows them.
