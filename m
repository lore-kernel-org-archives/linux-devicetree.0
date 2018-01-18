From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v4 4/8] PCI: brcmstb: Add dma-range mapping for
 inbound	traffic
Date: Thu, 18 Jan 2018 07:09:23 -0800
Message-ID: <EDAEFB0F-BB7C-444A-B282-F178F5ADFCBF@gmail.com>
References: <1516058925-46522-1-git-send-email-jim2101024@gmail.com>
 <1516058925-46522-5-git-send-email-jim2101024@gmail.com>
 <CAL_JsqKpWNJXNpKS5qC99N0+H_P37DcRE-rN9HFwT5tVmRFCNw@mail.gmail.com>
 <20180118073123.GA15766@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180118073123.GA15766@lst.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Christoph Hellwig <hch@lst.de>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Linux-MIPS <linux-mips@linux-mips.org>, linux-pci@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Kevin Cernekee <cernekee@gmail.com>, Will Deacon <will.deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ralf Baechle <ralf@linux-mips.org>, Russell King <rmk+kernel@armlinux.org.uk>, Jim Quinlan <jim2101024@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Gregory Fong <gregory.0xf0@gmail.com>, Jonas Gorski <jonas.gorski@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Brian Norris <computersforpeace@gmail.com>, Robin Murphy <robin.murphy@arm.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On January 17, 2018 11:31:23 PM PST, Christoph Hellwig <hch@lst.de> wrote:
>On Wed, Jan 17, 2018 at 08:15:33PM -0600, Rob Herring wrote:
>> > (a) overriding/redefining the dma_to_phys() and phys_to_dma() calls
>> > that are used by the dma_ops routines.  This is the approach of
>> >
>> >         arch/mips/cavium-octeon/dma-octeon.c
>> 
>> MIPS is rarely an example to follow. :)
>
>But in this case it actually is the example to follow as told
>previously.
>
>NAK again for these chained dma ops that only create problems.

Care to explain what should be done instead?

-- 
Florian
