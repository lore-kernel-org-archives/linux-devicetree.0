From: Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v3 3/3] media: mtk-mdp: Fix mdp device tree
Date: Mon, 15 May 2017 10:31:52 +0800
Message-ID: <1494815512.31916.11.camel@mtksdaap41>
References: <1494559361-42835-1-git-send-email-minghsiu.tsai@mediatek.com>
         <1494559361-42835-4-git-send-email-minghsiu.tsai@mediatek.com>
         <60f89b9a-f068-25a7-3f8b-d13b19357361@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <60f89b9a-f068-25a7-3f8b-d13b19357361-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Pawel Osciak <posciak-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Houlong Wei <houlong.wei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Wu-Cheng Li <wuchengli-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 2017-05-12 at 17:05 +0200, Matthias Brugger wrote:
> 
> On 12/05/17 05:22, Minghsiu Tsai wrote:
> > From: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > 
> > If the mdp_* nodes are under an mdp sub-node, their corresponding
> > platform device does not automatically get its iommu assigned properly.
> > 
> > Fix this by moving the mdp component nodes up a level such that they are
> > siblings of mdp and all other SoC subsystems.  This also simplifies the
> > device tree.
> > 
> > Although it fixes iommu assignment issue, it also break compatibility
> > with old device tree. So, the patch in driver is needed to iterate over
> > sibling mdp device nodes, not child ones, to keep driver work properly.
> > 
> 
> Couldn't we preserve backwards compatibility by doing something like this:
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c 
> b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> index 9e4eb7dcc424..277d8fe6eb76 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> @@ -103,7 +103,7 @@ static int mtk_mdp_probe(struct platform_device *pdev)
>   {
>   	struct mtk_mdp_dev *mdp;
>   	struct device *dev = &pdev->dev;
> -	struct device_node *node;
> +	struct device_node *node, *parent;
>   	int i, ret = 0;
> 
>   	mdp = devm_kzalloc(dev, sizeof(*mdp), GFP_KERNEL);
> @@ -117,8 +117,14 @@ static int mtk_mdp_probe(struct platform_device *pdev)
>   	mutex_init(&mdp->lock);
>   	mutex_init(&mdp->vpulock);
> 
> +	/* Old dts had the components as child nodes */
> +	if (of_get_next_child(dev->of_node, NULL))
> +		parent = dev->of_node;
> +	else
> +		parent = dev->of_node->parent;
> +
>   	/* Iterate over sibling MDP function blocks */
> -	for_each_child_of_node(dev->of_node, node) {
> +	for_each_child_of_node(parent, node) {
>   		const struct of_device_id *of_id;
>   		enum mtk_mdp_comp_type comp_type;
>   		int comp_id;
> 
> Maybe even by putting a warning in the if branch to make sure, people 
> are aware of their out-of-date device tree blobs.
> 
> Regards,
> Matthias
> 

Hi Matthias,

It is a good idea to do compatible in such a way and put a warning the
device tree is out of date. People can find out cause soon if device
tree is old.

I modify the code as below:

+	/* Old dts had the components as child nodes */
+	if (of_get_next_child(dev->of_node, NULL)) {
+		parent = dev->of_node;
+		dev_warn(dev, "device tree is out of date\n");
+	} else {
+		parent = dev->of_node->parent;
+	}

Will you upload it in a separate patch? 
If not, I can merge it in my patch series and upload v4.


Best Regards,

Ming Hsiu

> > Signed-off-by: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > Signed-off-by: Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > 
> > ---
> >   drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> > index 9e4eb7d..a5ad586 100644
> > --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> > +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> > @@ -118,7 +118,7 @@ static int mtk_mdp_probe(struct platform_device *pdev)
> >   	mutex_init(&mdp->vpulock);
> >   
> >   	/* Iterate over sibling MDP function blocks */
> > -	for_each_child_of_node(dev->of_node, node) {
> > +	for_each_child_of_node(dev->of_node->parent, node) {
> >   		const struct of_device_id *of_id;
> >   		enum mtk_mdp_comp_type comp_type;
> >   		int comp_id;
> > 


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
