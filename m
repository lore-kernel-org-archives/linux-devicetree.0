From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 0/2] Full DT IRQ support for versatile
Date: Thu, 12 Jan 2012 19:31:54 -0700
Message-ID: <20120113023154.GC25999@ponder.secretlab.ca>
References: <1326415441-17695-1-git-send-email-jamie@jamieiles.com>
 <CACxGe6v-gkW+pDP-2hTcf7WqeMBtx+H80Xymj7SqS8nqin9qUA@mail.gmail.com>
 <20120113014250.GD14007@page>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120113014250.GD14007@page>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 13, 2012 at 01:42:50AM +0000, Jamie Iles wrote:
> On Thu, Jan 12, 2012 at 06:20:37PM -0700, Grant Likely wrote:
> > On Thu, Jan 12, 2012 at 5:43 PM, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org> wrote:
> > > These patches move versatile over to instantiating both interrupt
> > > controllers from the device tree. =A0I've tested this in qemu for bot=
h DT
> > > and non-DT platforms but only with an initramfs. =A0I've seen interru=
pts
> > > generated on both controllers for both boot methods.
> > >
> > > Grant, Rob, this makes use of irqdomain again as I'm not sure what the
> > > replacement is going to look like yet. =A0versatile works with DT in
> > > mainline, but that's kind of lucky... =A0I know there's been patches =
to
> > > make irq_domain_add_simple() return the irq_domain and can rebase if
> > > needed.
> > =

> > I posted the patches for finishing up irq_domain migration yesterday.
> > irq_domain_add_simple() can trivially be changed to
> > irq_domain_add_legacy. I'll try out these
> > patches on top of my irqdomain/next branch
> =

> Excellent!  I've just grabbed your branch and given it a spin.  I fixed =

> up my patches with the patch below and had to revert "irqdesc: =

> Consolidate irq reservation logic" as I saw Rob mentioned as I was =

> getting negative irq_desc's allocated but otherwise it works nicely!
> =

> I've also tested your tree with the irqdesc patch reverted on picoxcell =

> and that's working nicely too!
> =

> Jamie
> =

> 8<----
> =

> diff --git a/arch/arm/plat-versatile/fpga-irq.c b/arch/arm/plat-versatile=
/fpga-irq.c
> index fd87b06..c4dac93 100644
> --- a/arch/arm/plat-versatile/fpga-irq.c
> +++ b/arch/arm/plat-versatile/fpga-irq.c
> @@ -59,10 +59,9 @@ void __init fpga_irq_init(int parent_irq, u32 valid, s=
truct fpga_irq_data *f)
>  	f->chip.irq_ack =3D fpga_irq_mask;
>  	f->chip.irq_mask =3D fpga_irq_mask;
>  	f->chip.irq_unmask =3D fpga_irq_unmask;
> -	f->domain.irq_base =3D f->irq_start;
> -	f->domain.nr_irq =3D 32;
> -	f->domain.ops =3D &irq_domain_simple_ops;
> -	irq_domain_add(&f->domain);
> +	if (!f->domain)
> +		f->domain =3D irq_domain_add_legacy(NULL, 32, f->irq_start,
> +						  0, &irq_domain_simple_ops);
>  =

>  	if (parent_irq !=3D -1) {
>  		irq_set_handler_data(parent_irq, f);
> @@ -103,7 +102,8 @@ int __init sic_of_init(struct device_node *np, struct=
 device_node *parent)
>  		err =3D sic_data->irq_start;
>  		goto out_unmap;
>  	}
> -	sic_data->domain.of_node =3D of_node_get(np);
> +	sic_data->domain =3D irq_domain_add_legacy(np, 32, sic_data->irq_start,
> +						 0, &irq_domain_simple_ops);

For the DT use-case, you should try irq_domain_add_linear(np, 32);
which makes the controller use irqs allocated only when they are
requested.
