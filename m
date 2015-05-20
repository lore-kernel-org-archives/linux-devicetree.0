From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 2/2] ARM: vf610: Add SoC bus support for Vybrid
Date: Wed, 20 May 2015 09:12:08 +0200
Message-ID: <9691074.oWRy1bscbz@wuerfel>
References: <cover.1432099651.git.maitysanchayan@gmail.com> <27733a88b73adb7000205e020bafdb6f7ebe1843.1432099651.git.maitysanchayan@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <27733a88b73adb7000205e020bafdb6f7ebe1843.1432099651.git.maitysanchayan@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Sanchayan Maity <maitysanchayan@gmail.com>, shawn.guo@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, stefan@agner.ch, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

On Wednesday 20 May 2015 11:06:52 Sanchayan Maity wrote:
> Implements SoC bus support to export SoC specific information. Read
> the unique SoC ID from the Vybrid On Chip One Time Programmable
> (OCOTP) controller, SoC specific information from the Miscellaneous
> System Control Module (MSCM), revision from the ROM revision register
> and expose it via the SoC bus infrastructure.
> 
> Sample Output:
> 
> root@vf:/sys/devices/soc0# cat soc_id
> df63c12a2e2161d4
> root@vf:/sys/devices/soc0# cat family
> Freescale Vybrid VF500
> root@vf:/sys/devices/soc0# cat revision
> 00000013
> root@vf:/sys/devices/soc0# cat machine
> Freescale Vybrid
> 

I would prefer to see this as a driver in drivers/soc that registers
to a platform device. Is there any DT node that would be a reasonable
device to bind to?

	Arnd
