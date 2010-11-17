From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 1/7] OF: make drivers depend on CONFIG_OF instead of
	CONFIG_PPC_OF
Date: Wed, 17 Nov 2010 08:25:04 -0700
Message-ID: <20101117152504.GB5757@angua.secretlab.ca>
References: <1289939635-30742-1-git-send-email-robherring2@gmail.com>
	<1289939635-30742-2-git-send-email-robherring2@gmail.com>
	<20101117054337.GG12813@angua.secretlab.ca>
	<4CE3EC7B.4020404@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4CE3EC7B.4020404-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 17, 2010 at 08:53:47AM -0600, Rob Herring wrote:
> Grant,
> 
> On 11/16/2010 11:43 PM, Grant Likely wrote:
> >On Tue, Nov 16, 2010 at 02:33:49PM -0600, Rob Herring wrote:
> >>From: Rob Herring<rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> >>
> >>Some OF drivers could likely be used on non-powerpc OF based platforms,
> >>so fix the kconfig depends to be CONFIG_OF instead of CONFIG_PPC_OF
> >>
> >>Signed-off-by: Rob Herring<rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> >>---
> >>  drivers/char/ipmi/ipmi_si_intf.c |   14 +++++++-------
> >>  drivers/mmc/host/Kconfig         |    2 +-
> >>  drivers/mtd/Kconfig              |    2 +-
> >>  drivers/mtd/maps/Kconfig         |    2 +-
> >>  drivers/net/can/sja1000/Kconfig  |    4 ++--
> >>  drivers/serial/Kconfig           |    2 +-
> >>  drivers/usb/host/isp1760-if.c    |    8 ++++----
> >>  7 files changed, 17 insertions(+), 17 deletions(-)
> >>
> >>diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_si_intf.c
> >>index 035da9e..1b33a42 100644
> >>--- a/drivers/char/ipmi/ipmi_si_intf.c
> >>+++ b/drivers/char/ipmi/ipmi_si_intf.c
> >>@@ -66,7 +66,7 @@
> >>  #include<linux/ctype.h>
> >>  #include<linux/pnp.h>
> >>
> >>-#ifdef CONFIG_PPC_OF
> >>+#ifdef CONFIG_OF
> >>  #include<linux/of_device.h>
> >>  #include<linux/of_platform.h>
> >>  #endif
> >>@@ -308,7 +308,7 @@ static int pci_registered;
> >>  #ifdef CONFIG_ACPI
> >>  static int pnp_registered;
> >>  #endif
> >>-#ifdef CONFIG_PPC_OF
> >>+#ifdef CONFIG_OF
> >>  static int of_registered;
> >>  #endif
> >>
> >>@@ -2540,7 +2540,7 @@ static struct pci_driver ipmi_pci_driver = {
> >>  #endif /* CONFIG_PCI */
> >>
> >>
> >>-#ifdef CONFIG_PPC_OF
> >>+#ifdef CONFIG_OF
> >>  static int __devinit ipmi_of_probe(struct platform_device *dev,
> >>  			 const struct of_device_id *match)
> >>  {
> >>@@ -2646,7 +2646,7 @@ static struct of_platform_driver ipmi_of_platform_driver = {
> >>  	.probe		= ipmi_of_probe,
> >>  	.remove		= __devexit_p(ipmi_of_remove),
> >>  };
> >>-#endif /* CONFIG_PPC_OF */
> >>+#endif /* CONFIG_OF */
> >
> >Nack on this hunk.  of_platform_drivers are now deprecated and the
> >regular platform_driver should be used instead.  Instead of extending
> >the of_platform_driver usage to all the architectures, please move the
> >of_match_table and the probe/remove routines into the platform_driver.
> >
> 
> Okay, no problem. How do I get the match ptr or more importantly the
> data ptr from the match table? Do I have to call of_match_device
> within probe func?

yes.

g.
