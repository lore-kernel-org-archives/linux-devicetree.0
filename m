From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH 1/1] MIPS: DTS: cavium-octeon: provide model attribute
Date: Mon, 15 Feb 2016 20:50:48 +0100
Message-ID: <56C22C18.5090608@gmx.de>
References: <1455513977-934-1-git-send-email-xypron.glpk@gmx.de>
 <56C1B3A0.4090301@cogentembedded.com> <56C21054.4070702@gmx.de>
 <20160215183838.GD1640@darkstar.musicnaut.iki.fi> <56C2253D.50101@gmx.de>
 <20160215194056.GE1640@darkstar.musicnaut.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160215194056.GE1640-4/PLUo9XfK9owWHViPbQSXlKr5M7+etX9Sl0XMgJPXI@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02/15/2016 08:40 PM, Aaro Koskinen wrote:
> Hi,
> 
> On Mon, Feb 15, 2016 at 08:21:33PM +0100, Heinrich Schuchardt wrote:
>> flash-kernel has a database /usr/share/flash-kernel/db/all.db with
>> entries like:
>>
>> Machine: LeMaker Banana Pi
>> Kernel-Flavors: armmp armmp-lpae
>> Boot-Script-Path: /boot/boot.scr
>> DTB-Id: sun7i-a20-bananapi.dtb
>> U-Boot-Script-Name: bootscr.sunxi
>> Required-Packages: u-boot-tools
>>
>> Machine refers to the value of /proc/device-tree/model.
>> DTB-Id is the dtb to be installed.
>>
>> So what flash-kernel does is:
>> - look up value of /proc/device-tree/model
>> - retrieve correlated dtb file name from database
>> - install dtb with this name
>> - create symbolic links for the dtb
>>
>> If multiple boards use the the same dtb that is fine with flash-kernel
>> as long as the value of model is unique per dtb.
> 
> OCTEON does not work like this. The file you are modifying
> (octeon_3xxx.dts) is compiled into the kernel, and there is no external
> DTB file. So the model string will be always the same regardless on
> which board you have booted the kernel.
> 
> A.
>
Hello Aaro,

you are right DTBs are built in for MIPS systems.

Still it would be useful to be able to use the same property 'model' to
determine which u-boot script (boot.scr) to install.

Best regards

Heinrich Schuchardt

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
