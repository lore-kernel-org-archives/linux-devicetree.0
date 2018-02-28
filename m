From: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 0/3] Allwinner sunxi message box support
Date: Wed, 28 Feb 2018 11:18:50 -0600
Message-ID: <398d54c4-8bfc-c459-f7d4-fba4665d1250@sholland.org>
References: <20180228022714.30068-1-samuel@sholland.org>
 <20180228082459.o3juhfiml3logxwl@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180228082459.o3juhfiml3logxwl@flea>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>
List-Id: devicetree@vger.kernel.org

Hi,

On 02/28/18 02:24, Maxime Ripard wrote:
> On Tue, Feb 27, 2018 at 08:27:11PM -0600, Samuel Holland wrote:
>> This series adds support for the "hardware message box" in recent
>> Allwinner sunxi SoCs, used for communication with the ARISC management
>> processor (the platform's equivalent of the ARM SCP). The end goal is to
>> use the arm_scpi driver as a client, communicating with firmware running
>> on the ARISC CPU.
>>
>> This driver has been tested with the base arm_scpi driver (which sends
>> the SCPI_CMD_SCPI_CAPABILITIES command at probe time) and an in-progress
>> firmware application running on the ARISC CPU. Because no firmware for
>> the other end of the mailbox is complete at the moment, I have not
>> included changes to the SoC device trees.
> 
> This is not directly related to this series, but what is your end goal
> with regard to SCPI? What features do you expect to have there?

Current plans are to support in SCPI:
- SMP bringup and CPU hotplug (via PSCI in ATF)
- System reset and poweroff (via PSCI in ATF)
- System standby and suspend (via PSCI in ATF)
- DVFS for ARM CPUs
- Clock control for clocks in R_PRCM (e.g. R_CIR_RX)
- Thermal sensor reading

Other planned features of the firmware:
- System wakeup from poweroff (via GPIO or interrupt to firmware)
- System power/suspend LED control (connected to GPIO or PMIC GPIO)
- Polling of thermal sensor in firmware for thermal throttling

> I'm asking because last time we discussed this, SCPI wasn't able to abstract
> all the features the PMIC provides, and thus Linux needed to still be able to
> access it.

This should only be an issue for devices with AXP PMICs. Other devices with GPIO
or simple I²C regulator control, such as H3 and H5 boards, can have all
necessary features described with standard SCPI commands. SCPI provides for 127
vendor-defined "extended" commands, which could be used to build a full AXP PMIC
driver, or simply provide commands to read/write PMIC registers.

For the moment I'm not concerned with battery powered devices. So right now the
relevant boards either a) don't have a PMIC, or b) can have everything but DVFS
voltage hard-coded in the firmware.

> Thanks!
> Maxime

Regards,
Samuel
