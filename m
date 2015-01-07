From: Pavel Machek <pavel@denx.de>
Subject: Re: [PATCH v8 2/4] fpga manager: add sysfs interface document
Date: Wed, 7 Jan 2015 09:48:19 +0100
Message-ID: <20150107084819.GA1887@amd>
References: <1420575219-27061-1-git-send-email-atull@opensource.altera.com>
 <1420575219-27061-3-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <1420575219-27061-3-git-send-email-atull@opensource.altera.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: atull@opensource.altera.com
Cc: mark.rutland@arm.com, linux-doc@vger.kernel.org, rubini@gnudd.com, pantelis.antoniou@konsulko.com, hpa@zytor.com, s.trumtrar@pengutronix.de, devel@driverdev.osuosl.org, sameo@linux.intel.com, nico@linaro.org, ijc+devicetree@hellion.org.uk, michal.simek@xilinx.com, kyle.teske@ni.com, jgunthorpe@obsidianresearch.com, grant.likely@linaro.org, davidb@codeaurora.org, linus.walleij@linaro.org, cesarb@cesarb.net, devicetree@vger.kernel.org, jason@lakedaemon.net, pawel.moll@arm.com, iws@ovro.caltech.edu, broonie@kernel.org, philip@balister.org, dinguyen@opensource.altera.com, monstr@monstr.eu, gregkh@linuxfoundation.org, yvanderv@opensource.altera.com, linux-kernel@vger.kernel.org, balbi@ti.com, delicious.quinoa@gmail.com, robh+dt@kernel.org, rob@landley.net, galak@codeaurora.org, akpm@linux-foundation.org, davem@davemloft.net, m.chehab@samsung.com
List-Id: devicetree@vger.kernel.org

On Tue 2015-01-06 14:13:37, atull@opensource.altera.com wrote:
> From: Alan Tull <atull@opensource.altera.com>
> 
> Add documentation under drivers/staging for new fpga manager's
> sysfs interface.
> 
> Signed-off-by: Alan Tull <atull@opensource.altera.com>
> ---
> v5  : (actually second version, but keeping version numbers
>       aligned with rest of patch series)
>       Move document to drivers/staging/fpga/Documentation/ABI
> 
> v6  : No change in this patch for v6 of the patch set
> 
> v7  : No change in this patch for v7 of the patch set
> 
> v8  : No change in this patch for v8 of the patch set
> ---
>  .../Documentation/ABI/sysfs-class-fpga-manager     |   38 ++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 drivers/staging/fpga/Documentation/ABI/sysfs-class-fpga-manager
> 
> diff --git a/drivers/staging/fpga/Documentation/ABI/sysfs-class-fpga-manager b/drivers/staging/fpga/Documentation/ABI/sysfs-class-fpga-manager
> new file mode 100644
> index 0000000..eb600f2
> --- /dev/null
> +++ b/drivers/staging/fpga/Documentation/ABI/sysfs-class-fpga-manager
> @@ -0,0 +1,38 @@
> +What:		/sys/class/fpga_manager/<fpga>/name
> +Date:		October 2014
> +KernelVersion:	3.18
> +Contact:	Alan Tull <atull@opensource.altera.com>
> +Description:	Name of low level driver.
> +
> +What:		/sys/class/fpga_manager/<fpga>/firmware
> +Date:		October 2014
> +KernelVersion:	3.18
> +Contact:	Alan Tull <atull@opensource.altera.com>
> +Description:	Name of the FPGA image file to load using firmware
> class.

This one is ugly: it unneccessarily passes firmware name through the
kernel. Just make interface and code simpler by always passing
"socfpga-fpga-image" or something like that.

Thanks,
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
