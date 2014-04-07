From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH v7 1/6] pci: Introduce pci_register_io_range() helper
 function.
Date: Mon, 07 Apr 2014 19:13:28 +1000
Message-ID: <1396862008.3671.39.camel@pasglop>
References: <1394811272-1547-1-git-send-email-Liviu.Dudau@arm.com>
 <1394811272-1547-2-git-send-email-Liviu.Dudau@arm.com>
 <20140405001953.GE15806@google.com> <1396777793.3671.15.camel@pasglop>
 <20140407083550.GF17163@e106497-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140407083550.GF17163@e106497-lin.cambridge.arm.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linaro-kernel <linaro-kernel@lists.linaro.org>, Arnd Bergmann <arnd@arndb.de>, linux-pci <linux-pci@vger.kernel.org>, Will Deacon <Will.Deacon@arm.com>, LKML <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Tanmay Inamdar <tinamdar@apm.com>, Catalin Marinas <Catalin.Marinas@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2014-04-07 at 09:35 +0100, Liviu Dudau wrote:
> Thanks for the summary, is really useful as I was recently looking
> into code in that
> area. One thing I was trying to understand is why ppc needs _IO_BASE
> at all rather
> than using the generic PCI_IOBASE? 

Perhaps because our code predates it ? :-) I haven't looked much into
the semantics of PCI_IOBASE yet...

Cheers,
Ben.
