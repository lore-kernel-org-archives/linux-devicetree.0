From: Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [PATCH 2/3] ARM: dts: imx31: add device tree description of basic
 controllers
Date: Thu, 5 Jul 2018 22:09:27 +0300
Message-ID: <430434fe-da1d-ffd9-0b54-a0c7d63c6284@mleia.com>
References: <20180703192934.6080-1-vz@mleia.com>
 <20180703192934.6080-3-vz@mleia.com>
 <CAOMZO5AW6QryKAjcG_kE011G1anLD=-EaJFhAaWzaqbf3aKNUQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOMZO5AW6QryKAjcG_kE011G1anLD=-EaJFhAaWzaqbf3aKNUQ@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fabio Estevam <festevam@gmail.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Fabio,

On 07/05/2018 04:01 AM, Fabio Estevam wrote:
> On Tue, Jul 3, 2018 at 4:29 PM, Vladimir Zapolskiy <vz@mleia.com> wrote:
>> The change adds a number of basic peripherals found on i.MX31 SoC:
>> * GPIO controllers,
>> * I2C master controllers,
>> * SPI master controllers,
>> * ATA controller,
>> * SDHC controllers,
>> * RTC, watchdog and PWM contollers,
>> * SDMA,
>> * IRAM,
>> * NAND and WEIM controllers on EMI.
>>
>> The added controller devices were tested on Freescale i.MX31 powered
>> LogicPD Lite SoM and baseboard.
>>
>> DMA functionality was tested on SDHC and SPI controllers so far,
>> thus dmas properties are added to those device nodes only.
>>
>> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
> 
> Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>

thank you for review, please note that I've just sent v2 with a couple
of minor fixes as a reply to v1 2/3, I hope that I didn't introduce
a mess to the series.

And again I hope that a number of missing SoC specific compatibles
could be added to the documentation later on, at the moment generic
variants are good enough to run the corresponding drivers.

--
Best wishes,
Vladimir
