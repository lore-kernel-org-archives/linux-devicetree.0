From: Pavel Machek <pavel@denx.de>
Subject: Re: [PATCH v9 1/7] staging: usage documentation for FPGA manager core
Date: Thu, 23 Jul 2015 08:38:55 +0200
Message-ID: <20150723063854.GA23318@amd>
References: <1437148277-5405-1-git-send-email-atull@opensource.altera.com>
 <1437148277-5405-2-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1437148277-5405-2-git-send-email-atull@opensource.altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: atull@opensource.altera.com
Cc: gregkh@linuxfoundation.org, jgunthorpe@obsidianresearch.com, hpa@zytor.com, monstr@monstr.eu, michal.simek@xilinx.com, rdunlap@infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, pantelis.antoniou@konsulko.com, robh+dt@kernel.org, grant.likely@linaro.org, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, broonie@kernel.org, philip@balister.org, rubini@gnudd.com, s.trumtrar@pengutronix.de, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, balbi@ti.com, m.chehab@samsung.com, davidb@codeaurora.org, rob@landley.net, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, linus.walleij@linaro.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devel@driverdev.osuosl.org, Petr Cvek <petr.cvek@tul.cz>, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, yvande
List-Id: devicetree@vger.kernel.org

On Fri 2015-07-17 10:51:11, atull@opensource.altera.com wrote:
> From: Alan Tull <atull@opensource.altera.com>
> 
> Add a document on the new FPGA manager core.
> 

> --- /dev/null
> +++ b/drivers/staging/fpga/Documentation/fpga-mgr.txt
> @@ -0,0 +1,117 @@
> +  FPGA Manager Core
> +
> +  Alan Tull 2015
> +
> +  Overview
> +  --------

The formatting is quite funny here. Add a newline after ---'s? Or
better format it the way other documents are formatted?

> +The FPGA manager core exports a set of functions for programming an image to a

"into"?

> +FPGA.  All manufacturor specifics are hidden away in a low level driver.  The

manufacturer (more then one instance).

> +API is manufacturor agnostic.  Of course the FPGA image data itself is very
> +manufacturor specific but for our purposes it's just data in a buffer or file

, but

> +or something.  The FPGA manager core won't parse it or know anything about it.

kill "or know anything"?

> +  Files
> +  -----
> +drivers/staging/fpga/fpga-mgr.c
> +include/linux/fpga/fpga-mgr.h
> +

Kill this section, as it is going to change?

> +  The API Functions
> +  ----------------
> +The API that is exported is currently 6 functions:
> +
> +   int fpga_mgr_buf_load(struct fpga_manager *mgr,
> +                         u32 flags,
> +                         const char *buf,
> +                         size_t count);
> +
> +An FPGA image exists as a buffer in memory.  Load it into the FPGA.  The FPGA
> +ends up in operating mode or return a negative error code.

So 0 on success?

> +   int fpga_mgr_firmware_load(struct fpga_manager *mgr,
> +                              u32 flags,
> +                              const char *image_name);
> +
> +An FPGA image exists as a file that is on the firmware search path (see the

", that is in"

> +firmware class documentation).  Load as above.
> +
> +   struct fpga_manager *of_fpga_mgr_get(struct device_node *node);
> +
> +Given a DT node, get a reference to a fpga manager.

fpga->FPGA, fix globally??

> +   void fpga_mgr_put(struct fpga_manager *mgr);
> +
> +Release the reference to the fpga manager.
> +
> +   int fpga_mgr_register(struct device *dev,
> +                         const char *name,
> +                         const struct fpga_manager_ops *mops,
> +                         void *priv);
> +   void fpga_mgr_unregister(struct device *dev);
> +
> +Register/unregister the lower level device specific driver.

"low level".. And "device specific" -> "FPGA-specific" ?


> +To add another fpga manager, look at the bottom part of socfpga.c for an
> +example, starting with the declaration of socfpga_fpga_ops.

Umm. You have good documentation below. Maybe you don't need to send
people to read sources...?

> +static const struct fpga_manager_ops socfpga_fpga_ops = {
> +       .write_init = socfpga_fpga_ops_configure_init,
> +       .write = socfpga_fpga_ops_configure_write,
> +       .write_complete = socfpga_fpga_ops_configure_complete,
> +       .state = socfpga_fpga_ops_state,
> +};
> +
> +You will want to create a platform driver that has a set of ops like that
> +and then register it with fpga_mgr_register in your probe function.  Your
> +ops will implement whatever device specific register writes needed and
> +will return negative error codes if things don't go well.
> +
> +The programming seqence is:

sequence.

> + 1. .write_init
> + 2. .write (may be called once or multiple times)
> + 3. .write_complete
> +
> +The .write_init function will prepare the FPGA to receive the image data.
> +
> +The .write function receives an image buffer or a chunk of the image and
> +writes it the FPGA.  The buffer may arrive as one chunk or a bunck
> of

bunch.

> +small chunks through this function being called multiple times.
> +
> +The .write_complete function is called after all the image has been written
> +to put the FPGA into operating mode.
> +
> +The .state function will read your hardware and return a code of type
> +"enum fpga_mgr_states".  It doesn't result in a change in hardware state.

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
