From: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Subject: Re: [PATCH 5/8] of/overlay: Introduce DT overlay support
Date: Wed, 26 Nov 2014 14:11:55 +0100
Message-ID: <1417007515.29407.54.camel@x220>
References: <1416533715-9758-1-git-send-email-grant.likely@linaro.org>
	 <1416533715-9758-6-git-send-email-grant.likely@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416533715-9758-6-git-send-email-grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Valentin Rothberg <valentinrothberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2014-11-21 at 01:35 +0000, Grant Likely wrote:
> From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> 
> Overlays are a method to dynamically modify part of the kernel's
> device tree with dynamically loaded data. Add the core functionality to
> parse, apply and remove an overlay changeset. The core functionality
> takes care of managing the overlay data format and performing the add
> and remove. Drivers are expected to use the overlay functionality to
> support custom expansion busses commonly found on consumer development
> boards like the BeagleBone or Raspberry Pi.
> 
> The overlay code uses CONFIG_OF_DYNAMIC changesets to perform the low
> level work of modifying the devicetree.
> 
> Documentation about internal and APIs is provided in
> 	Documentation/devicetree/overlay-notes.txt
> 
> v2:
> - Switch from __of_node_alloc() to __of_node_dup()
> - Documentation fixups
> - Remove 2-pass processing of properties
> - Remove separate ov_lock; just use the DT mutex.
> v1:
> - Drop delete capability using '-' prefix. The '-' prefixed names
> are valid properties and nodes and there is no need for it just yet.
> - Do not update special properties - name & phandle ones.
> - Change order of node attachment, so that the special property update
> works.
> 
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Now commit 7518b5890d8a ("of/overlay: Introduce DT overlay support"),
included in today's linux-next (next-20141126).

>  Documentation/devicetree/overlay-notes.txt | 133 +++++++
>  drivers/of/Kconfig                         |   7 +
>  drivers/of/Makefile                        |   1 +
>  drivers/of/overlay.c                       | 562 +++++++++++++++++++++++++++++
>  include/linux/of.h                         |  31 ++
>  5 files changed, 734 insertions(+)
>  create mode 100644 Documentation/devicetree/overlay-notes.txt
>  create mode 100644 drivers/of/overlay.c
> 
>[...]
> diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
> index fbe8f8d418f7..18b2e2539f84 100644
> --- a/drivers/of/Kconfig
> +++ b/drivers/of/Kconfig
> @@ -84,4 +84,11 @@ config OF_RESERVED_MEM
>  config OF_RESOLVE
>  	bool
>  
> +config OF_OVERLAY
> +	bool
> +	depends on OF
> +	select OF_DYNAMIC
> +	select OF_DEVICE

There's currently no Kconfig symbol OF_DEVICE. So this select is now a
nop. Will that symbol be added in a future patch?

> +	select OF_RESOLVE
> +
>  endmenu # OF


Paul Bolle

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
