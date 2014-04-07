From: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH v7 5/6] pci: Export find_pci_host_bridge() function.
Date: Mon, 7 Apr 2014 15:38:50 +0100
Message-ID: <20140407153850.3c9ef3e5@alan.etchedpixels.co.uk>
References: <1394811272-1547-1-git-send-email-Liviu.Dudau@arm.com>
 <1394811272-1547-6-git-send-email-Liviu.Dudau@arm.com>
 <20140404233948.GC15806@google.com>
 <20140407142045.GO17163@e106497-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140407142045.GO17163@e106497-lin.cambridge.arm.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linaro-kernel <linaro-kernel@lists.linaro.org>, Catalin Marinas <Catalin.Marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, linux-pci <linux-pci@vger.kernel.org>, Will Deacon <Will.Deacon@arm.com>, LKML <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Tanmay Inamdar <tinamdar@apm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Bjorn Helgaas <bhelgaas@google.com>, LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> > If we *do* export it, I'd like it to have a more conventional name, e.g.,
> > something starting with "pci_".
> 
> Understood. pci_find_host_bridge() ?

pci_get_host_bridge() and take a reference IMHO ? If your primary bus is
not PCI then your PCI "host" bridge could be hot swappable so the API at
least ought to get that right.

Alan
