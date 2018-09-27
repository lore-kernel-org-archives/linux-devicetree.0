From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/5] usb: host: Add OHCI driver for Broadcom STB SoCs
Date: Thu, 27 Sep 2018 11:08:39 +0200
Message-ID: <CAK8P3a0rN=E7vnK3Ri8srXBDT7cdsVj-n=G6VGBROc0o8vrcpw@mail.gmail.com>
References: <1538000414-24873-1-git-send-email-alcooperx@gmail.com> <1538000414-24873-3-git-send-email-alcooperx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1538000414-24873-3-git-send-email-alcooperx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Cooper <alcooperx@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, gregkh <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alan Stern <stern@rowland.harvard.edu>, Mathias Nyman <mathias.nyman@intel.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, David Miller <davem@davemloft.net>, Andrew Morton <akpm@linux-foundation.org>, Dmitry Osipenko <digetx@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, sunjianguo1@huawei.com, James Hogan <jhogan@kernel.org>, Alban Bedel <albeu@free.fr>, Lu Baolu <baolu.lu@linux.intel.com>, Avi Fishman <avifishman70@gmail.com>, Alex Elder <elder@linaro.org>, Hans de Goede <hdegoede@redhat.com>, USB list <linux-usb@vger.kernel.org>, DTML <devicetree@vger.kernel.>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 27, 2018 at 12:20 AM Al Cooper <alcooperx@gmail.com> wrote:
>
> This driver enables USB OHCI on Broadcom ARM and MIPS STB SoCs.
> The drivers depend on a matching "brcm,brcmstb-usb-phy"
> Broadcom STB USB Phy driver.
>
> The standard platform driver can't be used because of differences
> in PHY and Clock handling. The standard PHY handling in hcd.c will
> do a phy_exit/phy_init on suspend/resume and this will end up
> shutting down the PHYs to the point that the host controller
> registers are no longer accessible and will cause suspend to crash.
> The clocks specified in device tree for these drivers are not
> available in mainline so instead of returning EPROBE_DEFER when
> the specified clock is not found and eventually failing probe,
> the clock pointer is set to NULL which disables all clock handling.

Both of these sound like fairly minor differences, I wonder if the
generic code could be adapted to have a special case for these
rather than duplicating it.

        Arnd
