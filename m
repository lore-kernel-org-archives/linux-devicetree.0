From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: [dtc][PATCH] Fix typo
Date: Sun, 03 Feb 2013 15:38:56 -0600
Message-ID: <E1U27H6-0004Ci-Ej@jdl.com>
References: <510DA6B5.2060107@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <510DA6B5.2060107-GANU6spQydw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: =?UTF-8?B?RnJhbsOnb2lzIFJldm9s?= <revol-GANU6spQydw@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

> Hi,
> $subject :-)
> 
> Fran=C3=A7ois.
> 
> >From ad0c53de9b5a1d060127bdea138043306eed881c Mon Sep 17 00:00:00 2001
> From: =3D?UTF-8?q?Fran=3DC3=3DA7ois=3D20Revol?=3D <revol-GANU6spQydw@public.gmane.org>
> Date: Sun, 3 Feb 2013 00:49:10 +0100
> Subject: [PATCH] Fix typo
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3DUTF-8
> Content-Transfer-Encoding: 8bit
> 
> 
> Signed-off-by: Fran=C3=A7ois Revol <revol-GANU6spQydw@public.gmane.org>
> ---
>  libfdt/libfdt.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index c0075e7..130789a 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -582,7 +582,7 @@ const char *fdt_get_alias_namelen(const void *fdt,
>   * value of the property named 'name' in the node /aliases.
>   *
>   * returns:
> - *	a pointer to the expansion of the alias named 'name', of it exists
> + *	a pointer to the expansion of the alias named 'name', if it exists
>   *	NULL, if the given alias or the /aliases node does not exist
>   */
>  const char *fdt_get_alias(const void *fdt, const char *name);
> --=20
> 1.7.10.4


Applied, but yeah, I had to clean up an otherwise messy commit message.

And double yeah, I also copied the DTC list where this patch should
also have been sent.

Thanks,
jdl
