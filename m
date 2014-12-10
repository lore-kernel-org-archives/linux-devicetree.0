From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v4 4/6] fpga manager: add sysfs interface document
Date: Wed, 10 Dec 2014 09:47:24 -0500
Message-ID: <20141210144724.GA17184@kroah.com>
References: <1418156090-23578-1-git-send-email-atull@opensource.altera.com>
 <1418156090-23578-5-git-send-email-atull@opensource.altera.com>
 <c234f48c2ff145b4810cef72482bb49c@BL2FFO11FD045.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c234f48c2ff145b4810cef72482bb49c@BL2FFO11FD045.protection.gbl>
Sender: linux-doc-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: atull@opensource.altera.com, jgunthorpe@obsidianresearch.com, hpa@zytor.com, monstr@monstr.eu, rdunlap@infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, pantelis.antoniou@konsulko.com, robh+dt@kernel.org, grant.likely@linaro.org, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, pavel@denx.de, broonie@kernel.org, philip@balister.org, rubini@gnudd.com, s.trumtrar@pengutronix.de, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, balbi@ti.com, m.chehab@samsung.com, davidb@codeaurora.org, rob@landley.net, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, linus.walleij@linaro.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, yvanderv@opensource.altera.com
List-Id: devicetree@vger.kernel.org

On Wed, Dec 10, 2014 at 10:42:39AM +0100, Michal Simek wrote:
> Hi Greg,
> 
> On 12/09/2014 09:14 PM, atull@opensource.altera.com wrote:
> > From: Alan Tull <atull@opensource.altera.com>
> > 
> > Add documentation for new fpga manager sysfs interface.
> > 
> > Signed-off-by: Alan Tull <atull@opensource.altera.com>
> > ---
> >  Documentation/ABI/testing/sysfs-class-fpga-manager |   38 ++++++++++++++++++++
> >  1 file changed, 38 insertions(+)
> >  create mode 100644 Documentation/ABI/testing/sysfs-class-fpga-manager
> 
> What's the rule for adding sysfs doc for driver which is added to staging?
> Is this location fine?

No, staging drivers should be "self-contained" so when^Wif we delete
them, it is easy to do so :)

Put it in the same directory as your driver.

thanks,

greg k-h
