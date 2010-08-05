From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] arch/powerpc: Drop unnecessary of_node_put
Date: Wed, 4 Aug 2010 18:01:08 -0600
Message-ID: <AANLkTi=4WimRKyPWv=ZckXBC4vsgnUPFgWu6EkfZN_zO@mail.gmail.com>
References: <Pine.LNX.4.64.1008032149410.20393@ask.diku.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <Pine.LNX.4.64.1008032149410.20393-QfmoRoYWmW9knbxzx/v8hQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Julia Lawall <julia-dAYI7NvHqcQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 3, 2010 at 1:50 PM, Julia Lawall <julia-dAYI7NvHqcQ@public.gmane.org> wrote:
> From: Julia Lawall <julia-dAYI7NvHqcQ@public.gmane.org>
>
> for_each_node_by_name only exits when its first argument is NULL, and a
> subsequent call to of_node_put on that argument is unnecessary.
>
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
>
> // <smpl>
> @@
> iterator name for_each_node_by_name;
> expression np,E;
> identifier l;
> @@
>
> for_each_node_by_name(np,...) {
> =A0... when !=3D break;
> =A0 =A0 =A0when !=3D goto l;
> }
> ... when !=3D np =3D E
> - of_node_put(np);
> // </smpl>
>
> Signed-off-by: Julia Lawall <julia-dAYI7NvHqcQ@public.gmane.org>

Looks correct to me:

Reviewed-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

>
> ---
> =A0arch/powerpc/platforms/powermac/feature.c | =A0 =A01 -
> =A0arch/powerpc/platforms/powermac/pci.c =A0 =A0 | =A0 =A02 --
> =A02 files changed, 3 deletions(-)
>
> diff -u -p a/arch/powerpc/platforms/powermac/feature.c b/arch/powerpc/pla=
tforms/powermac/feature.c
> --- a/arch/powerpc/platforms/powermac/feature.c
> +++ b/arch/powerpc/platforms/powermac/feature.c
> @@ -2872,7 +2872,6 @@ set_initial_features(void)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0core99_air=
port_enable(np, 0, 0);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 of_node_put(np);
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0/* On all machines that support sound PM, switch sound off=
 */
> diff -u -p a/arch/powerpc/platforms/powermac/pci.c b/arch/powerpc/platfor=
ms/powermac/pci.c
> --- a/arch/powerpc/platforms/powermac/pci.c
> +++ b/arch/powerpc/platforms/powermac/pci.c
> @@ -1155,13 +1155,11 @@ void __init pmac_pcibios_after_init(void
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pmac_call_feature(PMAC_FTR=
_1394_CABLE_POWER, nd, 0, 0);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0}
> - =A0 =A0 =A0 of_node_put(nd);
> =A0 =A0 =A0 =A0for_each_node_by_name(nd, "ethernet") {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (nd->parent && of_device_is_compatible(=
nd, "gmac")
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&& of_device_is_compatible(nd->par=
ent, "uni-north"))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pmac_call_feature(PMAC_FTR=
_GMAC_ENABLE, nd, 0, 0);
> =A0 =A0 =A0 =A0}
> - =A0 =A0 =A0 of_node_put(nd);
> =A0}
>
> =A0void pmac_pci_fixup_cardbus(struct pci_dev* dev)
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
