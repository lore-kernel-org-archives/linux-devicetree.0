From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH RFC RFT 0/2] ARM: Kirkwood: Synology DT files
Date: Fri, 10 Jan 2014 15:37:25 +0100
Message-ID: <52D005A5.20300@gmail.com>
References: <1389052027-16819-1-git-send-email-andrew@lunn.ch> <52CE312B.3060108@killerwolves.net> <20140109165557.GB9681@lunn.ch> <52CF4652.3030207@killerwolves.net> <20140110112846.GG27432@n2100.arm.linux.org.uk> <52CFFF07.5080806@killerwolves.net> <20140110142548.GG9681@lunn.ch>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140110142548.GG9681-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Ben Peddell <klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/10/14 15:25, Andrew Lunn wrote:
> On Sat, Jan 11, 2014 at 12:09:11AM +1000, Ben Peddell wrote:
>>   ** MARVELL BOARD: Synology Disk Station LE
>>
>> U-Boot 1.1.4 (Jul  6 2010 - 19:26:08) Marvell version: 3.4.4
>>
>> U-Boot code: 00600000 -> 0067FFF0  BSS: -> 0068B43C
>>
>> Soc: 88F6281 A1 (DDR2)
>> CPU running @ 1200Mhz L2 running @ 480Mhz
>> SysClock = 400Mhz , TClock = 200Mhz
>>
>> DRAM CAS Latency = 6 tRP = 6 tRAS = 18 tRCD=6
>> DRAM CS[0] base 0x00000000   size 128MB
>> DRAM Total size 128MB  16bit width
>> [4096kB@f8000000] Flash:  4 MB
...
>> Uncompressing Linux... done, booting the kernel.
>> [    0.000000] Booting Linux on physical CPU 0x0
>> [    0.000000] Linux version 3.13.0-rc7-ds211j+ (root@lurch) (gcc version 4.8.2 (Gentoo 4.8.2 p1.3, pie-0.5.8) ) #2 Thu Jan 9 08:52:24 EST 2014
>> [    0.000000] CPU: Feroceon 88FR131 [56251311] revision 1 (ARMv5TE), cr=00053977
>> [    0.000000] CPU: VIVT data cache, VIVT instruction cache
>> [    0.000000] Machine model: Synology DS210 v10, v20, v30, DS211j
>> [    0.000000] bootconsole [earlycon0] enabled
>> [    0.000000] INITRD: 0xf8280040+0x000f993c is not a memory region - disabling initrd
>
> The kernel is correct. There is no RAM here. That is in the IOMEM
> space.

Looks like a dirty trick to mount the initrd directly from
the boot device remap which is at 0xf8000000 by default.

Copying the image from the boot device to ram in u-boot
and pass the correct initrd address should help here. Or
we need a mbus ranges entry for it, too.

Sebastian



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
