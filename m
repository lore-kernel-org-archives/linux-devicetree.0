From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 4/7] drivers/soc: xdma: Add PCI device configuration sysfs
Date: Tue, 21 May 2019 14:06:10 +0200
Message-ID: <CAK8P3a1DxtZFtgHbM7RmcadvRd8ZzjYXjR41OxhDkiKg55CTMQ@mail.gmail.com>
References: <1558383565-11821-1-git-send-email-eajames@linux.ibm.com> <1558383565-11821-5-git-send-email-eajames@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1558383565-11821-5-git-send-email-eajames@linux.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Eddie James <eajames@linux.ibm.com>
Cc: linux-aspeed@lists.ozlabs.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
List-Id: devicetree@vger.kernel.org

On Mon, May 20, 2019 at 10:21 PM Eddie James <eajames@linux.ibm.com> wrote:
>
> The AST2500 has two PCI devices embedded. The XDMA engine can use either
> device to perform DMA transfers. Users need the capability to choose
> which device to use. This commit therefore adds two sysfs files that
> toggle the AST2500 and XDMA engine between the two PCI devices.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  drivers/soc/aspeed/aspeed-xdma.c | 64 ++++++++++++++++++++++++++++++++++++++++

This patch needs to come with a corresponding file in Documentation/ABI/

       Arnd
