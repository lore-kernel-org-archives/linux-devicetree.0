From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v7 3/3] arm64: Add architecture support for PCI
Date: Thu, 20 Mar 2014 13:26:02 +0100
Message-ID: <201403201326.02377.arnd@arndb.de>
References: <1394811258-1500-1-git-send-email-Liviu.Dudau@arm.com>
 <201403201217.22339.arnd@arndb.de>
 <20140320113820.GH6457@e106497-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140320113820.GH6457@e106497-lin.cambridge.arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Liviu Dudau <Liviu.Dudau@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linaro-kernel <linaro-kernel@lists.linaro.org>, linux-pci <linux-pci@vger.kernel.org>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, LKML <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Tanmay Inamdar <tinamdar@apm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Bjorn Helgaas <bhelgaas@google.com>, LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thursday 20 March 2014, Liviu Dudau wrote:
> > I don't even understand why you want to create a generic pci_address_to_pio
> > implementation, when we don't need that for arm64 at all. Unless I'm
> > missing something important, that function is only called in case of
> > PCI_PROBE_DEVTREE with pci_of_scan on PowerPC. I don't expect any
> > architecture to do the same thing, and the only other architecture that
> > needs something like it (sparc) has a different implementation.
> 
> Because in my [v7 2/6]* patch for the generic host bridge support I start
> using pci_address_to_pio to fix the conversion of PCI ranges to resources.
> That requires an arm64 (or more correctly, an arch with memory mapped IO
> specific) version of pci_address_to_pio().

Yes, but why do you use it there?

	Arnd
