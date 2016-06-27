From: Nava kishore Manne <nava.manne@xilinx.com>
Subject: RE: [PATCH v4] Axi-usb: Add support for 64-bit addressing.
Date: Mon, 27 Jun 2016 12:47:35 +0000
Message-ID: <C89496FEAE474D468F30D558A9468D9F26CF4FCD@XAP-PVEXMBX01.xlnx.xilinx.com>
References: <1464626798-1334-1-git-send-email-navam@xilinx.com>
 <20160602225815.GA5508@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160602225815.GA5508@rob-hp-laptop>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Hyun Kwon <hyunk@xilinx.com>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "balbi@ti.com" <balbi@ti.com>, Michal Simek <michals@xilinx.com>, Soren Brinkmann <sorenb@xilinx.com>, "galak@codeaurora.org" <galak@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Radhey Shyam Pandey <radheys@xilinx.com>
List-Id: devicetree@vger.kernel.org

Ping!!

> -----Original Message-----
> From: Rob Herring [mailto:robh@kernel.org]
> Sent: Friday, June 03, 2016 4:28 AM
> To: Nava kishore Manne <navam@xilinx.com>
> Cc: pawel.moll@arm.com; mark.rutland@arm.com;
> ijc+devicetree@hellion.org.uk; galak@codeaurora.org; Michal Simek
> <michals@xilinx.com>; Soren Brinkmann <sorenb@xilinx.com>;
> balbi@ti.com; gregkh@linuxfoundation.org; Hyun Kwon
> <hyunk@xilinx.com>; Nava kishore Manne <navam@xilinx.com>; Radhey
> Shyam Pandey <radheys@xilinx.com>; devicetree@vger.kernel.org; linux-
> arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH v4] Axi-usb: Add support for 64-bit addressing.
> 
> On Mon, May 30, 2016 at 10:16:38PM +0530, Nava kishore Manne wrote:
> > This patch updates the driver to support 64-bit DMA addressing.
> >
> > Signed-off-by: Nava kishore Manne <navam@xilinx.com>
> > ---
> > Changes for v4:
> > 		-Used boolen property insted of addrwith property in the DT
> > 		 as suggested by Arnd Bergmann.
> > 		-Adopt the DT relevant changes into the driver.
> >
> > Changes for v3:
> >                 -Added new compatable string for 5.00 IP version as suggested by
> >                  Arnd Bergmann.
> >                 -Used write_fn() insted of lo_hi_writeq() as suggested by
> >                  Arnd Bergmann.
> >
> > Changes for v2:
> >                 -Added dma-ranges property in device tree as suggested by Arnd
> Bergmann.
> >                 -Modified the driver code based on the xlnx,addrwidth.
> >
> >  .../devicetree/bindings/usb/udc-xilinx.txt         |  5 ++-
> 
> Acked-by: Rob Herring <robh@kernel.org>
> 
> >  drivers/usb/gadget/udc/udc-xilinx.c                | 52
> +++++++++++++++++++++-
> >  2 files changed, 54 insertions(+), 3 deletions(-)
