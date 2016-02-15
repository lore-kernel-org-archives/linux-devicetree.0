From: Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH 1/1] MIPS: DTS: cavium-octeon: provide model attribute
Date: Mon, 15 Feb 2016 21:40:57 +0200
Message-ID: <20160215194056.GE1640@darkstar.musicnaut.iki.fi>
References: <1455513977-934-1-git-send-email-xypron.glpk@gmx.de>
 <56C1B3A0.4090301@cogentembedded.com>
 <56C21054.4070702@gmx.de>
 <20160215183838.GD1640@darkstar.musicnaut.iki.fi>
 <56C2253D.50101@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56C2253D.50101-Mmb7MZpHnFY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, Feb 15, 2016 at 08:21:33PM +0100, Heinrich Schuchardt wrote:
> flash-kernel has a database /usr/share/flash-kernel/db/all.db with
> entries like:
> 
> Machine: LeMaker Banana Pi
> Kernel-Flavors: armmp armmp-lpae
> Boot-Script-Path: /boot/boot.scr
> DTB-Id: sun7i-a20-bananapi.dtb
> U-Boot-Script-Name: bootscr.sunxi
> Required-Packages: u-boot-tools
> 
> Machine refers to the value of /proc/device-tree/model.
> DTB-Id is the dtb to be installed.
> 
> So what flash-kernel does is:
> - look up value of /proc/device-tree/model
> - retrieve correlated dtb file name from database
> - install dtb with this name
> - create symbolic links for the dtb
> 
> If multiple boards use the the same dtb that is fine with flash-kernel
> as long as the value of model is unique per dtb.

OCTEON does not work like this. The file you are modifying
(octeon_3xxx.dts) is compiled into the kernel, and there is no external
DTB file. So the model string will be always the same regardless on
which board you have booted the kernel.

A.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
