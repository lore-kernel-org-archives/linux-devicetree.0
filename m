From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH v10 1/8] usage documentation for FPGA manager core
Date: Fri, 14 Aug 2015 09:38:02 -0500
Message-ID: <alpine.DEB.2.02.1508140935040.1866@linuxheads99>
References: <1439487452-23977-1-git-send-email-atull@opensource.altera.com> <1439487452-23977-3-git-send-email-atull@opensource.altera.com> <CAAtXAHdpw=S=zMPPfCVV9EjQsBFH8MkuNCXPuK-M6DskkBFi7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CAAtXAHdpw=S=zMPPfCVV9EjQsBFH8MkuNCXPuK-M6DskkBFi7g@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Moritz Fischer <moritz.fischer@ettus.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, hpa@zytor.com, Michal Simek <monstr@monstr.eu>, Michal Simek <michal.simek@xilinx.com>, rdunlap@infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, robh+dt@kernel.org, Grant Likely <grant.likely@linaro.org>, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, pavel@denx.de, broonie@kernel.org, Philip Balister <philip@balister.org>, rubini@gnudd.com, s.trumtrar@pengutronix.de, jason@lakedaemon.net, kyle.teske@ni.com, Nicolas Pitre <nico@linaro.org>, balbi@ti.com, m.chehab@samsung.com, David Brown <davidb@codeaurora.org>, Rob Landley <rob@landley.net>, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, Linus Walleij <linus.walleij@lin>
List-Id: devicetree@vger.kernel.org

On Thu, 13 Aug 2015, Moritz Fischer wrote:

Hi Moritz,

Thanks for the review.  Will include your two nits in v11.

> Hi Alan,
> 
> thanks for continuing to work on this :) A couple of minor nits ...
> 
> On Thu, Aug 13, 2015 at 10:37 AM,  <atull@opensource.altera.com> wrote:
> > From: Alan Tull <atull@opensource.altera.com>
> >
> > Add a document on the new FPGA manager core.
> >
> > Signed-off-by: Alan Tull <atull@opensource.altera.com>
> > ---
> > v9:  initial version where this patch was added
> >
> > v10: requested cleanups to formatting and otherwise
> >      s/fpga/FPGA/g
> >      rewrite implementation section to not reference socfpga.c by name
> >      other rewrites
> >      Moved to Documentation/fpga/
> > ---
> >  Documentation/fpga/fpga-mgr.txt |  171 +++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 171 insertions(+)
> >  create mode 100644 Documentation/fpga/fpga-mgr.txt
> >
> > diff --git a/Documentation/fpga/fpga-mgr.txt b/Documentation/fpga/fpga-mgr.txt
> > new file mode 100644
> > index 0000000..c5259e4
> > --- /dev/null
> > +++ b/Documentation/fpga/fpga-mgr.txt
> > @@ -0,0 +1,171 @@
> > +FPGA Manager Core
> > +
> > +Alan Tull 2015
> > +
> > +Overview
> > +========
> > +
> > +The FPGA manager core exports a set of functions for programming an FPGA with
> > +image.  The API is manufacturer agnostic.  All manufacturer specifics are
> ... with an image ?

Yes

