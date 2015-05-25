From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH v4 0/6] Change snvs rtc and poweroff to use syscon add
 pwrkey driver
Date: Mon, 25 May 2015 14:47:00 +0800
Message-ID: <20150525064659.GH3264@dragon>
References: <1432305399-30571-1-git-send-email-Frank.Li@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-input-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1432305399-30571-1-git-send-email-Frank.Li@freescale.com>
Sender: linux-input-owner@vger.kernel.org
To: Frank.Li@freescale.com
Cc: lznuaa@gmail.com, dmitry.torokhov@gmail.com, robh+dt@kernel.org, alexandre.belloni@free-electrons.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, rtc-linux@googlegroups.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, May 22, 2015 at 10:36:33PM +0800, Frank.Li@freescale.com wrote:
> Frank Li (5):
>   rtc: arm: imx: snvs: change use syscon to access register
>   Document: dt: fsl: snvs: change support syscon
>   arm: dts: imx: update snvs to use syscon access register
>   document: devicetree: input: imx: i.mx snvs power device tree bindings
>   arm: dts: imx6sx: enable snvs power key
> 
> Robin Gong (1):
>   input: keyboard: imx: add snvs power key driver

For patch subject prefix, I suggest you use some help from 'git log' to
find out what the best practice is for the files you are patching.

Shawn
