From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: Re: [PATCH v2] ARM: socfpga: dts: add fpga manager
Date: Tue, 13 Oct 2015 22:33:44 +0200
Message-ID: <20151013203344.GE17155@pengutronix.de>
References: <1444765139-2040-1-git-send-email-atull@opensource.altera.com>
 <alpine.DEB.2.02.1510131450480.4441@linux-builds1>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.02.1510131450480.4441@linux-builds1>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Dinh Nguyen <dinguyen@opensource.altera.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Alan Tull <atull@opensource.altera.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, delicious.quinoa@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 13, 2015 at 02:51:28PM -0500, Dinh Nguyen wrote:
> On Tue, 13 Oct 2015, atull@opensource.altera.com wrote:
> 
> > From: Alan Tull <atull@opensource.altera.com>
> > 
> > Add FPGA manager to device tree for SoCFPGA.
> > 
> > Signed-off-by: Alan Tull <atull@opensource.altera.com>
> > ---
> > v2: Remove 0x after @
> >     No caps in hex numbers
> >     renamed hps_0_fpgamgr to fpgamgr0
> >     move node to be in alpha order by node name
> > ---
> >  arch/arm/boot/dts/socfpga.dtsi | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> 
> Applied!

What about the

"Also, you need to document the "altr,socfpga-fpga-mgr"."

you mentioned in v1 ???

Regards,
Steffen

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