> > +hidden away in a low level driver which registers a set of ops with the core.
> > +The FPGA image data itself is very manufacturer specific, but for our purposes
> > +it's just binary data.  The FPGA manager core won't parse it.
> > +
> > +
> > +API Functions:
> > +==============
> > +
> > +To program the FPGA from a file or from a buffer:
> > +-------------------------------------------------
> > +
> > +       int fpga_mgr_buf_load(struct fpga_manager *mgr, u32 flags,
> > +                             const char *buf, size_t count);
> > +
> > +Load the FPGA from an image which exists as a buffer in memory.
> > +
> > +       int fpga_mgr_firmware_load(struct fpga_manager *mgr, u32 flags,
> > +                                  const char *image_name);
> > +
> > +Load the FPGA from an image which exists as a file.  The image file must be on
> > +the firmware search path (see the firmware class documentation).
> > +
> > +For both these functions, flags == 0 for normal full reconfiguration or
> > +FPGA_MGR_PARTIAL_RECONFIG for partial reconfiguration.  If successful, the FPGA
> > +ends up in operating mode.  Return 0 on success or a negative error code.
> > +
> > +
> > +To get/put a reference to a FPGA manager:
> > +-----------------------------------------
> > +
> > +       struct fpga_manager *of_fpga_mgr_get(struct device_node *node);
> > +
> > +       void fpga_mgr_put(struct fpga_manager *mgr);
> > +
> > +Given a DT node, get an exclusive reference to a FPGA manager or release
> > +the reference.
> > +
> > +
> > +To register or unregister the low level FPGA-specific driver:
> > +-------------------------------------------------------------
> > +
> > +       int fpga_mgr_register(struct device *dev, const char *name,
> > +                             const struct fpga_manager_ops *mops,
> > +                             void *priv);
> > +
> > +       void fpga_mgr_unregister(struct device *dev);
> > +
> > +Use of these two functions is described below in "How To Support a new FPGA
> > +device."
> > +
> > +
> > +How to write an image buffer to a supported FPGA
> > +================================================
> > +/* Include to get the API */
> > +#include <linux/fpga/fpga-mgr.h>
> > +
> > +/* device node that specifies the FPGA manager to use */
> > +struct device_node *mgr_node = ...
> > +
> > +/* FPGA image is in this buffer.  count is size of the buffer. */
> > +char *buf = ...
> > +int count = ...
> > +
> > +/* flags indicates whether to do full or partial reconfiguration */
> > +int flags = 0;
> > +
> > +int ret;
> > +
> > +/* Get exclusive control of FPGA manager */
> > +struct fpga_manager *mgr = of_fpga_mgr_get(mgr_node);
> > +
> > +/* Load the buffer to the FPGA */
> > +ret = fpga_mgr_buf_load(mgr, flags, buf, count);
> > +
> > +/* Release the FPGA manager */
> > +fpga_mgr_put(mgr);
> > +
> > +
> > +How to write an image file to a supported FPGA
> > +==============================================
> > +/* Include to get the API */
> > +#include <linux/fpga/fpga-mgr.h>
> > +
> > +/* device node that specifies the FPGA manager to use */
> > +struct device_node *mgr_node = ...
> > +
> > +/* FPGA image is in this file which is on the firmware search path */
> ... in the firmware search path .. not sure if that's better though :)

I think on or in are pretty equally good here, but I'll go with 'in'.

> > +const char *path = "fpga-image-9.rbf"
> > +
> > +/* flags indicates whether to do full or partial reconfiguration */
> > +int flags = 0;
> > +
> > +int ret;
> > +
> > +/* Get exclusive control of FPGA manager */
> > +struct fpga_manager *mgr = of_fpga_mgr_get(mgr_node);
> > +
> > +/* Get the firmware image (path) and load it to the FPGA */
> > +ret = fpga_mgr_firmware_load(mgr, flags, path);
> > +
> > +/* Release the FPGA manager */
> > +fpga_mgr_put(mgr);
> > +
> > +
> > +How to support a new FPGA device
> > +================================
> > +To add another FPGA manager, write a driver that implements a set of ops.  The
> > +probe function calls fpga_mgr_register(), such as:
> > +
> > +static const struct fpga_manager_ops socfpga_fpga_ops = {
> > +       .write_init = socfpga_fpga_ops_configure_init,
> > +       .write = socfpga_fpga_ops_configure_write,
> > +       .write_complete = socfpga_fpga_ops_configure_complete,
> > +       .state = socfpga_fpga_ops_state,
> > +};
> > +
> > +static int socfpga_fpga_probe(struct platform_device *pdev)
> > +{
> > +       struct device *dev = &pdev->dev;
> > +       struct socfpga_fpga_priv *priv;
> > +       int ret;
> > +
> > +       priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +       if (!priv)
> > +               return -ENOMEM;
> > +
> > +       /* ... do ioremaps, get interrupts, etc. and save
> > +          them in priv... */
> > +
> > +       return fpga_mgr_register(dev, "Altera SOCFPGA FPGA Manager",
> > +                                &socfpga_fpga_ops, priv);
> > +}
> > +
> > +static int socfpga_fpga_remove(struct platform_device *pdev)
> > +{
> > +       fpga_mgr_unregister(&pdev->dev);
> > +
> > +       return 0;
> > +}
> > +
> > +
> > +The ops will implement whatever device specific register writes are needed to
> > +do the programming sequence for this particular FPGA.  These ops return 0 for
> > +success or negative error codes otherwise.
> > +
> > +The programming sequence is:
> > + 1. .write_init
> > + 2. .write (may be called once or multiple times)
> > + 3. .write_complete
> > +
> > +The .write_init function will prepare the FPGA to receive the image data.
> > +
> > +The .write function writes a buffer to the FPGA. The buffer may be contain the
> > +whole FPGA image or may be a smaller chunk of an FPGA image.  In the latter
> > +case, this function is called multiple times for successive chunks.
> > +
> > +The .write_complete function is called after all the image has been written
> > +to put the FPGA into operating mode.
> > +
> > +The ops include a .state function which will read the hardware FPGA manager and
> > +return a code of type enum fpga_mgr_states.  It doesn't result in a change in
> > +hardware state.
> > --
> > 1.7.9.5
> >
> 
> Cheers,
> 
> Moritz
> 
