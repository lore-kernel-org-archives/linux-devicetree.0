From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v8] mwifiex: parse device tree node for PCIe
Date: Fri, 18 Nov 2016 11:06:10 -0600
Message-ID: <20161118170610.42gumxv37a3dsgxu@rob-hp-laptop>
References: <1479472624-22340-1-git-send-email-akarwar@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1479472624-22340-1-git-send-email-akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Cathy Luo <cluo-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nishant Sarmukadam <nishants-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, rajatja-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 18, 2016 at 06:07:04PM +0530, Amitkumar Karwar wrote:
> From: Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> 
> This patch derives device tree node from pcie bus layer framework.
> Device tree bindings file has been renamed(marvell-sd8xxx.txt ->
> marvell-8xxx.txt) to accommodate PCIe changes.
> 
> Signed-off-by: Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Rajat Jain <rajatja-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> Reviewed-by: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Signed-off-by: Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> ---
> v2: Included vendor and product IDs in compatible strings for PCIe
> chipsets(Rob Herring)
> v3: Patch is created using -M option so that it will only include diff of
> original and renamed files(Rob Herring)
> Resend v3: Resending the patch because I missed to include device tree mailing
> while sending v3.
> v4: Fix error handling, also move-on even if no device tree node is present.
> v5: Update commit log to include memory leak, return -EINVAL instead of -1.
> v6: Remove an unnecessary error print, fix typo in commit log
> v7: a) Earlier versions of this patch claims to have a change which fixes "memory
>        leak". But it actually introduces double-free problem. That change is removed
>        here(Brian Norris)
>     b) Cosmetic change in bindings documentation(Rob Herring)
> 	s/marvell/Marvell/
> 	s/sdio\/pcie/SDIO\/PCIE/
> v8: Same as v7. I had missed to CC device tree mailing list in v7. Correcting this
>     in v8.
> ---
>  .../{marvell-sd8xxx.txt => marvell-8xxx.txt}       |  8 +++++---

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/net/wireless/marvell/mwifiex/pcie.c        | 24 ++++++++++++++++++++++
>  drivers/net/wireless/marvell/mwifiex/sta_cmd.c     |  3 ++-
>  3 files changed, 31 insertions(+), 4 deletions(-)
>  rename Documentation/devicetree/bindings/net/wireless/{marvell-sd8xxx.txt => marvell-8xxx.txt} (91%)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
