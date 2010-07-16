From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 2/8] drivers/of: Make device tree code work on any arch.
Date: Fri, 16 Jul 2010 12:31:52 -0600
Message-ID: <AANLkTimW3tsllx82F-cKtAEHGxVXwG4ESbtYWBzS17Wb@mail.gmail.com>
References: <1279304021-22216-1-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279304021-22216-2-git-send-email-stephen.neuendorffer@xilinx.com>
	<592c6c35-556d-4874-8b75-2ebf0acf00e9@VA3EHSMHS011.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <592c6c35-556d-4874-8b75-2ebf0acf00e9-+Ck8Kgl/v0+Da4789yZHSLjjLBE8jN/0@public.gmane.org>
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

On Fri, Jul 16, 2010 at 12:13 PM, Stephen Neuendorffer
<stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> Signed-off-by: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>
> ---
>
> I'm not sure what the right way to abstract these functions is.
> of_node_to_nid seems specific to those platforms which have a root
> device tree. =A0pci_address_to_pio seems to probably have a useful
> implementation, but I'm not sure what it's trying to do. =A0Perhaps
> someone can shed some light?

Right now I'm making each arch implement the pci_address_to_pio() and
of_node_to_nid() hooks.  Not sure if I'll retain that in the long
term.  pci_address_to_pio() will probably become common code
eventually.

> ---
> =A0drivers/of/address.c | =A0 =A05 +++++
> =A0drivers/of/device.c =A0| =A0 =A07 ++++++-
> =A02 files changed, 11 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index fcadb72..61e652b 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -539,7 +539,12 @@ static int __of_address_to_resource(struct device_no=
de *dev, const u32 *addrp,
> =A0 =A0 =A0 =A0memset(r, 0, sizeof(struct resource));
> =A0 =A0 =A0 =A0if (flags & IORESOURCE_IO) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned long port;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 // FIXME: utter hack...
> +#if defined(CONFIG_MICROBLAZE) || defined(CONFIG_POWERPC)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0port =3D pci_address_to_pio(taddr);
> +#else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 port =3D -1;
> +#endif
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (port =3D=3D (unsigned long)-1)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EINVAL;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0r->start =3D port;
> diff --git a/drivers/of/device.c b/drivers/of/device.c
> index 5282a20..27a65fc 100644
> --- a/drivers/of/device.c
> +++ b/drivers/of/device.c
> @@ -107,8 +107,13 @@ int of_device_register(struct of_device *ofdev)
> =A0 =A0 =A0 =A0/* device_add will assume that this device is on the same =
node as
> =A0 =A0 =A0 =A0 * the parent. If there is no parent defined, set the node
> =A0 =A0 =A0 =A0 * explicitly */
> - =A0 =A0 =A0 if (!ofdev->dev.parent)
> + =A0 =A0 =A0 if (!ofdev->dev.parent) {
> +#if defined(CONFIG_MICROBLAZE) || defined(CONFIG_POWERPC) || defined(CON=
FIG_SPARC)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0set_dev_node(&ofdev->dev, of_node_to_nid(o=
fdev->dev.of_node));
> +#else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 set_dev_node(&ofdev->dev, -1);
> +#endif
> + =A0 =A0 =A0 }
>
> =A0 =A0 =A0 =A0return device_add(&ofdev->dev);
> =A0}
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
