From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v7 1/6] pci: Introduce pci_register_io_range() helper
 function.
Date: Mon, 07 Apr 2014 13:16:56 +0200
Message-ID: <4164782.o9VMXFGud6@wuerfel>
References: <1394811272-1547-1-git-send-email-Liviu.Dudau@arm.com>
 <20140407083550.GF17163@e106497-lin.cambridge.arm.com>
 <1396862008.3671.39.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1396862008.3671.39.camel@pasglop>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linaro-kernel <linaro-kernel@lists.linaro.org>, Catalin Marinas <Catalin.Marinas@arm.com>, linux-pci <linux-pci@vger.kernel.org>, Liviu Dudau <Liviu.Dudau@arm.com>, LKML <linux-kernel@vger.kernel.org>, Will Deacon <Will.Deacon@arm.com>, Grant Likely <grant.likely@secretlab.ca>, Tanmay Inamdar <tinamdar@apm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Bjorn Helgaas <bhelgaas@google.com>
List-Id: devicetree@vger.kernel.org

On Monday 07 April 2014 19:13:28 Benjamin Herrenschmidt wrote:
> On Mon, 2014-04-07 at 09:35 +0100, Liviu Dudau wrote:
> > Thanks for the summary, is really useful as I was recently looking
> > into code in that
> > area. One thing I was trying to understand is why ppc needs _IO_BASE
> > at all rather
> > than using the generic PCI_IOBASE? 
> 
> Perhaps because our code predates it ?  I haven't looked much into
> the semantics of PCI_IOBASE yet...

Yes, I'm pretty sure that's all there is to it. PCI_IOBASE just
happened to be an identifier we picked for asm-generic, but the
use on PowerPC is much older than the generic file.

	Arnd
