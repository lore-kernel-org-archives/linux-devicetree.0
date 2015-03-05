From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] libfdt: Teach fdt_path_offset() about ':' path separator
Date: Thu, 5 Mar 2015 09:23:48 -0600
Message-ID: <CAL_JsqLXP8LccUXA+NNmGyCgbJSArVHCN5XvF17dkbahuook-Q@mail.gmail.com>
References: <1425487459-20955-1-git-send-email-peter@hurleysoftware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425487459-20955-1-git-send-email-peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 4, 2015 at 10:44 AM, Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org> wrote:
> stdout-path defines ':' as a path separator and commit 75c28c09af99a
> ("of: add optional options parameter to of_find_node_by_path()") added
> the necessary support to parse paths terminated with ':' path separator.
> commit 7914a7c5651a5 ("of: support passing console options with
> stdout-path") added options string support to the stdout-path property,
> which broke earlycon.
>
> Add the same support to fdt_path_offset() so earlycon can parse and
> process stdout-path properties containing an options string.
>
> Cc: Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> # 3.19+
> Signed-off-by: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>

This needs to be first applied to upstream dtc[1]. Please do a patch
against dtc and send to devicetree-compiler list.

Rob

[1] https://git.kernel.org/cgit/linux/kernel/git/jdl/dtc.git/

> ---
>  scripts/dtc/libfdt/fdt_ro.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/dtc/libfdt/fdt_ro.c b/scripts/dtc/libfdt/fdt_ro.c
> index 02b6d68..a96e452 100644
> --- a/scripts/dtc/libfdt/fdt_ro.c
> +++ b/scripts/dtc/libfdt/fdt_ro.c
> @@ -156,7 +156,8 @@ int fdt_subnode_offset(const void *fdt, int parentoffset,
>
>  int fdt_path_offset(const void *fdt, const char *path)
>  {
> -       const char *end = path + strlen(path);
> +       const char *separator = strchr(path, ':');
> +       const char *end = separator ? separator : path + strlen(path);
>         const char *p = path;
>         int offset = 0;
>
> @@ -166,7 +167,7 @@ int fdt_path_offset(const void *fdt, const char *path)
>         if (*path != '/') {
>                 const char *q = strchr(path, '/');
>
> -               if (!q)
> +               if (!q || q > end)
>                         q = end;
>
>                 p = fdt_get_alias_namelen(fdt, p, q - p);
> @@ -177,7 +178,7 @@ int fdt_path_offset(const void *fdt, const char *path)
>                 p = q;
>         }
>
> -       while (*p) {
> +       while (p < end) {
>                 const char *q;
>
>                 while (*p == '/')
> @@ -185,7 +186,7 @@ int fdt_path_offset(const void *fdt, const char *path)
>                 if (! *p)
>                         return offset;
>                 q = strchr(p, '/');
> -               if (! q)
> +               if (!q || q > end)
>                         q = end;
>
>                 offset = fdt_subnode_offset_namelen(fdt, offset, p, q-p);
> --
> 2.3.1
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
