From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V2 3/3] ARM: dts: db8500: add node property "regulator-compatible"
 regulator node
Date: Wed, 20 Jun 2012 16:57:34 +0530
Message-ID: <4FE1B3A6.6090600@nvidia.com>
References: <1340116099-17629-1-git-send-email-ldewangan@nvidia.com> <1340116099-17629-4-git-send-email-ldewangan@nvidia.com> <4FE0A546.1010707@linaro.org> <4FE0B79D.4090201@wwwdotorg.org> <4FE1772A.2010806@linaro.org> <4FE17E24.8050702@nvidia.com> <4FE18371.2020602@linaro.org> <4FE1877C.4090103@nvidia.com> <4FE19036.1060008@linaro.org> <20120620100631.GE3978@opensource.wolfsonmicro.com> <4FE1B31C.6030100@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <4FE1B31C.6030100@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, Stephen Warren <swarren@wwwdotorg.org>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "arnd@arndb.de" <arnd@arndb.de>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "lrg@ti.com" <lrg@ti.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 20 June 2012 04:55 PM, Lee Jones wrote:
> On 20/06/12 11:06, Mark Brown wrote:
>> On Wed, Jun 20, 2012 at 09:56:22AM +0100, Lee Jones wrote:
>>
>>>> Are you OK to have the first patch with adding property
>> ...
>>
>>> Yes I'm fine with it.
>> So is that an ack?
> Sure why not. Although, Linus Walleij has the final say.
>
> Acked-by: Lee Jones<lee.jones@linaro.org>
>

I am going to send the new patch having "regulator-compatible" on each 
child node only for db8500.dtsi, and removing all other changes.



