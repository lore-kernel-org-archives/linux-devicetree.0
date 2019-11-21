Return-Path: <SRS0=OHRJ=ZN=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE439C432C3
	for <linux-devicetree@archiver.kernel.org>; Thu, 21 Nov 2019 11:55:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8CC8720855
	for <linux-devicetree@archiver.kernel.org>; Thu, 21 Nov 2019 11:55:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="pwE8Hqyy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbfKULzD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 21 Nov 2019 06:55:03 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:33100 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726343AbfKULzD (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 21 Nov 2019 06:55:03 -0500
Received: by mail-il1-f194.google.com with SMTP id m5so3012600ilq.0
        for <devicetree@vger.kernel.org>; Thu, 21 Nov 2019 03:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OASxd9sL3P/EAyFnEHWqDD5LpfqZZMnAsfvorrhUyyg=;
        b=pwE8Hqyyt9JggoFN9jl5bxSbMElKMXFsPnZeJyh3roSkWGRiPz6qnu1SvgDOJ3Hw6i
         UaAeZvMNr2kYe4IsFb6a2uhjOyO9sujSvCApwbh+oXGNBtkdjike5of1kVIQFsBK+8EE
         btJumOPBgYOevLDsXDFlEIrsPC76sE6BH4JhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OASxd9sL3P/EAyFnEHWqDD5LpfqZZMnAsfvorrhUyyg=;
        b=carUtKBKaVrAwyu52bB4TVK1BfOuBE97SmWs7uVNvFq8bvFqFXB/DMFaPZiWPWQGIo
         6aLxfIys8Mm6QtdvDQvhHe+ENZz76DGylTG1ur8CB+ZO08OgAXXWiAAQomuGhQFp8YW6
         V9E+xU8QedjReYFx+AlSLJOZQIMfEPJFFSHi4Az4ROSVQMhJZlm6pEGEL1T99xN6MLlZ
         jyWqcPDTFCFMxa2LhFYZFWJCS2r3F+k5i3xGOFLwzl3S4DFRhimY6OP8birO8JQomHcC
         swIvIyvercrR7/3GDQnlhWr/jMU17XtIYVpNpopqO+kL2l2o9ZHB5bdQW88krtLxdNai
         ra1A==
X-Gm-Message-State: APjAAAV+F5/yL/SF2qGl67FddU2iPNk0goAzI7fcpO6PvP+z0JBcLyc3
        klDbGDsuLJvjMsqkH18YmwQm9y/F8PD+RZ+Q0ymJTg==
X-Google-Smtp-Source: APXvYqxfumqpEZg771COtbxon7u4bR0X9QYm3AdjlbTzg0aqVValkgGD39VvNZ52KOhtkplgn0JszB4c2khzBZn3bTg=
X-Received: by 2002:a92:5d8f:: with SMTP id e15mr9728918ilg.173.1574337299234;
 Thu, 21 Nov 2019 03:54:59 -0800 (PST)
MIME-Version: 1.0
References: <20191025175625.8011-1-jagan@amarulasolutions.com>
 <20191025175625.8011-5-jagan@amarulasolutions.com> <20191028153427.pc3tnoz2d23filhx@hendrix>
 <CAMty3ZCisTrFGjzHyqSofqFAsKSLV1n2xP5Li3Lonhdi0WUZVA@mail.gmail.com>
 <20191029085401.gvqpwmmpyml75vis@hendrix> <CAMty3ZAWPZSHtAZDf_0Dpx588YGGv3pJX1cXMfkZus3+WF94cA@mail.gmail.com>
 <20191103173227.GF7001@gilmour>
In-Reply-To: <20191103173227.GF7001@gilmour>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Thu, 21 Nov 2019 17:24:47 +0530
Message-ID: <CAMty3ZD5uxU=xb0z7PWaXzodYbWRJkP9HjGX-HZYFT4bwk0GOg@mail.gmail.com>
Subject: Re: [PATCH v11 4/7] drm/sun4i: dsi: Handle bus clock explicitly
To:     Maxime Ripard <mripard@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        devicetree <devicetree@vger.kernel.org>,
        David Airlie <airlied@linux.ie>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Maxime,

