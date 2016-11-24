From: Emmanuel Vadot <manu@bidouilliste.com>
Subject: Re: [PATCH] ARM: dts: sunxi: Enable UEXT related nodes for Olimex
 A20 SOM EVB
Date: Thu, 24 Nov 2016 21:08:34 +0100
Message-ID: <20161124210834.a7da24a53b09364e8ab391d6@bidouilliste.com>
References: <20161121164911.76900-1-manu@bidouilliste.com>
 <20161123080350.fstwdfndghk7c5xx@lukather>
 <20161123181610.cae67ad53f5f69246d341b30@bidouilliste.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161123181610.cae67ad53f5f69246d341b30@bidouilliste.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, wens@csie.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, 23 Nov 2016 18:16:10 +0100
Emmanuel Vadot <manu@bidouilliste.com> wrote:

> On Wed, 23 Nov 2016 09:03:50 +0100
> Maxime Ripard <maxime.ripard@free-electrons.com> wrote:
> 
> > On Mon, Nov 21, 2016 at 05:49:11PM +0100, Emmanuel Vadot wrote:
> > > UEXT are Universal EXTension connector from Olimex. They embed i2c, spi
> > > and uart pins along power in one connector and are found on most,
> > > if not all, Olimex boards.
> > > The Olimex A20 SOM EVB have two UEXT connector so enable the nodes found on
> > > those two connectors.
> > > 
> > > Signed-off-by: Emmanuel Vadot <manu@bidouilliste.com>
> > 
> > Fixed the indentation of the spi pinctrl cells, and applied.
> > 
> > Please note that I'm note planning to send any new pull request, so
> > this will likely end up in 4.11.
> > 
> > Thanks!
> > Maxime
> > 
> > -- 
> > Maxime Ripard, Free Electrons
> > Embedded Linux and Kernel engineering
> > http://free-electrons.com
> 
>  Sorry about the indentation, I'll be more carefull next time.
> 
>  Thank you.
> 
> -- 
> Emmanuel Vadot <manu@bidouilliste.com> <manu@freebsd.org>
> 

 Hi Maxime,

 Re-reading the patch I've seen that I've not enabled the SPI nodes, I
guess it's easier if you revert my patch and that I send a new one ?

 Cheers,

-- 
Emmanuel Vadot <manu@bidouilliste.com> <manu@freebsd.org>
