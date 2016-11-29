From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/1] scripts: Fixing NULL pointer dereference when pos->file is NULL
Date: Tue, 29 Nov 2016 12:15:38 +0100
Message-ID: <5877520.Sj6Wky7ff7@wuerfel>
References: <1480415699-35335-1-git-send-email-maninder1.s@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1480415699-35335-1-git-send-email-maninder1.s-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maninder Singh <maninder1.s-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, rowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, v.narang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, pankaj.m-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, ajeet.y-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday, November 29, 2016 4:04:59 PM CET Maninder Singh wrote:
> This patch fixes NULL pointer dereference when pos->file is NULL.
> 
> caught with static analysis tool.
> Signed-off-by: Maninder Singh <maninder1.s-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Vaneet Narang <v.narang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  scripts/dtc/srcpos.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/scripts/dtc/srcpos.c b/scripts/dtc/srcpos.c
> index f534c22..360fd14 100644
> --- a/scripts/dtc/srcpos.c
> +++ b/scripts/dtc/srcpos.c
> @@ -252,12 +252,11 @@ struct srcpos *
>  srcpos_dump(struct srcpos *pos)
>  {
>         printf("file        : \"%s\"\n",
> -              pos->file ? (char *) pos->file : "<no file>");
> +              pos->file ?  pos->file->name : "<no file>");
>         printf("first_line  : %d\n", pos->first_line);
> 

The patch looks right, but the description doesn't seem to
match the bug.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
