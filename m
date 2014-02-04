From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] arm64: Add architecture support for PCI
Date: Tue, 4 Feb 2014 20:50:43 +0100
Message-ID: <201402042050.43837.arnd@arndb.de>
References: <1391453028-23191-1-git-send-email-Liviu.Dudau@arm.com>
 <13031998.NR888KZWhk@wuerfel>
 <CAL_JsqLN4RjVzNCfZ50K44RcP61Z8zFOVnpY1+CfVFz_QnSBEg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_JsqLN4RjVzNCfZ50K44RcP61Z8zFOVnpY1+CfVFz_QnSBEg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robherring2@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>, linux-pci <linux-pci@vger.kernel.org>, Liviu Dudau <Liviu.Dudau@arm.com>, LKML <linux-kernel@vger.kernel.org>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Catalin Marinas <Catalin.Marinas@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 04 February 2014, Rob Herring wrote:
> > Here is how a sane person would read SBSA to create a compliant
> > implementation:
> 
> s/sane/software/

> > Here is how a crazy person would read the same sentence in the SBSA:
> 
> s/crazy/hardware/

Not much of a difference, apparently ...

> My money is on the latter. I think non-PCI implementations of xHCI
> interfaces will be common. This was certainly the case at Calxeda in
> what was believed to be a SBSA compliant SOC.

I just looked up the EHCI and xHCI specs and am shocked to see that
the PCI config space access for both is an optional part of the
spec, so that assertion may well have been correct.

On the other hand, it does seem impossible to create a compliant
AHCI implementation without making it show up as a PCI function,
so any SBSA compliant SoC that contains AHCI already has to have
all the bits for doing the same on USB.

> However, I think PCI
> device or not is the least of the issues and all the other examples
> you list are the difficult ones to deal with.

Agreed. But if they get the difficult problems right, it's
trivial to also do the PCI config space either in the way
that Jason described, or as a separate PCI domain. In the worst
case, it could still be faked up by a secure-mode firmware
catching all config space accesses.

	Arnd
