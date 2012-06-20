From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH V2 3/3] ARM: dts: db8500: add node property "regulator-compatible"
 regulator node
Date: Wed, 20 Jun 2012 12:25:16 +0100
Message-ID: <4FE1B31C.6030100@linaro.org>
References: <1340116099-17629-1-git-send-email-ldewangan@nvidia.com> <1340116099-17629-4-git-send-email-ldewangan@nvidia.com> <4FE0A546.1010707@linaro.org> <4FE0B79D.4090201@wwwdotorg.org> <4FE1772A.2010806@linaro.org> <4FE17E24.8050702@nvidia.com> <4FE18371.2020602@linaro.org> <4FE1877C.4090103@nvidia.com> <4FE19036.1060008@linaro.org> <20120620100631.GE3978@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120620100631.GE3978@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "arnd@arndb.de" <arnd@arndb.de>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "lrg@ti.com" <lrg@ti.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 20/06/12 11:06, Mark Brown wrote:
> On Wed, Jun 20, 2012 at 09:56:22AM +0100, Lee Jones wrote:
>
>>> Are you OK to have the first patch with adding property
>
> ...
>
>> Yes I'm fine with it.
>
> So is that an ack?

Sure why not. Although, Linus Walleij has the final say.

Acked-by: Lee Jones <lee.jones@linaro.org>

>> It's only the unnecessary reg and *-size properties I'm opposed to.
>
> My understanding is that they're required by DT policies in the same =
way
> that some of the other verbiage is.

Well I haven't put them in the DB8500 Device Tree if they're not useful=
=20
and nothing untoward has occurred.

--=20
Lee Jones
Linaro ST-Ericsson Landing Team Lead
M: +44 77 88 633 515
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
