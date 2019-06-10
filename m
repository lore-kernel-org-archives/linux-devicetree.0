From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH V5 11/11] MAINTAINERS: add maintainer for SD-FEC
Date: Mon, 10 Jun 2019 11:59:48 -0700
Message-ID: <4491ae98b10f4519874141eb39cd2f0b5491b3a5.camel@perches.com>
References: <1560038656-380620-1-git-send-email-dragan.cvetic@xilinx.com>
         <1560038656-380620-12-git-send-email-dragan.cvetic@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560038656-380620-12-git-send-email-dragan.cvetic@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dragan Cvetic <dragan.cvetic@xilinx.com>, arnd@arndb.de, gregkh@linuxfoundation.org, michal.simek@xilinx.com, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Derek Kiernan <derek.kiernan@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Sun, 2019-06-09 at 01:04 +0100, Dragan Cvetic wrote:
> Add maintainer entry for Xilinx SD-FEC driver support.
[]
> diff --git a/MAINTAINERS b/MAINTAINERS
[]
> @@ -17345,6 +17345,17 @@ S:	Supported
>  F:	Documentation/filesystems/xfs.txt
>  F:	fs/xfs/
>  
> +XILINX SD-FEC IP CORES
> +M:	Derek Kiernan <derek.kiernan@xilinx.com>
> +M:	Dragan Cvetic <dragan.cvetic@xilinx.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/misc/xlnx,sd-fec.txt
> +F:	Documentation/misc-devices/xilinx_sdfec.rst
> +F:	drivers/misc/xilinx_sdfec.c
> +F:	drivers/misc/Kconfig
> +F:	drivers/misc/Makefile

I suggest that you do not want to be nor are responsible
for the Kconfig and Makefile just because entries in
those files are associated to xilinx files.
