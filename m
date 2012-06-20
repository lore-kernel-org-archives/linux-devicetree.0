From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V3 2/3] regulator: dt: regulator match by regulator-compatible
Date: Wed, 20 Jun 2012 20:40:52 +0000
Message-ID: <201206202040.52291.arnd@arndb.de>
References: <1340194987-23654-1-git-send-email-ldewangan@nvidia.com> <201206201924.09618.arnd@arndb.de> <20120620194609.GA4037@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20120620194609.GA4037@opensource.wolfsonmicro.com>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, lrg@ti.com, rob.herring@calxeda.com, grant.likely@secretlab.ca, linus.walleij@linaro.org, lee.jones@linaro.org, swarren@wwwdotorg.org, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wednesday 20 June 2012, Mark Brown wrote:
> On Wed, Jun 20, 2012 at 07:24:09PM +0000, Arnd Bergmann wrote:
> 
> > 1. What is it that the new property can express that cannot already
> > be expressed by using the phandle.
> 
> As well as being able to refer to the object from within the device tree
> we also need to be able to tell what the object represents - we have a
> bunch of regulators in an array under a node for a PMIC and we want to
> know which regulator on the physical device each array entry corresponds
> to.  Previously this was being done by parsing the phandle name but that
> means we can't have more than one device with the same set of names.

I see.

But that sounds more like what the "reg" property does than what
the "compatible" property does for other devices. In other words, you
want to know which instance you are describing, not what kind of
object it is.

For a "compatible" property, I would expect two objects that have
the same register-level interface but are responsible for different
physical objects to have the same "compatible" values, but here
you specifically need distinct "regulator-compatible" values.
 
> > 2. Why is it called "regulator-compatible"? If it's similar to the
> > "compatible" property, don't you have to have a binding for each
> > possible string? If it's not related to the "compatible" property,
> > why is it named in a similar way?
> 
> Yes, there are bindings defined already for all the relevant devices.
> Elsewhere in the binding document you'll see a list of all the
> regulators on the PMIC and the names by which the device tree binding
> knows them.

Ah, so we just change the way how the binding refers to those names,
rather than the individual strings.

It makes much more sense now, so please let's make sure that explanation
ends up in the changelog.

I still have two more questions: 

* In case of tps65910, the individual regulators are all numbered, so
the driver can find them by their "reg" property. Should we still
mandate the use of the "regulator-compatible" property? It sounds
to me that we could better make it an optional property in those
cases.

* What is the difference between "regulator-name" and
"regulator-compatible"? Those are the same most of the time
in the patches, so can't we just make sure they are always the
same, and drop the confusingly named "regulator-compatible" one?

	Arnd
