From: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v7 0/3] nvmem: upstream snvs_lpgpr driver
Date: Wed, 26 Jul 2017 10:01:37 +0100
Message-ID: <e0abdef9-91af-8c7b-957c-b55be48ca7b4@linaro.org>
References: <20170620070932.10353-1-o.rempel@pengutronix.de>
 <07198c02-ac87-ec1f-accd-75ad6fd0ac30@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <07198c02-ac87-ec1f-accd-75ad6fd0ac30-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Oleksij Rempel <ore-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Oleksij Rempel <o.rempel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Guy Shapiro <guy.shapiro-2HKgp+mgmS5l57MIdRCFDg@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 18/07/17 05:52, Oleksij Rempel wrote:
> Hallo all,
> 
> Here Gentle Ping to the Old King ;)
> 
> DT is already ACKed.

Thanks for patience, As this is a new driver it will be queued for 4.14 
just before 4.13-rc5 is released.

thanks,
srini
> 
> On 20.06.2017 09:09, Oleksij Rempel wrote:
>> changes v7:
>>  - split imx6ul patch and squash it with with main patches.
>>  - spell fixes in the binding documentation
>>  - return regmap_bulk_read directly.
>>
>> changes v6:
>>  - check if device is writable by reading GPR_SL and GPR_HL bits
>>  - use regmap_bulk_* functions instead of while() { regmap_read/write }
>>  - add patch for imx6ul
>>
>> changes v5:
>>  - use dcfg->offset instead of priv->offset.
>>
>> changes v4:
>>  - change dependencies in Kconfig
>>  - remove unused includes and order them alphabetically
>>  - set MODULE_LICENSE = GPL v2
>>  - remove unused int err variable
>>
>> changes v3:
>>  - remove regmap and offset properties.
>>
>> changes v2:
>>  - correct typos: Registe, parrent...
>>
>> Oleksij Rempel (3):
>>   nvmem: dt: document SNVS LPGPR binding
>>   nvmem: add snvs_lpgpr driver
>>   ARM: dts: imx6qdl.dtsi/imx6ul.dtsi: add "fsl,imx6q-snvs-lpgpr" node
>>
>>  .../devicetree/bindings/nvmem/snvs-lpgpr.txt       |  20 +++
>>  arch/arm/boot/dts/imx6qdl.dtsi                     |   4 +
>>  arch/arm/boot/dts/imx6ul.dtsi                      |   4 +
>>  drivers/nvmem/Kconfig                              |  10 ++
>>  drivers/nvmem/Makefile                             |   2 +
>>  drivers/nvmem/snvs_lpgpr.c                         | 155 
>> +++++++++++++++++++++
>>  6 files changed, 195 insertions(+)
>>  create mode 100644 
>> Documentation/devicetree/bindings/nvmem/snvs-lpgpr.txt
>>  create mode 100644 drivers/nvmem/snvs_lpgpr.c
>>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
