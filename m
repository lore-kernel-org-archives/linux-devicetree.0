From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 1/3] mtd: brcmnand: Add brcm,bcm6368-nand device tree
 binding
Date: Wed, 9 Dec 2015 12:02:37 -0800
Message-ID: <20151209200237.GB144338@google.com>
References: <565F81A6.6060307@simon.arlott.org.uk>
 <CAOiHx=kLrJPfvQUjNiEmvAMVj8v37RMFqaMp=tqzAVe22q+9fQ@mail.gmail.com>
 <b3a23d0b4e1e11c9b71848e0345777cd4163f185@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b3a23d0b4e1e11c9b71848e0345777cd4163f185@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Arlott <simon@fire.lp0.eu>
Cc: Jonas Gorski <jogo@openwrt.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>, MTD Maling List <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Kamal Dasu <kdasu.kdev@gmail.com>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 04, 2015 at 09:29:55PM -0000, Simon Arlott wrote:
> On Fri, December 4, 2015 16:04, Jonas Gorski wrote:
> > On Thu, Dec 3, 2015 at 12:41 AM, Simon Arlott <simon@fire.lp0.eu> wrote:
> >> +   * "brcm,nand-bcm6368"
> >> +     - compatible: should contain "brcm,nand-bcm<soc>", "brcm,nand-bcm6368"
> >> +     - reg: (required) the 'NAND_INTR_BASE' register range, with combined status
> >> +       and enable registers, and boot address registers
> >> +     - reg-names: (required) "nand-intr-base"
> >
> > Can't we use the same name as bcm63138, i.e. nand-int-base?
> 
> Brian,
> 
> Before I change this, is there anything else in the patch series that needs to
> be changed?

No, I think you covered my comments in your latest series:

http://lists.infradead.org/pipermail/linux-mtd/2015-December/064004.html

I don't know about Jonas's comments about using bcm6368, even though
bcm6368 is a much older NAND core. I had similar thoughts when Florian
first proposed it, but I'm not sure I have a much better suggestion.
We're trying to describe two slightly different tracks of IP: the core
NAND controller, which has a defined revision (2.x, 4.0, etc.), and the
accessory interrupt bits, which are mostly constant across a product
line / class of SoCs and aren't really versioned.

So I guess I'm OK with the usage of the bcm6368 compatible string.

Regards,
Brian
