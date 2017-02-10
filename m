From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH RESEND 4/5] mtd: nand: atmel: Document the new DT
 bindings
Date: Fri, 10 Feb 2017 15:00:48 +0100
Message-ID: <20170210150048.40295070@bbrezillon>
References: <1485535324-28393-1-git-send-email-boris.brezillon@free-electrons.com>
        <1485535324-28393-5-git-send-email-boris.brezillon@free-electrons.com>
        <20170201153920.g26erfzxnxrmsu4z@rob-hp-laptop>
        <20170201164711.27e4b600@bbrezillon>
        <20170210135528.4ee6807b@bbrezillon>
        <CAL_Jsq+cmS=o-ZN2PUCreRrWAEdEgV4pRCfWaJ9jHy_oSHMPfg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+cmS=o-ZN2PUCreRrWAEdEgV4pRCfWaJ9jHy_oSHMPfg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org, Nicolas Ferre <nicolas.ferre@atmel.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Wenyou Yang <wenyou.yang@atmel.com>, Josh Wu <rainyfeeling@outlook.com>, Haavard Skinnemoen <hskinnemoen@gmail.com>, Hans-Christian Egtvedt <egtvedt@samfundet.no>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>Marek Vasut <ma>
List-Id: devicetree@vger.kernel.org

On Fri, 10 Feb 2017 07:58:15 -0600
Rob Herring <robh@kernel.org> wrote:

> On Fri, Feb 10, 2017 at 6:55 AM, Boris Brezillon
> <boris.brezillon@free-electrons.com> wrote:
> > Hi Rob,
> >
> > On Wed, 1 Feb 2017 16:47:11 +0100
> > Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
> >  
> >> On Wed, 1 Feb 2017 09:39:20 -0600
> >> Rob Herring <robh@kernel.org> wrote:
> >>  
> >> > On Fri, Jan 27, 2017 at 05:42:03PM +0100, Boris Brezillon wrote:  
> >> > > Document the new DT bindings for the Atmel NAND controller and
> >> > > deprecate the old ones.  
> >> >
> >> > Why?  
> >>
> >> Because the existing representation is not only wrong, it also causes
> >> pinmux conflicts between the NAND controller and other devices present
> >> on the EBI bus.
> >> It's explained in the cover letter, but maybe you want me to put that
> >> in the commit message.  
> >
> > Do you need more explanation (A.K.A. ping).  
> 
> No, but it should be in the commit msg.

Okay, will add more details in the commit msg then.

Thanks,

Boris
