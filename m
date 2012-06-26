From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V3 2/3] regulator: dt: regulator match by regulator-compatible
Date: Tue, 26 Jun 2012 14:32:33 +0530
Message-ID: <4FE97AA9.7060805@nvidia.com>
References: <1340194987-23654-1-git-send-email-ldewangan@nvidia.com> <1340194987-23654-3-git-send-email-ldewangan@nvidia.com> <201206201924.09618.arnd@arndb.de> <20120620194609.GA4037@opensource.wolfsonmicro.com> <20120622061314.GA15627@avionic-0098.adnet.avionic-design.de> <20120622084228.GD4037@opensource.wolfsonmicro.com> <20120622085909.GA24121@avionic-0098.mockup.avionic-design.de> <20120622091238.GF4037@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20120622091238.GF4037@opensource.wolfsonmicro.com>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Thierry Reding <thierry.reding@avionic-design.de>, Arnd Bergmann <arnd@arndb.de>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "lee.jones@linaro.org" <lee.jones@linaro.org>, "lrg@ti.com" <lrg@ti.com>, Stephen Warren <swarren@wwwdotorg.org>
List-Id: devicetree@vger.kernel.org

Mark,

On Friday 22 June 2012 02:42 PM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Fri, Jun 22, 2012 at 10:59:09AM +0200, Thierry Reding wrote:
>> On Fri, Jun 22, 2012 at 09:42:29AM +0100, Mark Brown wrote:
>>> We're talking about consumers here, not the regulator driver finding its
>>> own regulators.
>> No we're not. of_regulator_match() isn't used by consumers but by
>> regulator drivers to parse the DT.
> This subthread has wandered off the topic of the original patch somewhat
> though.

I have not seen much oppose on this series as such and if you are OK on 
this then can we apply?
If it need to buy some ACK from different stack holder then we can ask them.


