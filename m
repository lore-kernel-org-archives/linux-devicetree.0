From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/4] ARM: DT: Add SMDKV310 machine with device tree
	support.
Date: Mon, 7 Feb 2011 16:15:55 +0100
Message-ID: <201102071615.55652.arnd@arndb.de>
References: <1296998250-21856-1-git-send-email-thomas.abraham@linaro.org>
	<1296998250-21856-2-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <1296998250-21856-2-git-send-email-thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sunday 06 February 2011, Thomas Abraham wrote:

> diff --git a/arch/arm/mach-s5pv310/mach-smdkv310-dt.c b/arch/arm/mach-s5pv310/mach-smdkv310-dt.c
> new file mode 100644
> index 0000000..367fdb1
> --- /dev/null
> +++ b/arch/arm/mach-s5pv310/mach-smdkv310-dt.c
> @@ -0,0 +1,101 @@
> +/* linux/arch/arm/mach-s5pv310/mach-smdkv310.c

The file name in the comment doesn't match. I normally recommend not putting
it in the comment at all so you don't need to change it when moving or
copying the file.

A comment along the lines of "s5pv310 platform with device tree enabled" is
more helpful to the reader anyway.

> +static void __init smdkv310_map_io(void)
> +{
> +	s5p_init_io(NULL, 0, S5P_VA_CHIPID);
> +	s3c24xx_init_clocks(24000000);
> +	s3c24xx_init_uarts(smdkv310_uartcfgs, ARRAY_SIZE(smdkv310_uartcfgs));
> +}

There is very little here that is really platform specific, right?

Is this going to increase? If not, it might be good to read out the
data (S5P_VA_CHIPID, 24000000, smdkv310_uartcfgs) from the device tree
as well before passing them down. No need to do it right away, but it
would be good to know the direction in which we're heading.

Maybe add a comment like /* TODO: read these from the device tree */
or similar.

	Arnd
