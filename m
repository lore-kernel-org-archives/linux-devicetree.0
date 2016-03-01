From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 0/5] Modularize PCI_DW related drivers.
Date: Tue, 01 Mar 2016 22:35:22 +0100
Message-ID: <2163039.5ZupTHB3qf@wuerfel>
References: <1454889644-27830-1-git-send-email-paul.gortmaker@windriver.com> <2837386.VTD89bjPJz@wuerfel> <56D40F7F.5060204@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <56D40F7F.5060204@ti.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Grant Likely <grant.likely@linaro.org>, Ley Foon Tan <lftan@altera.com>, Murali Karicheri <m-karicheri2@ti.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Stanimir Varbanov <svarbanov@mm-sol.com>, Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Monday 29 February 2016 14:59:35 Kishon Vijay Abraham I wrote:
> > }
> > 
> > You just need to pass the same resource in here htat you pass into
> > pci_remap_iospace().
> 
> I still seem to get the abort in ioremap_page_range().
> 
> Here's the patch I used [3] and here's the kernel log [4].
> 
> [3] -> http://pastebin.ubuntu.com/15241614/
> [4] -> http://pastebin.ubuntu.com/15241637/
> 
> 

Sorry, I'm out of ideas here. The patch looks right to me, but the problem
looks unchanged.

	Arnd
