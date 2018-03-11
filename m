From: Vivek Unune <npcomplete13@gmail.com>
Subject: Re: [PATCH] ARM: BCM5301X: Fix NAND ECC parameters for Linksys
 Panamera
Date: Sun, 11 Mar 2018 06:03:13 -0400
Message-ID: <20180311100313.znonhesgh462rz65@osboxes>
References: <20180310171244.70299-1-npcomplete13@gmail.com>
 <CACna6rz1TeRbPq-60HkHz9A0TDn+iXtmXniE6FCiANpUmV-qrw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACna6rz1TeRbPq-60HkHz9A0TDn+iXtmXniE6FCiANpUmV-qrw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: florian.fainelli@broadcom.com, Hauke Mehrtens <hauke@hauke-m.de>, Jon Mason <jonmason@broadcom.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rafał,

On Sat, Mar 10, 2018 at 10:41:04PM +0100, Rafał Miłecki wrote:
> On 10 March 2018 at 18:12, Vivek Unune <npcomplete13@gmail.com> wrote:
> > Using BCH8 gives ecc errors and makes the router unsuable.
> > Switching to BCH1 fixes these errors.
> 
> Can you provide CFE's log messages starting with
> "Decompressing...done" and up to the "Press Ctrl+C to stop in CFE"
> please? I'd like to see what NAND info CFE prints there.

See below. It does say BCH-8, however I can't get it to work.

CFE log:

Decompressing...done
Found a Toshiba NAND flash:
Total size:  128MB
Block size:  128KB
Page Size:   2048B
OOB Size:    64B
Sector size: 512B
Spare size:  16B
ECC level:   8 (8-bit)
Device ID: 0x98 0xf1 0x80 0x15 0xf2 0x16
find_devinfo: devinfo block found at 0x00180000!

Press Ctrl+C to stop in CFE

Thanks,

Vivek
