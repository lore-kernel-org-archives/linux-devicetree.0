From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/5] dt-bindings: media: sun6i: Add vcc-csi supply
 property
Date: Wed, 19 Dec 2018 10:01:20 -0600
Message-ID: <20181219160120.GB22708@bogus>
References: <20181203100747.16442-1-jagan@amarulasolutions.com>
 <20181203100747.16442-3-jagan@amarulasolutions.com>
 <CAGb2v66pG0kes1_xBNUj4z85fjunjP_Fe5_pPiRja=nDSOS01A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v66pG0kes1_xBNUj4z85fjunjP_Fe5_pPiRja=nDSOS01A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Yong Deng <yong.deng@magewell.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Mark Rutland <mark.rutland@arm.com>, Linux Media Mailing List <linux-media@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 03, 2018 at 06:11:35PM +0800, Chen-Yu Tsai wrote:
> On Mon, Dec 3, 2018 at 6:08 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >
> > Most of the Allwinner A64 CSI controllers are supply with
> > VCC-PE pin. which need to supply for some of the boards to
> > trigger the power.
> >
> > So, document the supply property as vcc-csi so-that the required
> > board can eable it via device tree.
> >
> > Used vcc-csi instead of vcc-pe to have better naming convention
> > wrt other controller pin supplies.
> 
> This is not related to the CSI controller. It belongs in the pin
> controller, but that has its own set of problems like possible
> circular dependencies.

That might be a better choice, but I think most platforms put the supply 
in the module node. But that wouldn't work well if the module is not 
used and you want to use the pins for GPIO or some other function. Maybe 
we don't hit that property because most I/O supplies are always on.

Rob
