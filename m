From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 23/28] of: introduce common FDT machine related functions
Date: Fri, 04 Oct 2013 19:49:59 +0100
Message-ID: <20131004184959.CAA4EC42926@trevor.secretlab.ca>
References: <1379372965-22359-1-git-send-email-robherring2@gmail.com> <1379372965-22359-24-git-send-email-robherring2@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379372965-22359-24-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 16 Sep 2013 18:09:19 -0500, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> 
> Introduce common of_flat_dt_match_machine and
> of_flat_dt_get_machine_name functions to unify architectures' handling
> of machine level model and compatible properties.
> 
> Several architectures match the root compatible string with an arch
> specific list of machine descriptors duplicating the same search
> algorithm. Create a common implementation with a simple architecture
> specific hook to iterate over each machine's match table.
> 
> Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/of/fdt.c       | 60 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/of_fdt.h |  4 ++++
>  2 files changed, 64 insertions(+)
> 
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index 83cdeb5..e21d1dc 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -619,6 +619,66 @@ int __init of_scan_flat_dt_by_path(const char *path,
>  		return ret;
>  }
>  
> +const char *of_flat_dt_get_machine_name(void)

Just discovered that this needs to be __init.

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
