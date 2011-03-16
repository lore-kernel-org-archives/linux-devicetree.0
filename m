From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 5/7] mmc: support sdhci-esdhc-imx as an OF device
Date: Wed, 16 Mar 2011 22:39:16 +0800
Message-ID: <20110316143915.GE11658@S2100-06.ap.freescale.net>
References: <1300112759-3495-1-git-send-email-shawn.guo@linaro.org>
	<1300112759-3495-6-git-send-email-shawn.guo@linaro.org>
	<20110315195926.GB20845@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110315195926.GB20845-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 15, 2011 at 01:59:26PM -0600, Grant Likely wrote:
> On Mon, Mar 14, 2011 at 10:25:57PM +0800, Shawn Guo wrote:
> > Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> dt support can be added directly to sdchi-pltfm.c drivers now.  There
> is no longer any need to use sdhci-of-core.c any more.  For an
> example, see the patch titled "of/tegra: add sdhci device tree
> handling" in my devicetree/test branch.
> 
I mentioned this a little bit in the cover letter of the patch set
as below.

"This patch set is to support sdhci-esdhc-imx as an OF device.  As
there is already powerpc based esdhc OF support, it chose to add OF
support for imx esdhc driver in a different way from what sdhci-tegra
did."

The tegra approach you made was one of the two options I had, and I
happened to love the another more, as it consolidates the eSDHC OF
driver for Freescale MPCxxx and i.MX family.

I can turn it around to your approach if you can convince me :)

-- 
Regards,
Shawn
