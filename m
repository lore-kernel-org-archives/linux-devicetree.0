From: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] [PATCH v4] mtd:spi-nor: Add Altera Quad SPI Driver
Date: Thu, 20 Aug 2015 10:48:10 +0200
Message-ID: <201508201048.10731.marex@denx.de>
References: <CAN1oZWyE9E2kRkGZPajpiNbpeKEjOhs9NDNDbUpmdw18WNYL2A@mail.gmail.com> <201508200955.20067.marex@denx.de> <CAN1oZWzkdSX7NXTG1aVmR79MMoDVRtrrq6j3KO2Qi138hnf_LQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAN1oZWzkdSX7NXTG1aVmR79MMoDVRtrrq6j3KO2Qi138hnf_LQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Viet Nga Dao <vndao@altera.com>
Cc: Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thursday, August 20, 2015 at 10:06:29 AM, Viet Nga Dao wrote:
> On Thu, Aug 20, 2015 at 3:55 PM, Marek Vasut <marex@denx.de> wrote:
> > On Thursday, August 20, 2015 at 09:37:33 AM, Viet Nga Dao wrote:
> >> Hi,
> > 
> > Hi,
> > 
> >> >> On Tuesday, August 18, 2015 at 03:24:44 AM, Brian Norris wrote:
> >> >>> I'm not very helpful here, so hopefully Viet can be of more use:
> >> >> Yup :)
> >> >> 
> >> >>> On Mon, Aug 17, 2015 at 07:53:23PM +0200, Marek Vasut wrote:
> >> >>> > On Monday, August 17, 2015 at 06:03:38 PM, Brian Norris wrote:
> >> >>> > Also, I cannot find any documentation for this IP block even if I
> >> >>> > search through Quartus/QSys, is there any proper documentation
> >> >>> > available anywhere?
> >> >>> 
> >> >>> I never found proper documentation, but I didn't look too hard. I've
> >> >>> mostly been going off of Viet's comments and code.
> >> >> 
> >> >> Me neither, and I looked through the altera stuff in fact. I'm trying
> >> >> to learn whether this is just an Soft IP, in which case it certainly
> >> >> can be fixed ; or if there is actually some chip shipping with this
> >> >> crap synthesised into actual silicon.
> >> >> 
> >> >>> But FWIW, I did find some relevant info for the peculiar Altera EPCQ
> >> >>> flash here:
> >> >>> 
> >> >>> https://www.altera.com/content/dam/altera-www/global/en_US/pdfs/lite
> >> >>> ra ture/
> >> >>> hb/cfg/cfg_cf52012.pdf
> >> >> 
> >> >> Altera EPCS/EPCQ flashes are just rebranded micron flashes, they just
> >> >> have different JEDEC >ID and are a bit more expensive.
> >> > 
> >> > You can find the document at here
> >> > (https://www.altera.com/content/dam/altera-www/global/en_US/pdfs/liter
> >> > atu re/ug/ug_embedded_ip.pdf)
> >> > 
> >> >  Chapter 42.Page 407.
> >> > 
> >> > For the soft IP issue, i've requested hardware engineer to come out
> >> > the solution.
> > 
> > That's good :)
> > 
> >> > So in the mean way, our driver will NOT support Micron
> >> > flashes until hardware fix is completed.
> > 
> > This doesn't answer my question, so let me reiterate. Is this controller
> > only Soft IP (as in, FPGA core) or is this controller shipping in some
> > chip as Hard IP (as in, piece of silicon) ?
> 
> This is new soft IP.

I see, thanks !

Best regards,
Marek Vasut
