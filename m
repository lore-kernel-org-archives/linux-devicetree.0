From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH v2 2/3] ARM: dts: socfpga: fpga bridges bindings docs
Date: Tue, 28 Oct 2014 16:53:47 -0500
Message-ID: <alpine.DEB.2.02.1410281651490.11910@atx-linux-37>
References: <1414108267-22058-1-git-send-email-atull@opensource.altera.com> <1414108267-22058-3-git-send-email-atull@opensource.altera.com> <20141024070042.GL10262@pengutronix.de> <alpine.DEB.2.02.1410281601570.11910@atx-linux-37>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.02.1410281601570.11910@atx-linux-37>
Sender: linux-doc-owner@vger.kernel.org
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: jgunthorpe@obsidianresearch.com, hpa@zytor.com, monstr@monstr.eu, michal.simek@xilinx.com, rdunlap@infradead.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, pantelis.antoniou@konsulko.com, robh+dt@kernel.org, grant.likely@linaro.org, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, pavel@denx.de, broonie@kernel.org, philip@balister.org, rubini@gnudd.com, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, balbi@ti.com, m.chehab@samsung.com, davidb@codeaurora.org, rob@landley.net, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, linus.walleij@linaro.org, mgerlach@opensource.altera.com, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, yvanderv@opensource.altera.com
List-Id: devicetree@vger.kernel.org

On Tue, 28 Oct 2014, atull wrote:

> On Fri, 24 Oct 2014, Steffen Trumtrar wrote:

> > 
> > > + - init-val       : 0 if driver should disable bridge at startup
> > > +                    1 if driver should enable bridge at startup
> > > +                    driver leaves bridge in current state if property not
> > > +                    specified.
> > > +
> > 
> > Configuration in the DT? Really?

The FPGA can be programmed by several different methods (eeprom, jtag,
preloader, Linux).  The guiding principle is: whoever programmed the
FPGA should release the bridge.  At one point, we thought 'init-val'
would be needed, but I think it can be taken out and we won't miss it.

Alan