On Sun, Nov 3, 2019 at 11:02 PM Maxime Ripard <mripard@kernel.org> wrote:
>
> On Fri, Nov 01, 2019 at 07:42:55PM +0530, Jagan Teki wrote:
> > Hi Maxime,
> >
> > On Tue, Oct 29, 2019 at 2:24 PM Maxime Ripard <mripard@kernel.org> wrote:
> > >
> > > On Tue, Oct 29, 2019 at 04:03:56AM +0530, Jagan Teki wrote:
> > > > > > explicit handling of common clock would require since the A64
> > > > > > doesn't need to mention the clock-names explicitly in dts since it
> > > > > > support only one bus clock.
> > > > > >
> > > > > > Also pass clk_id NULL instead "bus" to regmap clock init function
> > > > > > since the single clock variants no need to mention clock-names
> > > > > > explicitly.
> > > > >
> > > > > You don't need explicit clock handling. Passing NULL as the argument
> > > > > in regmap_init_mmio_clk will make it use the first clock, which is the
> > > > > bus clock.
> > > >
> > > > Indeed I tried that, since NULL clk_id wouldn't enable the bus clock
> > > > during regmap_mmio_gen_context code, passing NULL triggering vblank
> > > > timeout.
> > >
> > > There's a bunch of users of NULL in tree, so finding out why NULL
> > > doesn't work is the way forward.
> >
> > I'd have looked the some of the users before checking the code as
> > well. As I said passing NULL clk_id to devm_regmap_init_mmio_clk =>
> > __devm_regmap_init_mmio_clk would return before processing the clock.
> >
> > Here is the code snippet on the tree just to make sure I'm on the same
> > page or not.
> >
> > static struct regmap_mmio_context *regmap_mmio_gen_context(struct device *dev,
> >                                         const char *clk_id,
> >                                         void __iomem *regs,
> >                                         const struct regmap_config *config)
> > {
> >         -----------------------
> >         --------------
> >         if (clk_id == NULL)
> >                 return ctx;
> >
> >         ctx->clk = clk_get(dev, clk_id);
> >         if (IS_ERR(ctx->clk)) {
> >                 ret = PTR_ERR(ctx->clk);
> >                 goto err_free;
> >         }
> >
> >         ret = clk_prepare(ctx->clk);
> >         if (ret < 0) {
> >                 clk_put(ctx->clk);
> >                 goto err_free;
> >         }
> >         -------------
> >         ---------------
> > }
> >
> > Yes, I did check on the driver in the tree before committing explicit
> > clock handle, which make similar requirements like us in [1]. this
> > imx2 wdt driver is handling the explicit clock as well. I'm sure this
> > driver is updated as I have seen few changes related to this driver in
> > ML.
>
> I guess we have two ways to go at this then.
>
> Either we remove the return, but it might have a few side-effects, or
> we call clk_get with NULL or bus depending on the case, and then call
> regmap_mmio_attach_clk.

Thanks for the inputs.

Please have a look at this snippet, I have used your second
suggestions. let me know if you have any comments?

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index 8fa90cfc2ac8..91c95e56d870 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -1109,24 +1109,36 @@ static int sun6i_dsi_probe(struct platform_device *pdev)
         return PTR_ERR(dsi->regulator);
     }

-    dsi->regs = devm_regmap_init_mmio_clk(dev, "bus", base,
-                          &sun6i_dsi_regmap_config);
-    if (IS_ERR(dsi->regs)) {
-        dev_err(dev, "Couldn't create the DSI encoder regmap\n");
-        return PTR_ERR(dsi->regs);
-    }
-
     dsi->reset = devm_reset_control_get_shared(dev, NULL);
     if (IS_ERR(dsi->reset)) {
         dev_err(dev, "Couldn't get our reset line\n");
         return PTR_ERR(dsi->reset);
     }

+    dsi->regs = regmap_init_mmio(dev, base, &sun6i_dsi_regmap_config);
+    if (IS_ERR(dsi->regs)) {
+        dev_err(dev, "Couldn't init regmap\n");
+        return PTR_ERR(dsi->regs);
+    }
+
+    dsi->bus_clk = devm_clk_get(dev, NULL);
+    if (IS_ERR(dsi->bus_clk)) {
+        dev_err(dev, "Couldn't get the DSI bus clock\n");
+        ret = PTR_ERR(dsi->bus_clk);
+        goto err_regmap;
+    } else {
+        printk("Jagan.. Got the BUS clock\n");
+        ret = regmap_mmio_attach_clk(dsi->regs, dsi->bus_clk);
+        if (ret)
+            goto err_bus_clk;
+    }
+
     if (dsi->variant->has_mod_clk) {
         dsi->mod_clk = devm_clk_get(dev, "mod");
         if (IS_ERR(dsi->mod_clk)) {
             dev_err(dev, "Couldn't get the DSI mod clock\n");
-            return PTR_ERR(dsi->mod_clk);
+            ret = PTR_ERR(dsi->mod_clk);
+            goto err_attach_clk;
         }
     }

@@ -1167,6 +1179,14 @@ static int sun6i_dsi_probe(struct platform_device *pdev)
 err_unprotect_clk:
     if (dsi->variant->has_mod_clk)
         clk_rate_exclusive_put(dsi->mod_clk);
+err_attach_clk:
+    if (!IS_ERR(dsi->bus_clk))
+        regmap_mmio_detach_clk(dsi->regs);
+err_bus_clk:
+    if (!IS_ERR(dsi->bus_clk))
+        clk_put(dsi->bus_clk);
+err_regmap:
+    regmap_exit(dsi->regs);
     return ret;
 }

@@ -1181,6 +1201,13 @@ static int sun6i_dsi_remove(struct platform_device *pdev)
     if (dsi->variant->has_mod_clk)
         clk_rate_exclusive_put(dsi->mod_clk);

+    if (!IS_ERR(dsi->bus_clk)) {
+        regmap_mmio_detach_clk(dsi->regs);
+        clk_put(dsi->bus_clk);
+    }
+
+    regmap_exit(dsi->regs);
+
     return 0;
 }


Jagan.
