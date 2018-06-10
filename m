From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v3 1/3] nvmem: Update the OF binding to use a subnode for
 the cells list
Date: Sun, 10 Jun 2018 11:32:36 +0100
Message-ID: <02d3cba5-01a3-4d8f-55fc-9c7b7fd5e5c1@linaro.org>
References: <1521933899-362-1-git-send-email-albeu@free.fr>
 <1521933899-362-2-git-send-email-albeu@free.fr>
 <344e0087-7410-aebb-8a66-c6976064df10@linaro.org>
 <20180417165420.423a691b@avionic-0020>
 <8c4b48ad-e99e-030a-a4ee-b6df0fa59c79@linaro.org>
 <20180417180040.04f53495@avionic-0020> <20180418134119.2e587621@avionic-0020>
 <9f7d2987-b33e-79b5-ae58-2985fd7334e4@linaro.org>
 <20180418143243.3c23493c@avionic-0020>
 <e34619a4-e9b6-9945-a1cc-a3680aac6819@linaro.org>
 <20180418153440.187ed16e@avionic-0020>
 <d30656d6-f17e-6ed0-251f-2b59d02cd202@linaro.org>
 <20180607184155.6da38a01@tock>
 <0fb0e8e9-e7b8-10c3-fcdd-399c73a33878@linaro.org>
 <20180608125938.4fd457a0@tock>
 <cd7a0085-66cd-308e-a950-cd0eb96db945@linaro.org>
 <20180608190717.55cb185c@tock>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180608190717.55cb185c@tock>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alban <albeu@free.fr>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, devicetree@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On 08/06/18 18:07, Alban wrote:
> On Fri, 8 Jun 2018 12:34:12 +0100
> Srinivas Kandagatla <srinivas.kandagatla@linaro.org> wrote:
> 
...
> 
> I looked into this. It would work fine for the cells but not so nicely
> for the nvmem device API. The phandle for the nvmem device would have
> to reference the node passed here and not the real device. We would end
> up with a DT like this:
> 
> flash@0 {
> 	compatible = "mtd";
> 	...
> 	nvmem_dev: nvmem-cells {
> 		compatible = "nvmem-cells";
> 		...
>          };
> };
> 
> other-device@10 {
> 	...
> 	nvmem = <&nvmem_dev>;
> };
> 
> Now if there is no cell defined we have this empty child node that make
> very little sense, it is just there to accommodate the nvmem API.
> 
NO. This just looks fine!
nvmem-cells is the nvmem provider node without which you would not have 
any provider instance.
All this looks as expected!
Am not sure what is the problem here!


> What I would suggest now is to just change the wording. We don't
> deprecate the current binding, but we extend it to allow grouping the
> cells in a child node if required. The code to support this is trivial,
> (4 lines including error handling) so even if we expect very few
> bindings to make use of it it is not going to be maintenance drag.
> That would look like this:

> 
> diff --git a/Documentation/devicetree/bindings/nvmem/nvmem.txt b/Documentation/devicetree/bindings/nvmem/nvmem.txt
> index fd06c09..085d042 100644
> --- a/Documentation/devicetree/bindings/nvmem/nvmem.txt
> +++ b/Documentation/devicetree/bindings/nvmem/nvmem.txt
> @@ -19,7 +19,10 @@ Optional properties:
>   
>   = Data cells =
>   These are the child nodes of the provider which contain data cell
> -information like offset and size in nvmem provider.
> +information like offset and size in nvmem provider. Alternatively the data
> +cells can be grouped in a node that has a compatible property set to
> +"nvmem-cells".
> +
>   
>   Required properties:
>   reg:   specifies the offset in byte within the storage device.
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index 4e94a78..3e1369c 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -859,6 +859,14 @@ struct nvmem_cell *of_nvmem_cell_get(struct device_node *np,
>          if (!nvmem_np)
>                  return ERR_PTR(-EINVAL);
>   
> +       /* bindings that already have anonymous child nodes can instead put
> +        * their cells in a child node with an nvmem-cells compatible. */
> +       if (of_device_is_compatible(nvmem_np, "nvmem-cells")) {
> +               nvmem_np = of_get_next_parent(nvmem_np);
> +               if (!nvmem_np)
> +                       return ERR_PTR(-EINVAL);
> +       }
> +
>          nvmem = __nvmem_device_get(nvmem_np, NULL, NULL);
>          of_node_put(nvmem_np);
>          if (IS_ERR(nvmem))
> 
> What about it?
Let me repeat what I have said in my previous emails:

Having a subnode still sounds very fragile to me,
and this could be much specific case of MTD provider. We might have
instances where this could be sub-sub node of the the original provider
for other providers. Also I do not want to bring in Provider specifics 
layout into nvmem bindings.

I can not make myself any clearer than this, Its going to be a NAK from 
my side for the above reasons!

Also, patch I shared should give enough flexibility to various range of 
providers which have different child node layouts without touching the 
nvmem bindings. If it works please use it.


thanks,
srini
> 
> Alban
> 
