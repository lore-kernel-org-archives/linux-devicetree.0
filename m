From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 2/4] drivers: firmware: xilinx: Add ZynqMP firmware
 driver
Date: Tue, 23 Jan 2018 09:38:23 +0100
Message-ID: <20180123083823.GB21463@kroah.com>
References: <1516220434-22204-1-git-send-email-jollys@xilinx.com>
 <1516220434-22204-3-git-send-email-jollys@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1516220434-22204-3-git-send-email-jollys@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jolly Shah <jolly.shah@xilinx.com>
Cc: ard.biesheuvel@linaro.org, mingo@kernel.org, matt@codeblueprint.co.uk, sudeep.holla@arm.com, hkallweit1@gmail.com, keescook@chromium.org, dmitry.torokhov@gmail.com, michal.simek@xilinx.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, rajanv@xilinx.com, Jolly Shah <jollys@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 17, 2018 at 12:20:32PM -0800, Jolly Shah wrote:
> This patch is adding communication layer with firmware.
> Firmware driver provides an interface to firmware APIs.
> Interface APIs can be used by any driver to communicate to
> PMUFW(Platform Management Unit). All requests go through ATF.
> 
> Signed-off-by: Jolly Shah <jollys@xilinx.com>
> Signed-off-by: Rajan Vaja <rajanv@xilinx.com>
> ---
>  arch/arm64/Kconfig.platforms                    |   1 +
>  drivers/firmware/Kconfig                        |   1 +
>  drivers/firmware/Makefile                       |   1 +
>  drivers/firmware/xilinx/Kconfig                 |   4 +
>  drivers/firmware/xilinx/Makefile                |   4 +
>  drivers/firmware/xilinx/zynqmp/Kconfig          |  16 +
>  drivers/firmware/xilinx/zynqmp/Makefile         |   4 +
>  drivers/firmware/xilinx/zynqmp/firmware.c       | 987 ++++++++++++++++++++++++
>  include/linux/firmware/xilinx/zynqmp/firmware.h | 570 ++++++++++++++

Why does this file need to be in include/linux/ at all?  Shouldn't it
just live in the driver-specific subdir?

thanks,

greg k-h
