From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] ARM:boot:device tree: Allow the device tree binary to be
	appended to zImage
Date: Tue, 15 Mar 2011 02:03:50 -0600
Message-ID: <20110315080350.GN23050@angua.secretlab.ca>
References: <20110309215800.26377.43925.stgit@riker>
	<20110315034421.GE11098@S2100-06.ap.freescale.net>
	<20110315075231.GH11098@S2100-06.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110315075231.GH11098-+NayF8gZjK2ctlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 15, 2011 at 03:52:32PM +0800, Shawn Guo wrote:
> On Tue, Mar 15, 2011 at 11:44:22AM +0800, Shawn Guo wrote:
> > On Wed, Mar 09, 2011 at 01:58:00PM -0800, John Bonesio wrote:
> > > This patch provides the ability to boot using a device tree that is appended
> > > to the raw binary zImage (e.g. cat zImage <filename>.dtb > zImage_w_dtb).
> > > 
> > > Signed-off-by: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> > > ---
> > > 
> > >  arch/arm/Kconfig                |    7 ++++
> > >  arch/arm/boot/compressed/head.S |   75 +++++++++++++++++++++++++++++++++++++--
> > >  2 files changed, 79 insertions(+), 3 deletions(-)
> > > 
> > I played this patch on mx51 babbage a little bit, and noticed that it
> > introduces one difference on both non-dt and dt kernel booting.  The
> 
> To be clear, the difference is being seen when I do not even enable
> CONFIG_ARM_APPENDED_DTB.

That would definitely be a bug then.

g.
