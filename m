From: Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 1/2] mfd: dt: tps6586x: Add power off control
Date: Sat, 18 Aug 2012 06:45:32 +0800
Message-ID: <A7051F87A141B744BCAF487D48E5B3BDF5BA98283F@HKMAIL02.nvidia.com>
References: <1345194989-11614-1-git-send-email-bilhuang@nvidia.com>
 <1345194989-11614-2-git-send-email-bilhuang@nvidia.com>
 <20120817104150.GA27633@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120817104150.GA27633-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: 'Thierry Reding' <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: "kyle.manna-CaKDIOJzjcgAvxtiuMwx3w@public.gmane.org" <kyle.manna-CaKDIOJzjcgAvxtiuMwx3w@public.gmane.org>, "sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "jhovold-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jhovold-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org" <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org" <lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, Xin Xie <xxie-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

nvpublic
> On Fri, Aug 17, 2012 at 02:16:28AM -0700, Bill Huang wrote:
> [...]
> > diff --git a/drivers/mfd/tps6586x.c b/drivers/mfd/tps6586x.c
> [...]
> > @@ -505,6 +519,11 @@ static int __devinit tps6586x_i2c_probe(struct i2c_client *client,
> >  		goto err_add_devs;
> >  	}
> >
> > +	tps6586x_dev = &client->dev;
> > +
> > +	if (pdata->pm_off && !pm_power_off)
> > +		pm_power_off = tps6586x_power_off;
> > +
> 
> I think the assignment of tps6586x_dev needs to go inside the if block as well. Otherwise it might be
> overwritten by another instance for systems that actually have more than one tps6586x. Since currently
> the driver can't be built as a module it probably makes little sense to clean this up in .remove(),
> but it might still be worth adding so it isn't forgotten if and when somebody tries to convert the
> driver to a module.
> 
Thanks, good point.

> I should note that I don't like very much how the pm_power_off works.
> Maybe this should really be changed to allow passing a context for the function to work from.
> Something like:
> 
> 	pm_power_off = tps6586x_power_off;
> 	pm_power_off_data = &client->dev;
> 
> Where pm_power_off() would receive pm_power_off_data as an argument.
> 
> Even that's not very pretty. On the other hand this doesn't really buy us much because only the
> storage location of the variable would change and nothing else. But it would still make the
> association of the data clearer.
> 
> Thierry
> 
> * Unknown Key
> * 0x7F3EB3A1
