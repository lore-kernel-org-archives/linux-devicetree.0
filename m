From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH v10 3/8] add fpga manager core
Date: Fri, 14 Aug 2015 09:33:13 -0500
Message-ID: <alpine.DEB.2.02.1508140925560.1866@linuxheads99>
References: <1439487452-23977-1-git-send-email-atull@opensource.altera.com> <1439487452-23977-5-git-send-email-atull@opensource.altera.com> <CAAtXAHc=+nzcDQ-=-gkj=BfpjCeMu-nu5yW6bZPhB3w1=_Ek7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CAAtXAHc=+nzcDQ-=-gkj=BfpjCeMu-nu5yW6bZPhB3w1=_Ek7g@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Moritz Fischer <moritz.fischer@ettus.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, hpa@zytor.com, Michal Simek <monstr@monstr.eu>, Michal Simek <michal.simek@xilinx.com>, rdunlap@infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, robh+dt@kernel.org, Grant Likely <grant.likely@linaro.org>, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, pavel@denx.de, broonie@kernel.org, Philip Balister <philip@balister.org>, rubini@gnudd.com, s.trumtrar@pengutronix.de, jason@lakedaemon.net, kyle.teske@ni.com, Nicolas Pitre <nico@linaro.org>, balbi@ti.com, m.chehab@samsung.com, David Brown <davidb@codeaurora.org>, Rob Landley <rob@landley.net>, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, Linus Walleij <linus.walleij@lin>
List-Id: devicetree@vger.kernel.org

On Fri, 14 Aug 2015, Moritz Fischer wrote:

> Hi Alan,
> 
> I've updated my Zynq driver (it can be found in an older version
> against your v8 in the Xilinx tree, too)
> 
> https://github.com/mfischer/linux/tree/alan-fpga-mgr-v10

Since we are both already using this and have been for a while now, I hope it
can go up into the mainstream instead of continuing to exist only in Altera
and Xilinx's git trees.

> 
> to use your v10 version of the patch. Either I'm using the API wrong ,
> or it never gets to the 'operating state'.

I'm sure you are doing it right.

> > +       }
> > +
> > +       /*
> > +        * After all the FPGA image has been written, do the device specific
> > +        * steps to finish and set the FPGA into operating mode.
> > +        */
> > +       mgr->state = FPGA_MGR_STATE_WRITE_COMPLETE;
> > +       ret = mgr->mops->write_complete(mgr, flags);
> > +       if (ret) {
> > +               dev_err(dev, "Error after writing image data to FPGA\n");
> > +               mgr->state = FPGA_MGR_STATE_WRITE_COMPLETE_ERR;
> > +               return ret;
> > +       }
> Maybe I'm misunderstanding something here. Shouldn't we set mgr->state
> = FPGA_MGR_STATE_OPERATING
> here, seen that the _show function below uses the mgr->state?

The FPGA gets programmed, but state wasn't getting updated.
Should have "mgr->state = FPGA_MGR_STATE_OPERATING" here.
Will add in v11.

Thanks for the review and the ack.  If you see anything else that seems
wrong, please let me know.

Alan
