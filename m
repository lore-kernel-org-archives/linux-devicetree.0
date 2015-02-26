From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/3] mtd: atmel_nand: move the hsmc_clk from nfc node to
 nand node
Date: Thu, 26 Feb 2015 13:57:15 +0100
Message-ID: <20150226135715.7e6c199c@bbrezillon>
References: <1423548885-27589-1-git-send-email-josh.wu@atmel.com>
	<20150226101857.59104e97@bbrezillon>
	<C9CC8708-B99A-47F4-AC57-1A92B302E1C9@jcrosoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <C9CC8708-B99A-47F4-AC57-1A92B302E1C9-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Nicolas FERRE <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jean-Christophe,

On Thu, 26 Feb 2015 19:49:09 +0800
Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org> wrote:

> 
> > On Feb 26, 2015, at 5:18 PM, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > 
> > Hi Josh,
> > 
> > On Tue, 10 Feb 2015 14:14:43 +0800
> > Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org> wrote:
> > 
> >> Also add a new sama5d3_nand compatiable string for sama5d3 nand.
> >> 
> >> For sama5d3, sama5d4 chip, the pmecc became part of HSMC, they need the
> >> HSMC clock enabled to work.
> >> The NFC is a sub feature for current nand driver, it can be disabled.
> >> But if HSMC clock is controlled by NFC, so disable NFC will also disable
> >> the HSMC clock. then, it will make the PMECC fail to work.
> >> 
> >> So the solution is move the HSMC clock out of NFC to nand node. When
> >> nand driver probed, it will check whether the chip has HSMC, if yes then
> >> it will require a HSMC clock.
> > 
> > Do you plan to use the NAND chip without the NFC (I mean, is there a
> > reason for not using the NFC to access the NAND ?) ?
> > If you don't, why don't you just wait for the NFC before probing the
> > NAND chip it is attached to, so that the hmsc clk is properly claimed.
> you can as you can have 2 Nand on the d3 but only 1 NFC

I don't get your point ?
You can control several NAND chips with the same NFC.

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
