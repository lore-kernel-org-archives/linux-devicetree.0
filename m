From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH] ARM: BCM5301X: Fix NAND ECC parameters for Linksys Panamera
Date: Sat, 10 Mar 2018 22:41:04 +0100
Message-ID: <CACna6rz1TeRbPq-60HkHz9A0TDn+iXtmXniE6FCiANpUmV-qrw@mail.gmail.com>
References: <20180310171244.70299-1-npcomplete13@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180310171244.70299-1-npcomplete13@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vivek Unune <npcomplete13@gmail.com>
Cc: florian.fainelli@broadcom.com, Hauke Mehrtens <hauke@hauke-m.de>, Jon Mason <jonmason@broadcom.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 10 March 2018 at 18:12, Vivek Unune <npcomplete13@gmail.com> wrote:
> Using BCH8 gives ecc errors and makes the router unsuable.
> Switching to BCH1 fixes these errors.

Can you provide CFE's log messages starting with
"Decompressing...done" and up to the "Press Ctrl+C to stop in CFE"
please? I'd like to see what NAND info CFE prints there.
