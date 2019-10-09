From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] of: Make of_dma_get_range() work on bus nodes
Date: Tue, 8 Oct 2019 20:03:02 -0500
Message-ID: <CAL_Jsq+RjC0b1ZXzgmMdn5Gd1=3zkN62Jdq_QKeZ8-X4pCiDPw@mail.gmail.com>
References: <20191008195239.12852-1-robh@kernel.org>
 <4f6b26f8779a4fd98712b966bff3491dc31e26c2.camel@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4f6b26f8779a4fd98712b966bff3491dc31e26c2.camel@suse.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>, Robin Murphy <robin.murphy@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@infradead.org>, Marek Vasut <marek.vasut@gmail.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Stefan Wahren <wahrenst@gmx.net>, Simon Horman <horms+renesas@verge.net.au>, Frank Rowand <frowand.list@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 8, 2019 at 3:52 PM Nicolas Saenz Julienne
<nsaenzjulienne@suse.de> wrote:
>
> Hi Rob/Robin,
>
> On Tue, 2019-10-08 at 14:52 -0500, Rob Herring wrote:
> > From: Robin Murphy <robin.murphy@arm.com>
> >
> > Since the "dma-ranges" property is only valid for a node representing a
> > bus, of_dma_get_range() currently assumes the node passed in is a leaf
> > representing a device, and starts the walk from its parent. In cases
> > like PCI host controllers on typical FDT systems, however, where the PCI
> > endpoints are probed dynamically the initial leaf node represents the
> > 'bus' itself, and this logic means we fail to consider any "dma-ranges"
> > describing the host bridge itself. Rework the logic such that
> > of_dma_get_range() also works correctly starting from a bus node
> > containing "dma-ranges".
> >
> > While this does mean "dma-ranges" could incorrectly be in a device leaf
> > node, there isn't really any way in this function to ensure that a leaf
> > node is or isn't a bus node.
>
> Sorry, I'm not totally sure if this is what you're pointing out with the last
> sentence. But, what about the case of a bus configuring a device which also
> happens to be a memory mapped bus (say a PCI platform device). It'll get it's
> dma config based on its own dma-ranges which is not what we want.

What I was trying to say is we just can't tell if we should be looking
in the current node or the parent. 'dma-ranges' in a leaf node can be
correct or incorrect.

Your example is a bit different. I'm not sure that case is valid or
can ever work if it is. It's certainly valid that a PCI bridge's
parent has dma-ranges and now we'll actually handle any translation.
The bridge itself is not a DMA-capable device, but just passing thru
DMA. Do we ever need to know the parent's dma-ranges in that case? Or
to put it another way, is looking at anything other than leaf
dma-ranges useful?

Rob
