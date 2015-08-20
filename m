From: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] [PATCH v5] mtd:spi-nor: Add Altera Quad SPI Driver
Date: Thu, 20 Aug 2015 23:52:22 +0200
Message-ID: <201508202352.22313.marex@denx.de>
References: <1440053705-3836-1-git-send-email-vndao@altera.com> <3030745.IsU6n2jnJj@ws-stein> <20150820201925.GD74600@google.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150820201925.GD74600@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: Alexander Stein <alexander.stein@systec-electronic.com>, linux-mtd@lists.infradead.org, vndao@altera.com, dwmw2@infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, ngachi86@gmail.com
List-Id: devicetree@vger.kernel.org

On Thursday, August 20, 2015 at 10:19:25 PM, Brian Norris wrote:
> On Thu, Aug 20, 2015 at 12:06:36PM +0200, Alexander Stein wrote:
> > On Thursday 20 August 2015 10:03:38, Marek Vasut wrote:
> > > > +Example:
> > > > +
> > > > +			quadspi_controller_0: quadspi@0x180014a0 {
> > > > +				compatible = "altr,quadspi-1.0";
> > > > +				reg = <0x180014a0 0x00000020>,
> > > > +				      <0x14000000 0x04000000>;
> > > > +				reg-names = "avl_csr", "avl_mem";
> > > > +				#address-cells = <1>;
> > > > +				#size-cells = <0>;
> > > > +				flash0: epcq256@0 {
> > > > +					compatible = "altr,epcq256";
> > > > +					#address-cells = <1>;
> > > > +					#size-cells = <1>;
> > > > +					partition@0 {
> > > > +						/* 16 MB for raw data. 
*/
> > > > +						label = "EPCQ Flash 0 
raw data";
> > > > +						reg = <0x0 0x1000000>;
> > > > +					};
> > > > +					partition@1000000 {
> > > > +						/* 16 MB for jffs2 data. 
*/
> > > > +						label = "EPCQ Flash 0 
JFFS 2";
> > > > +						reg = <0x1000000 
0x1000000>;
> > > > +					};
> > > 
> > > IIRC, encoding partitions into OF is deprecated (and it shouldn't be
> > > part of the example anyway, so please remove this bit).
> > 
> > Do you mean specifying partitions in OF is deprecated in general? Is
> > there any link for that? What would be an alternative to it?
> 
> This is the first I've heard of such a deprecation. I would argue that
> it's still probably one of the best ways to specify partitions. It's not
> exactly perfect (partitions aren't really "hardware", so may not belong
> in the "hardware description")

Which is the reasoning why I heard it was deprecated, but it seems my
knowledge is not correct. I apologize for the misinformation, sorry.

> , but IMO it's better than cmdlineparts,
> for instance. I also don't really know of any good-enough, generically
> useful on-flash partition formats, especially ones that can handle the
> complexities of NAND.

Right.

Best regards,
Marek Vasut
