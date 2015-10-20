From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v1 1/2] phy: keystone: serdes driver for gbe 10gbe and pcie
Date: Tue, 20 Oct 2015 10:24:18 +0200
Message-ID: <4661946.mPHVFLWuan@wuerfel>
References: <1444919145-30845-1-git-send-email-w-kwok2@ti.com>
 <230CBA6E4B6B6B418E8730AC28E6FC7E04229363@DFLE11.ent.ti.com>
 <56253B91.5040807@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <56253B91.5040807@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Murali Karicheri <m-karicheri2@ti.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "Kwok,
 WingMan" <w-kwok2@ti.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "ssantosh@kernel.org" <ssantosh@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, KISHON VIJAY ABRAHAM <kishon@ti.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "galak@codeaurora.org" <galak@codeaurora.org>, "bhelgaas@google.com" <bhelgaas@google.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "Quadros, Roger" <rogerq@ti.com>
List-Id: devicetree@vger.kernel.org

On Monday 19 October 2015 14:50:57 Murali Karicheri wrote:
> Arnd, by your statement 'I don't see any code that does this' do you 
> expect a piece of code that embed the license in the binary image? If 
> so, that seems weired to me.
> 
> Many of the drivers including this patch has the following statement in 
> the license that is additional company specific license such as BSD that 
> is applicable.
> 
> ==== Cut and pasted from drivers/crypto/fcrypt.c =======================
>   * 2. Redistributions in binary form must reproduce the above copyright
>   *    notice, this list of conditions and the following disclaimer in the
>   *    documentation and/or other materials provided with the distribution.
> =========================================================================
> I read this as if the source is compiled and distributed as a binary 
> either a kernel module ko file or as part of the kernel binary, this 
> term must apply. Usually this is part of documentation that goes with 
> the product AFAIK.

Sorry, my fault. This is indeed the standard BSD license, and
I misread this as having to produce the copyright statement
from the binary itself. Please ignore whatever I said on the
subject.

	Arnd
