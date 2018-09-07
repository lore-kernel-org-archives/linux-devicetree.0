From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: Re: [PATCH 2/2] pci: dwc: add UniPhier PCIe host controller support
Date: Fri, 07 Sep 2018 13:11:27 +0900
Message-ID: <20180907131126.FACD.4A936039@socionext.com>
References: <20180906103819.252A.4A936039@socionext.com>
 <20180906140926.GB214747@bhelgaas-glaptop.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180906140926.GB214747@bhelgaas-glaptop.roam.corp.google.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Rob Herring <robh+dt@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Bjorn,

On Thu, 6 Sep 2018 09:09:27 -0500 <helgaas@kernel.org> wrote:

> On Thu, Sep 06, 2018 at 10:38:20AM +0900, Kunihiko Hayashi wrote:
> > > > +++ b/drivers/pci/controller/dwc/pcie-uniphier.c
> > > > @@ -0,0 +1,464 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > +//
> > > > +// PCI-express host controller driver for UniPhier SoCs
> > > > +// Copyright 2018 Socionext Inc.
> > > > +// Author: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> > > 
> > > Use /* ... */ comments except for the SPDX line.
> > 
> > Okay, although I wondered which way to put, I'll replace the header next.
> 
> The easiest thing is to look at similar files already in the tree and
> follow their style.  The details are here:
> 
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst#n540
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/license-rules.rst#n74

Thanks for your advice.
Although I've found both styles in some sub-systems, these are helpful for me.

I replaced it in posted v2.

Thank you,

---
Best Regards,
Kunihiko Hayashi
