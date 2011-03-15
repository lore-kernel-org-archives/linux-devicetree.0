From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] ARM:boot:device tree: Allow the device tree binary to
	be appended to zImage
Date: Tue, 15 Mar 2011 15:52:32 +0800
Message-ID: <20110315075231.GH11098@S2100-06.ap.freescale.net>
References: <20110309215800.26377.43925.stgit@riker>
	<20110315034421.GE11098@S2100-06.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110315034421.GE11098-+NayF8gZjK2ctlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 15, 2011 at 11:44:22AM +0800, Shawn Guo wrote:
> On Wed, Mar 09, 2011 at 01:58:00PM -0800, John Bonesio wrote:
> > This patch provides the ability to boot using a device tree that is appended
> > to the raw binary zImage (e.g. cat zImage <filename>.dtb > zImage_w_dtb).
> > 
> > Signed-off-by: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> > ---
> > 
> >  arch/arm/Kconfig                |    7 ++++
> >  arch/arm/boot/compressed/head.S |   75 +++++++++++++++++++++++++++++++++++++--
> >  2 files changed, 79 insertions(+), 3 deletions(-)
> > 
> I played this patch on mx51 babbage a little bit, and noticed that it
> introduces one difference on both non-dt and dt kernel booting.  The

To be clear, the difference is being seen when I do not even enable
CONFIG_ARM_APPENDED_DTB.

-- 
Regards,
Shawn

> serial terminal stalls for a few seconds after printing
> 'Uncompressing Linux...', and then continue to work with all message
> output.  That's something like:
> 
> Uncompressing Linux... (stall for seconds) done, booting the kernel.
> Linux version 2.6.38-rc6+ (r65073@S2101-09) (gcc version 4.4.5 (Ubuntu/Linaro 4.
> 4.4-14ubuntu4) ) #91 Tue Mar 15 11:29:03 CST 2011
> CPU: ARMv7 Processor [412fc085] revision 5 (ARMv7), cr=10c53c7f
> CPU: VIPT nonaliasing data cache, VIPT aliasing instruction cache
> Machine: Freescale MX51 Babbage Board
> Machine: Freescale MX51 Babbage Board
> Memory policy: ECC disabled, Data cache writeback
> Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 130048
> ......
> 
> I'm unsure if this is expected ...
> 
