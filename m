From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] pci: Add support for creating a generic host_bridge from
 device tree
Date: Sun, 9 Feb 2014 21:22:49 +0100
Message-ID: <201402092122.50185.arnd@arndb.de>
References: <1391452428-22917-1-git-send-email-Liviu.Dudau@arm.com>
 <CACoXjcnTHgtBDesqFUOca1nf34HvNGAV0vP9AEB5xV1mvcRGfw@mail.gmail.com>
 <20140208142207.GR4993@e106497-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140208142207.GR4993@e106497-lin.cambridge.arm.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linaro-kernel <linaro-kernel@lists.linaro.org>, linux-pci <linux-pci@vger.kernel.org>, Will Deacon <Will.Deacon@arm.com>, LKML <linux-kernel@vger.kernel.org>, Tanmay Inamdar <tinamdar@apm.com>, Catalin Marinas <Catalin.Marinas@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Saturday 08 February 2014, Liviu Dudau wrote:
> Yes, that parsing code of ranges is incorrect in light of the current discussion. I
> will try to propose a fix in the v2 series.
> 
> Regarding your PCI IO range: if your bus address starts at 0x8000_0000, would
> that not cause problems with devices that use less than 32bits for address
> decoding? It is a rather unusual setup, I believe the x86 world (even PCI spec?)
> mandates IO bus ranges in the first 16MB of address range?

Actually even less than that. The common location of the I/O aperture is
0x0000-0xffff in bus space, which comes from the way the x86 instruction
set handles it. You can have larger bus addresses, but you can easily get
into trouble that way. One limitation is that the total I/O space size for
all buses combined is 2MB on arm32 (to be extended to 16MB on arm64 as
it stands right now), the other is that we probably have code assuming that
io_offset is a non-negative number, i.e. the bus address is equal or less
than the logial I/O port number, which in turn is limited to a few MB.

	Arnd
