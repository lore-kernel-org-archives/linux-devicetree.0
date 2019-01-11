From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 2/2] EDAC: add ARM Cortex A15 L2 internal asynchronous
 error detection driver
Date: Fri, 11 Jan 2019 19:29:44 +0100
Message-ID: <20190111182944.GA24304@zn.tnic>
References: <AM6PR0702MB379953E130CC1E1DEE18B79BFA8A0@AM6PR0702MB3799.eurprd07.prod.outlook.com>
 <20190108104204.GA14243@zn.tnic>
 <e1458b95-6d17-21be-5dd8-ee7ff8d8b3fb@arm.com>
 <AM6PR0702MB37997C0FA1670DD1AF4C25C7FA8B0@AM6PR0702MB3799.eurprd07.prod.outlook.com>
 <bba99e8c-5e3e-98a4-d0c9-9734216e66d2@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <bba99e8c-5e3e-98a4-d0c9-9734216e66d2@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: James Morse <james.morse@arm.com>
Cc: "Wiebe, Wladislav (Nokia - DE/Ulm)" <wladislav.wiebe@nokia.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "davem@davemloft.net" <davem@davemloft.net>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>, "arnd@arndb.de" <arnd@arndb.de>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 11, 2019 at 06:11:04PM +0000, James Morse wrote:
> After I sent this it occurred to me the core can't know about errors in the L3
> cache (if there is one) or the memory-controller. These may have edac/ras
> abilities, but they are selected by the soc integrator, so could be per soc.
> This goes against Boris's no-per-functional-unit edac drivers. If we had to pick
> one out of that set, I think the memory-controller is most useful as DRAM is the
> most likely to be affected by errors.

We have similar "designs" already :)

Memory controller driver drivers/edac/fsl_ddr_edac.c gets linked together with:

mpc85xx_edac_mod-y                      := fsl_ddr_edac.o mpc85xx_edac.o
obj-$(CONFIG_EDAC_MPC85XX)              += mpc85xx_edac_mod.o

layerscape_edac_mod-y                   := fsl_ddr_edac.o layerscape_edac.o
obj-$(CONFIG_EDAC_LAYERSCAPE)           += layerscape_edac_mod.o

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
