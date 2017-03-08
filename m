From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v2 1/2] doc: bindings: Add bindings documentation for
 mtd nvmem
Date: Wed, 8 Mar 2017 17:25:04 +0100
Message-ID: <20170308172504.7e7e75a5@bbrezillon>
References: <1488875164-30440-1-git-send-email-albeu@free.fr>
 <1488875164-30440-2-git-send-email-albeu@free.fr>
 <20170307220107.03436537@bbrezillon>
 <20170308162001.2b7e2304@avionic-0020>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20170308162001.2b7e2304@avionic-0020>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Alban <albeu@free.fr>
Cc: Mark Rutland <mark.rutland@arm.com>, Moritz Fischer <moritz.fischer@ettus.com>, devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-mtd@lists.infradead.org, Maxime Ripard <maxime.ripard@free-electrons.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Cyrille Pitchen <cyrille.pitchen@atmel.com>
List-Id: devicetree@vger.kernel.org

Hi Alban,

On Wed, 8 Mar 2017 16:20:01 +0100
Alban <albeu@free.fr> wrote:

> On Tue, 7 Mar 2017 22:01:07 +0100
> Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
> 
> > On Tue,  7 Mar 2017 09:26:03 +0100
> > Alban <albeu@free.fr> wrote:
> >   
> > > Config data for drivers, like MAC addresses, is often stored in MTD.
> > > Add a binding that define how such data storage can be represented in
> > > device tree.
> > > 
> > > Signed-off-by: Alban <albeu@free.fr>
> > > ---
> > > Changelog:
> > > v2: * Added a "Required properties" section with the nvmem-provider
> > >       property
> > > ---
> > >  .../devicetree/bindings/nvmem/mtd-nvmem.txt        | 33 ++++++++++++++++++++++
> > >  1 file changed, 33 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
> > > 
> > > diff --git a/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt b/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
> > > new file mode 100644
> > > index 0000000..8ed25e6
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
> > > @@ -0,0 +1,33 @@
> > > += NVMEM in MTD =
> > > +
> > > +Config data for drivers, like MAC addresses, is often stored in MTD.
> > > +This binding define how such data storage can be represented in device tree.
> > > +
> > > +An MTD can be defined as an NVMEM provider by adding the `nvmem-provider`
> > > +property to their node.    
> > 
> > If everyone agrees that this is actually needed, then it should
> > definitely go in the nvmem binding doc, and we should patch all nvmem
> > providers to define this property (even if we keep supporting nodes
> > that are not defining it). I'm not fully convinced yet, but I might be
> > wrong.  
> 
> I really like to hear what the DT people think about this.

That was the plan.

> 
> > I also think we should take the "nvmem under flash node without partitions"
> > into account now, or at least have a clear plan on how we want to represent
> > it.
> > 
> > Something like that?  
> 
> Yes, but with the following extras:
> 
> > 	flash {  
>                 nvmem-provider;
> > 		partitions {
> > 			part@X {
> > 				nvmem {  
>   					compatible = "nvmem-cells";
> > 					#address-cells = <1>;
> > 					#size-cells = <1>;
> > 
> > 					cell@Y {
> > 					};
> > 				};
> > 			};
> > 		};
> > 
> > 		nvmem {  
>   			compatible = "nvmem-cells";
> > 			#address-cells = <1>;
> > 			#size-cells = <1>;
> > 
> > 			cell@X {
> > 			};
> > 		};
> > 	};
> >
> > Note that patching nvmem core to support the subnode case should be
> > pretty easy (see below).  
> 
> This shouldn't be needed as nothing would change for the NVMEM devices,
> what could be added is a check for the "nvmem-provider" property.
> To support the proposed binding we would only need a minor change to
> of_nvmem_cell_get():
> 
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index 408b521ee520..6231ea27c9f4 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -444,6 +444,10 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
>         if (!config->dev)
>                 return ERR_PTR(-EINVAL);
> 
> +       if (config->dev->of_node &&
> +           !of_property_read_bool(config->dev->of_node, "nvmem-provider"))
> +               return ERR_PTR(-ENODEV);
> +
>         nvmem = kzalloc(sizeof(*nvmem), GFP_KERNEL);
>         if (!nvmem)
>                 return ERR_PTR(-ENOMEM);
> @@ -777,6 +781,15 @@ struct nvmem_cell *of_nvmem_cell_get(struct device_node *np,
>         if (!nvmem_np)
>                 return ERR_PTR(-EINVAL);
> 
> +       /* handle the new cell binding */
> +       if (of_device_is_compatible(nvmem_np, "nvmem-cells")) {
> +               nvmem_np = of_get_next_parent(cell_np);
> +               if (!nvmem_np)
> +                       return ERR_PTR(-EINVAL);
> +               if (!of_property_read_bool(nvmem_np, "nvmem-provider"))
> +                       return ERR_PTR(-ENODEV);
> +       }
> +
>         nvmem = __nvmem_device_get(nvmem_np, NULL, NULL);
>         if (IS_ERR(nvmem))
>                 return ERR_CAST(nvmem);
> 

Yep, works too. Let's wait for a DT review, before taking a decision.

Thanks,

Boris

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
