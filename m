From: =?iso-8859-1?Q?Patrick_Br=FCnn?= <P.Bruenn@beckhoff.com>
Subject: RE: [PATCH] ARM: dts: imx: add CX9020 Embedded PC device tree
Date: Thu, 13 Jul 2017 03:00:35 +0000
Message-ID: <3BB206AB2B1BD448954845CE6FF69A8E0182B4C0ED@nt-mail04>
References: <20170712090408.12212-1-linux-kernel-dev@beckhoff.com>
 <20170712144239.GC2557@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170712144239.GC2557@lunn.ch>
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
To: Andrew Lunn <andrew@lunn.ch>, linux-kernel-dev <linux-kernel-dev@beckhoff.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "fabio.estevam@nxp.com" <fabio.estevam@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

>From: Andrew Lunn [mailto:andrew@lunn.ch]
>Sent: Mittwoch, 12. Juli 2017 16:43
>
>On Wed, Jul 12, 2017 at 11:04:08AM +0200, linux-kernel-dev@beckhoff.com
>wrote:
>> From: Patrick Br=FCnn <p.bruenn@beckhoff.com>
>>
>> The CX9020 differs from i.MX53 Quick Start Board by:
>> - use uart2 instead of uart1
>> - DVI-D connector instead of VGA
>> - no audio
>> - CCAT FPGA connected to emi
>> - enable rtc
>>
>> Signed-off-by: Patrick Br=FCnn <p.bruenn@beckhoff.com>
>> ---
>>  arch/arm/boot/dts/Makefile         |   1 +
>>  arch/arm/boot/dts/imx53-cx9020.dts | 377
>+++++++++++++++++++++++++++++++++++++
>>  2 files changed, 378 insertions(+)
>>  create mode 100644 arch/arm/boot/dts/imx53-cx9020.dts
>>
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index 9c5e1d944d1c..ea60698f9783 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -340,6 +340,7 @@ dtb-$(CONFIG_SOC_IMX53) +=3D \
>>      imx53-ard.dtb \
>>      imx53-m53evk.dtb \
>>      imx53-mba53.dtb \
>> +    imx53-cx9020.dtb \
>>      imx53-qsb.dtb \
>>      imx53-qsrb.dtb \
>>      imx53-smd.dtb \
>
>Hi Patrick
>
>It appears this list is in alphabetic order...
>
Ops, thanks for the hint, will fix this with the next version.
Patrick

Beckhoff Automation GmbH & Co. KG | Managing Director: Dipl. Phys. Hans Bec=
khoff
Registered office: Verl, Germany | Register court: Guetersloh HRA 7075
