From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 0/2] Add efuse driver for Ingenic JZ4780 SoC
Date: Tue, 2 Jan 2018 12:01:58 +0000
Message-ID: <828981e5-c23c-8dc4-55e4-23b65b33908b@linaro.org>
References: <20171228212954.2922-1-malat@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171228212954.2922-1-malat@debian.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mathieu Malaterre <malat@debian.org>, Marcin Nowakowski <marcin.nowakowski@mips.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Zubair.Kakakhel@mips.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org



On 28/12/17 21:29, Mathieu Malaterre wrote:
> This patchset bring support for read-only access to the JZ4780 efuse as found
> on MIPS Creator CI20.
> 
> To keep the driver as simple as possible, it was not possible to re-use most of
> the nvmem core functionalities. This driver is not compatible with the original
Can you explain a bit more on not able to re-use nvmem core?

If you are referring to adding nvmem cell entires in sysfs, This should 
probably go in to nvmem core, rather that in individual providers.
This is one of the feature my todo list, will try to come up with some 
thing soon.

thanks,
srini

> efuse driver as found in the custom linux kernel from upstream (1), in
> particular it does not expose to the users neither:
> `/sys/devices/platform/*/chip_id` nor `/sys/devices/platform/*/user_id`.
> 

> The goal of this driver is to provide access to the MAC address to the dm9000
> driver.
> 
> (1) https://github.com/ZubairLK/CI20_linux/commit/6efd4ffca7dcfaff0794ab60cd6922ce96c60419
> 
> Changes in v2:
> Properly handle offset and byte value from the main entry point.
> Also add a commit message in patch #2.
> 
> Mathieu Malaterre (1):
>    dts: Probe efuse for CI20
> 
> PrasannaKumar Muralidharan (1):
>    nvmem: add driver for JZ4780 efuse
> 
>   .../ABI/testing/sysfs-driver-jz4780-efuse          |  16 ++
>   .../bindings/nvmem/ingenic,jz4780-efuse.txt        |  17 ++
>   MAINTAINERS                                        |   5 +
>   arch/mips/boot/dts/ingenic/jz4780.dtsi             |  40 ++-
>   arch/mips/configs/ci20_defconfig                   |   2 +
>   drivers/nvmem/Kconfig                              |  10 +
>   drivers/nvmem/Makefile                             |   2 +
>   drivers/nvmem/jz4780-efuse.c                       | 305 +++++++++++++++++++++
>   8 files changed, 385 insertions(+), 12 deletions(-)
>   create mode 100644 Documentation/ABI/testing/sysfs-driver-jz4780-efuse
>   create mode 100644 Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.txt
>   create mode 100644 drivers/nvmem/jz4780-efuse.c
> 
