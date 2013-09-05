From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V4] regulator: palmas: add support for external control
 of rails
Date: Thu, 5 Sep 2013 20:11:01 +0530
Message-ID: <522897FD.2030509@nvidia.com>
References: <1377082096-22296-1-git-send-email-ldewangan@nvidia.com> <20130823095841.GG25263@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130823095841.GG25263@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: "sameo@linux.intel.com" <sameo@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "rob@landley.net" <rob@landley.net>, "lee.jones@linaro.org" <lee.jones@linaro.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "gg@slimlogic.co.uk" <gg@slimlogic.co.uk>, "kishon@ti.com" <kishon@ti.com>, "j-keerthy@ti.com" <j-keerthy@ti.com>, "ian.campbell@citrix.com" <ian.campbell@citrix.com>
List-Id: devicetree@vger.kernel.org

Hi Samuel,

On Friday 23 August 2013 03:28 PM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Wed, Aug 21, 2013 at 04:18:16PM +0530, Laxman Dewangan wrote:
>> Palmas rails like LDOs, SMPSs, REGENs, SYSENs can be enable and disable
>> by register programming through I2C communication as well as it can be
>> enable/disable with the external control input ENABLE1, ENABLE2 and NSLEEP.
> Acked-by: Mark Brown <broonie@linaro.org>
>

Can you please take this in your tree as dependent patch is already in 
your tree?

Thanks,
Laxman
