From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V3 3/3] regulator: dt: add policy to have property "regulator-compatible"
Date: Wed, 4 Jul 2012 12:33:33 +0530
Message-ID: <4FF3EAC5.8060209@nvidia.com>
References: <1340194987-23654-1-git-send-email-ldewangan@nvidia.com> <1340194987-23654-4-git-send-email-ldewangan@nvidia.com> <20120703192508.GG29030@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20120703192508.GG29030@opensource.wolfsonmicro.com>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: "lrg@ti.com" <lrg@ti.com>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "arnd@arndb.de" <arnd@arndb.de>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "lee.jones@linaro.org" <lee.jones@linaro.org>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 04 July 2012 12:55 AM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Wed, Jun 20, 2012 at 05:53:07PM +0530, Laxman Dewangan wrote:
>> Add the policy for regulator DT such that if device have multiple
>> regulator and its binding contains a child node that describes each
>> regulator then each regulator child node must have the property
>> "regulator-compatible" which matches with regulator name of their
>> hardware counterparts.
> I tried to apply this but both git and patch are upset with the patch at
> the line:
>
> diff --git a/Documentation/devicetree/bindings/regulator/tps6586x.txt b/Documentation/devicetree/bindings/regulator/tps6586x.txt
>
> for reasons I'm not immediately able to discern.  Can you please look
> into this?

I will locally try and will resend the patch if anything change.

