From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH v5 3/4] drivers: firmware: xilinx: Add sysfs interface
Date: Thu, 1 Mar 2018 14:44:11 +0000
Message-ID: <573acd04-85c4-829d-a0d6-36b3958ac1ec@arm.com>
References: <1519154467-2896-1-git-send-email-jollys@xilinx.com>
 <1519154467-2896-4-git-send-email-jollys@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1519154467-2896-4-git-send-email-jollys@xilinx.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jolly Shah <jolly.shah@xilinx.com>
Cc: ard.biesheuvel@linaro.org, mingo@kernel.org, gregkh@linuxfoundation.org, matt@codeblueprint.co.uk, hkallweit1@gmail.com, keescook@chromium.org, dmitry.torokhov@gmail.com, michal.simek@xilinx.com, robh+dt@kernel.org, mark.rutland@arm.com, Sudeep Holla <sudeep.holla@arm.com>, rajanv@xilinx.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jolly Shah <jollys@xilinx.com>
List-Id: devicetree@vger.kernel.org



On 20/02/18 19:21, Jolly Shah wrote:
> Add Firmware-ggs sysfs interface which provides read/write
> interface to global storage registers.
> 
> Signed-off-by: Jolly Shah <jollys@xilinx.com>
> Signed-off-by: Rajan Vaja <rajanv@xilinx.com>
> ---
>  .../ABI/stable/sysfs-driver-zynqmp-firmware        |  50 ++++
>  drivers/firmware/xilinx/zynqmp/Makefile            |   2 +-
>  drivers/firmware/xilinx/zynqmp/firmware-ggs.c      | 297 +++++++++++++++++++++
>  drivers/firmware/xilinx/zynqmp/firmware.c          |  13 +
>  include/linux/firmware/xilinx/zynqmp/firmware.h    |   2 +
>  5 files changed, 363 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/ABI/stable/sysfs-driver-zynqmp-firmware
>  create mode 100644 drivers/firmware/xilinx/zynqmp/firmware-ggs.c
> 
> diff --git a/Documentation/ABI/stable/sysfs-driver-zynqmp-firmware b/Documentation/ABI/stable/sysfs-driver-zynqmp-firmware
> new file mode 100644
> index 0000000..b04727a
> --- /dev/null
> +++ b/Documentation/ABI/stable/sysfs-driver-zynqmp-firmware
> @@ -0,0 +1,50 @@
> +What:		/sys/devices/platform/zynqmp-firmware/ggs> +Date:		January 2018
> +KernelVersion:	4.15.0
> +Contact:	"Jolly Shah" <jollys@xilinx.com>
> +Description:
> +		Read/Write PMU global general storage register value,
> +		GLOBAL_GEN_STORAGE{0:3}.
> +		Global general storage register that can be used
> +		by system to pass information between masters.
> +

What kind of information ? Is there any semantics for that ?
Why does EEMI lack APIs for that if it's critical, giving access to
such information to userspace may not be good idea.

> +		The register is reset during system or power-on
> +		resets. Three registers are used by the FSBL and
> +		other Xilinx software products: GLOBAL_GEN_STORAGE{4:6}.
> +

FSBL ?

For what is it used ?

> +		Usage:
> +		# cat /sys/.../zynqmp-firmware/ggs0
> +		# echo <mask> <value> > /sys/.../zynqmp-firmware/ggs0
> +
> +		Example:
> +		# cat /sys/.../zynqmp-firmware/ggs0
> +		# echo 0xFFFFFFFF 0x1234ABCD > /sys/.../zynqmp-firmware/ggs0
> +
> +Users:		Xilinx
> +
> +What:		/sys/devices/platform/zynqmp-firmware/pggs*
> +Date:		January 2018
> +KernelVersion:	4.15.0
> +Contact:	"Jolly Shah" <jollys@xilinx.com>
> +Description:
> +		Read/Write PMU persistent global general storage register
> +		value, PERS_GLOB_GEN_STORAGE{0:3}.
> +		Persistent global general storage register that
> +		can be used by system to pass information between
> +		masters.
> +

Ditto

> +		This register is only reset by the power-on reset
> +		and maintains its value through a system reset.
> +		Four registers are used by the FSBL and other Xilinx
> +		software products: PERS_GLOB_GEN_STORAGE{4:7}.
> +		Register is reset only by a POR reset.
> +

Ditto

-- 
Regards,
Sudeep
