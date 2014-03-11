From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v6 6/6] pci: Add support for creating a generic
 host_bridge from device tree
Date: Tue, 11 Mar 2014 07:50:24 +0100
Message-ID: <4254618.BlpDUOctDb@wuerfel>
References: <1394020137-1830-1-git-send-email-Liviu.Dudau@arm.com>
 <1469359.kil5iaOqdU@wuerfel> <20140310215600.GA14968@bart.dudau.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140310215600.GA14968@bart.dudau.co.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Liviu Dudau <liviu@dudau.co.uk>, linaro-kernel <linaro-kernel@lists.linaro.org>, Catalin Marinas <Catalin.Marinas@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>, Liviu Dudau <Liviu.Dudau@arm.com>, LKML <linux-kernel@vger.kernel.org>, Will Deacon <Will.Deacon@arm.com>, Tanmay Inamdar <tinamdar@apm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Bjorn Helgaas <bhelgaas@google.com>
List-Id: devicetree@vger.kernel.org

On Monday 10 March 2014 21:56:00 Liviu Dudau wrote:
> 
> PCI_IOBASE is always defined. See the discussion with Russell on this subject.
> 
> include/asm-generic/io.h has at line 118:
> 
> #ifndef PCI_IOBASE
> #define PCI_IOBASE ((void __iomem *) 0)
> #endif

That is only defined for those that use asm-generic/pci.h, which most architectures
don't.
 
> I will go with my idea tomorrow. arm64 overwrite the implementation anyway, I
> find it cleaner rather than having to do #ifdefs and/or ifs.

I'd really hope we can get to a point where arm64 doesn't need any architecture
specific code for this. It doesn't do anything special.

	Arnd
