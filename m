From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] arm/dt: Add basic device tree support for mx53 loco board
Date: Fri, 1 Apr 2011 00:36:16 +0800
Message-ID: <20110331163615.GA25866@S2100-06.ap.freescale.net>
References: <1301387820-18299-1-git-send-email-jason.hui@linaro.org>
	<2CF7613B9822A943BEF13EF7ACEC5BD1173561@039-SN1MPN1-001.039d.mgd.msft.net>
	<20110331035215.GC21226@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110331035215.GC21226-e0URQFbLeQY2iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: "linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org" <linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, "patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Jason Liu <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liu Hui-R64343 <r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Grant,

On Wed, Mar 30, 2011 at 09:52:15PM -0600, Grant Likely wrote:
> On Tue, Mar 29, 2011 at 10:34:12AM +0000, Liu Hui-R64343 wrote:
> > Hi, Grant,
> > The two patches for mx51/mx53 DT support have the same issue, which 
> > is the S-O-B will be missed when you git am. Let me know if you want me
> > re-send the two patches or you would take care when you am it? Thanks,
> 
> I fixed it up.  Don't worry about it.
> 
I'm little confused by the Kconfig changes in this patch.  I saw your
comments on SMDKV310 patch as below.  But this patch was accepted with
MX5_DT_COMMON selected, which in turn selects USE_OF and
PROC_DEVICETREE.

--- quota begins ---
> diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
> index a021b52..78f5924 100644
> --- a/arch/arm/mach-exynos4/Kconfig
> +++ b/arch/arm/mach-exynos4/Kconfig
> @@ -123,6 +123,7 @@ config MACH_SMDKV310
>  	select EXYNOS4_SETUP_I2C1
>  	select EXYNOS4_SETUP_KEYPAD
>  	select EXYNOS4_SETUP_SDHCI
> +	select USE_OF

I would drop this bit (I dropped it from my branch when I applied the
patch).  Device tree support remains an optional feature.  Instead it
can be enabled by default in the defconfig (or however the config is
managed for the kernel package)
--- quota ends ---

BTW, are you silently renaming the original devicetree/test branch
to devicetree/test-2.6.38 and using new devicetree/test for Nicolas
to pull Linaro bits?  If that is the case, what branch
devicetree/arm-linaro-2.6.38-rebuilt will be for?

-- 
Regards,
Shawn
