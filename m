From: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Subject: Re: [PATCH] regulator: qcom-rpm: Rework for single device
Date: Mon, 2 Mar 2015 21:46:46 -0800
Message-ID: <20150303054645.GA26334@sonymobile.com>
References: <20150225010708.GC31855@sonymobile.com>
 <1424995217-23381-1-git-send-email-sboyd@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1424995217-23381-1-git-send-email-sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu 26 Feb 16:00 PST 2015, Stephen Boyd wrote:

> The RPM regulators are not individual devices. Creating platform
> devices for each regulator bloats the kernel's runtime memory
> footprint by ~12k. Let's rework this driver to be a single
> platform device for all the RPM regulators. This makes the
> DT match the schematic/datasheet closer too because now the
> regulators node contains a list of supplies at the package level
> for a particular PMIC model.
> 

As we discussed on IRC I agree with the benefits of redesigning this,
especially making the supplies matching the data sheet rather than the
code...

As you write below your patch needs to be updated with regards to the
missing platforms, but it also needs to be rebased upon Mark's tree.


By moving to a dt binding structure that better seem to resemble what's
expected by the regulator framework we can drop some of the code from
this driver and let the framework take care of matching of child nodes
etc.

I took the liberty of sending out a patch series with a slightly
different solution, please let me know what you think. If nothing else
it has an updated proposal for the dt binding document.

[..]
> >
> > This can however be done in two ways:
> > 1) We modify the mfd driver to instatiate 3 mfd_cells; one of them
> > being "qcom,rpm-regulators". We modify the regulator driver to have
> > tables of the regulators for each platform and matching regulator
> > parameters by of_node name and registering these.
> >
> > 2) We stick with this binding, we then go ahead and do the same
> > modification to the mfd as above - passing the rpm of_node to the
> > regulator driver, that walks the children and match that to the current
> > compatible list. (in other words, we replace of_platform_populate with
> > our own mechamism).
> >
> >
> > The benefit of 2 is that we can use the code that was posted 10 months
> > ago and merged 3 months ago until someone prioritize those 12kb.
> 
> I did (1) without modifying the MFD driver.
> 

I tried moving the table from the rpm into the regulator driver, but the
problem is that the regulator driver can no long only map to a PMIC.

The "address" depends on both pmic and rpm/platform, so we would need to
either have a more specific compatible or double check parent compatible
and map that to one table per platform.

So I've left this as well for now and after looking at the options I
think it's better to let it be (but perhaps dropping the 800 bytes of
"size").

[..]

> > As we decided to define the regulators in code but the actual
> > composition in dt it was not possible to put the individual numbers in
> > DT. Having reg = <165 68 48> does not make any sense, unless we perhaps
> > maintain said table in the dt binding documentation.
> 
> For now I've left it so that the #define is used in C code.
> 

As we've dropped it from dt we're free to change it later.

> >
> > > From what I can tell, that data is split in two places. The regulator
> > > type knows how big the data we want to send is (1 or 2) and that is
> > > checked in the RPM driver to make sure that the two agree (this part
> > > looks like over-defensive coding).
> >
> > Yeah, after debugging production code for years I like to be slightly on
> > the defensive side. But the size could of course be dropped from the
> > resource-tables; reducing the savings of your suggestion by another 800
> > bytes...
> 
> Sounds good. We should probably do it.
> 

I looked at making it depend on DEBUG or something, but I don't have any
good patch at this point. I just imagine that it would be mighty useful
to have when implementing the msm_rpm driver - handling entries that are
of very strange sizes.

Maybe I'm just pessimistic...

[..]

> >
> > Me neither, a month ago...
> >
> > Here's the discussion we had with Mark regarding having the regulator
> > core pick up -supply properties from the individual child of_nodes of a
> > regulator driver:
> >
> > https://lkml.org/lkml/2015/2/4/759
> >
> > As far as I can see this has to be fixed for us to move over to having
> > one driver registering all our regulators, independently of how we
> > structure this binding.
> >
> 
> Mark is saying that the entire PMIC (e.g. PM8921) is the package. On the
> package there are pins like VIN_L27, VIN_L24, etc (look at a schematic). When
> you consider the regulators node (compatible = "qcom,rpm-pm8921-regulators")
> is the package then you can see that it should have a handful of vin_*-supply
> properties that correspond to what you see in the schematic and the datasheet.
> This way if a board designer has decided to run a particular supply to
> VIN_L1_L2_L12_L18 they just wire it up in DT and everything works. They don't
> have to look at the binding for the L1, L2, L12, and L18 regulators and figure
> out that it uses vin-supply for the supply. Plus everything matches what
> they see in the schematic and datasheets.
> 

This makes sense and it can't be represented in the previously suggested
binding. Splitting the regulators in PMIC subnodes turned out to make
this quite clear as well. So I like the end result.

> Note: This patch is not complete. We still need to fill out the other pmics
> and standalone regulators (smb208) that this driver is for.
> 

I unfortunately don't have documentation for the ipq8064 platform, so I
was not able to add this to my tables either. But I added the needed
PMICs for 8660 and did some quick prototyping on 8974 as well.

>  drivers/regulator/qcom_rpm-regulator.c | 484 ++++++++++++++++++++++++++++-----
>  1 file changed, 416 insertions(+), 68 deletions(-)
> 
> diff --git a/drivers/regulator/qcom_rpm-regulator.c b/drivers/regulator/qcom_rpm-regulator.c

[..]

> +
> +static int rpm_reg_probe(struct platform_device *pdev)
> +{
> +       const struct of_device_id *match;
> +       const struct qcom_rpm_of_match *rpm_match;
> +       struct of_regulator_match *of_match;
> +       struct qcom_rpm *rpm;
> +       int ret;
> +
> +       rpm = dev_get_drvdata(pdev->dev.parent);
> +       if (!rpm) {
> +               dev_err(&pdev->dev, "unable to retrieve handle to rpm\n");
> +               return -ENODEV;
> +       }
> +
> +       match = of_match_device(rpm_of_match, &pdev->dev);
> +       rpm_match = match->data;
> +       of_match = rpm_match->of_match;
> +
> +       ret = of_regulator_match(&pdev->dev, pdev->dev.of_node,
> +                                of_match,
> +                                rpm_match->size);
> +       if (ret < 0) {
> +               dev_err(&pdev->dev,
> +                       "Error parsing regulator init data: %d\n", ret);
> +               return ret;
> +       }
> +
> +       for (; of_match < rpm_match->of_match + rpm_match->size; of_match++) {
> +               if (!of_match->of_node)
> +                       continue;
> +               ret = rpm_regulator_register(pdev, of_match, rpm);
> +               if (ret) {
> +                       dev_err(&pdev->dev, "can't register regulator\n");
> +                       return ret;
> +               }

I believe this can be done more elegantly by setting desc->of_match when
calling regulator_register() and have that handle the of-matching
internally.

>         }
> 
>         return 0;

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
