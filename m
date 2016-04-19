From: Nava kishore Manne <nava.manne@xilinx.com>
Subject: RE: [PATCH] Axi-usb: Add support for 64-bit addressing.
Date: Tue, 19 Apr 2016 09:15:01 +0000
Message-ID: <C89496FEAE474D468F30D558A9468D9F26CD3753@XAP-PVEXMBX01.xlnx.xilinx.com>
References: <1460360506-14692-1-git-send-email-navam@xilinx.com>
 <4542055.HvdgVkDRYK@wuerfel> <20160418142909.GA5608@rob-hp-laptop>
 <4449845.qT8BZnpD4R@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4449845.qT8BZnpD4R@wuerfel>
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
To: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Hyun Kwon <hyunk@xilinx.com>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "balbi@ti.com" <balbi@ti.com>, Michal Simek <michals@xilinx.com>, Soren Brinkmann <sorenb@xilinx.com>, "galak@codeaurora.org" <galak@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Radhey Shyam Pandey <radheys@xilinx.com>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Arnd Bergmann [mailto:arnd@arndb.de]
> Sent: Monday, April 18, 2016 8:05 PM
> To: Rob Herring <robh@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org; Nava kishore Manne
> <navam@xilinx.com>; mark.rutland@arm.com; devicetree@vger.kernel.org;
> Nava kishore Manne <navam@xilinx.com>; Hyun Kwon
> <hyunk@xilinx.com>; pawel.moll@arm.com; ijc+devicetree@hellion.org.uk;
> gregkh@linuxfoundation.org; Radhey Shyam Pandey <radheys@xilinx.com>;
> Michal Simek <michals@xilinx.com>; balbi@ti.com; linux-
> kernel@vger.kernel.org; galak@codeaurora.org; Soren Brinkmann
> <sorenb@xilinx.com>
> Subject: Re: [PATCH] Axi-usb: Add support for 64-bit addressing.
>
> On Monday 18 April 2016 09:29:09 Rob Herring wrote:
> >
> > Right, you don't need to know the exact bus width for determining the
> > register/descriptor set is 32 or 64 bit addesses. I'm fine with a
> > property for that, but if limiting the actual connected address bits
> > is needed, then dma-ranges should be used.
>
> The other way round: dma-ranges is needed to allow 64-bit addressing, the
> default is to only allow 32-bit addressing (and arm64 has a known bug here, it
> just allows it anyway when it shouldn't).

AXI-USB IP configurable for 32-bit or 64-bit addressing.

In any of the configuration I mean if it is a 32-bit or 64-bit addressing there is a flexibility for the dma to choose the
Memory range supported by the AXI-USB...

For example if AXI-USB (dma ) is configured for 40-bit addressing.

Theoretically it can access memory up to 1TB if it is true we can get the
Address width using log2 of the dma-ranges size as you mentioned above.

But in real use case user won't map the entire memory
He will map only the memory of his own choice...

For example user mapped 2GB then dma-ranges property will be like below.

dma-ranges = <0x00000000 0x00000000  0x80000000>;

In this case log2 of the dma-ranges size won't give exact value for address width.
That's why used separate h/w property for getting address width of the IP...

Will address the remaining comments in v2.

Regards,
Navakishore.

>       Arnd


This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
