From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 6/7] ARM: s5pv310-dt: Enable snooping of
	platform_device registrations
Date: Wed, 16 Feb 2011 17:24:41 -0700
Message-ID: <20110217002441.GC14124@angua.secretlab.ca>
References: <1297514825-10345-1-git-send-email-thomas.abraham@linaro.org>
	<1297514825-10345-7-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1297514825-10345-7-git-send-email-thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Feb 12, 2011 at 06:17:04PM +0530, Thomas Abraham wrote:
> Enable snooping of platform_device registrations for s5pv310-dt machine.
> 
> Signed-off-by: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  arch/arm/mach-s5pv310/mach-s5pv310-dt.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pv310/mach-s5pv310-dt.c b/arch/arm/mach-s5pv310/mach-s5pv310-dt.c
> index 2578d73..ed5cae4 100644
> --- a/arch/arm/mach-s5pv310/mach-s5pv310-dt.c
> +++ b/arch/arm/mach-s5pv310/mach-s5pv310-dt.c
> @@ -64,6 +64,7 @@ static struct of_device_id s5pv310_dt_match_table[] __initdata = {
>  
>  static void __init s5pv310_dt_machine_init(void)
>  {
> +	of_platform_bus_snoop(NULL, s5pv310_dt_match_table);
>  	of_platform_bus_probe(NULL, s5pv310_dt_match_table, NULL);

of_platform_bus_snoop shouldn't be used with of_platform_bus_probe
because it might cause devices to get registered twice.
of_platform_bus_snoop_finish() should be used instead.  It will
register any devices found by snoop that don't have an associated
platform_device, but you need to arrange for
of_platform_bus_snoop_finish() to be called after all other platform
devices have been registered.

g.
