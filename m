From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH 0/3] mtd: nand: add Broadcom NAND controller support
Date: Sun, 8 Mar 2015 01:01:14 +0100
Message-ID: <CACna6rykQTjtfL8mqHJ4ZSY9Ci+kVhjDfDkjRpsFvg4YatNATw@mail.gmail.com>
References: <1425691129-1150-1-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1425691129-1150-1-git-send-email-computersforpeace@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Dmitry Torokhov <dtor@google.com>, Anatol Pomazao <anatol@google.com>, Ray Jui <rjui@broadcom.com>, Corneliu Doban <cdoban@broadcom.com>, Jonathan Richardson <jonathar@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kevin Cernekee <cernekee@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Brian,

Thanks for your work on this. It looks amazing, nice piece of code :)

On 7 March 2015 at 02:18, Brian Norris <computersforpeace@gmail.com> wrote:
> This adds (long in coming) support for the Broadcom BCM7xxx Set-Top Box NAND
> controller. This controller has been used in a variety of Broadcom SoCs.
>
> There are a few more features I'd like add in the near future, mostly to
> support more SoCs, but this is the base set, which should only need relatively
> minor additions to support chips like BCM63138, BCM3384, and Cygnus/iProc.
> Particularly, we may need to straighten out some endianness issues for the data
> path on iProc, and interrupt enabling/acking on iProc, BCM63xxx, BCM3xxx, and
> others.

After applying workaround for not working IRQ, it seems I have some
problem with endianess on my BCM4708 (SoC with 6.01 controller).

Let me start with dumps of "nvram" MTD partition.
1) Dumping with Netgear's original firmware:
# hexdump -C -n 16 mtdblock1.bin
00000000  46 4c 53 48 40 79 00 00  84 01 00 00 47 01 1c 08  |FLSH@y......G...|
2) Dumping with OpenWrt and its bcm_nand.c:
root@OpenWrt:/# hexdump -C -n 16 /dev/mtdblock1
00000000  46 4c 53 48 38 79 00 00  cb 01 00 00 47 01 1c 08  |FLSH8y......G...|

This makes me feel that bcm_nand.c driver is OK.
Unfortunately when using brcmstb_nand.c my bcm47xxpart partition
driver didn't detect any partition at all. This means I couldn't use
any /dev/mtdblockX, not even user space as it wasn't mounted.

So since I didn't have user space, I decided to add some debugging to
bcm47xxpart itself. There is what I got:
1) OpenWrt and its bcm_nand.c:
[bcm47xxpart_parse] 0x80000  46 4c 53 48  38 79 00 00  cb 01 00 00  47 01 1c 08
2) OpenWrt and brcmstb_nand.c:
[bcm47xxpart_parse] 0x80000  48 53 4c 46  00 00 79 38  00 00 01 cb  08 1c 01 47

So obviously data returned by brcmstb_nand.c seems to be all
endianess-flipped. Could you take a loo at this?
