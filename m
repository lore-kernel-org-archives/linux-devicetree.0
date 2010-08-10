From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 3/9] of/base.c: export property access/modification
	functions
Date: Tue, 10 Aug 2010 12:14:56 -0600
Message-ID: <AANLkTinuXdvw0rhdiSTwZCpc9ByJDfNTkZZxgpBAOEKc@mail.gmail.com>
References: <1279918663-29960-1-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279918663-29960-2-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279918663-29960-3-git-send-email-stephen.neuendorffer@xilinx.com>
	<ceba5315-090d-4776-9315-0cbca209b5af@SG2EHSMHS006.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <ceba5315-090d-4776-9315-0cbca209b5af-RaUQJvECHiv5op9OF0Koj7jjLBE8jN/0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 23, 2010 at 2:57 PM, Stephen Neuendorffer
<stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> These functions can be usefully used by device drivers.
>
> Signed-off-by: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---
> =A0drivers/of/base.c | =A0 =A03 +++
> =A01 files changed, 3 insertions(+), 0 deletions(-)

Looks good.  Use EXPORT_SYMBOL_GPL instead though please.

g.

>
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index e3f7af8..9ee27f6 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -763,6 +763,7 @@ int prom_add_property(struct device_node *np, struct =
property *prop)
>
> =A0 =A0 =A0 =A0return 0;
> =A0}
> +EXPORT_SYMBOL(prom_add_property);
>
> =A0/**
> =A0* prom_remove_property - Remove a property from a node.
> @@ -804,6 +805,7 @@ int prom_remove_property(struct device_node *np, stru=
ct property *prop)
>
> =A0 =A0 =A0 =A0return 0;
> =A0}
> +EXPORT_SYMBOL(prom_remove_property);
>
> =A0/*
> =A0* prom_update_property - Update a property in a node.
> @@ -848,6 +850,7 @@ int prom_update_property(struct device_node *np,
>
> =A0 =A0 =A0 =A0return 0;
> =A0}
> +EXPORT_SYMBOL(prom_update_property);
>
> =A0#if defined(CONFIG_OF_DYNAMIC)
> =A0/*
> --
> 1.5.6.6
>
>
>
> This email and any attachments are intended for the sole use of the named=
 recipient(s) and contain(s) confidential information that may be proprieta=
ry, privileged or copyrighted under applicable law. If you are not the inte=
nded recipient, do not read, copy, or forward this email message or any att=
achments. Delete this email message and any attachments immediately.
>
>
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
