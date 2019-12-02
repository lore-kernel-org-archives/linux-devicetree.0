Return-Path: <SRS0=pYa2=ZY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB8FFC432C0
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 22:28:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8CAD820862
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 22:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575325700;
	bh=vtI7mRkc90kox/lp/QnBdenTVtng043mxOskJbzb9LY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=dyOerrEsOuqiJWfI8u9kaXPGuLnj4l3ONTjlPYupZQwwq/yLVzZltddU5Jep4RyMD
	 ty87YdHekt4Al1Gi0HbtRy0MO4KqhDmrDnTTY+2EEIy0FdNc1aKrmZn+VXgyBPMVxW
	 1oF0T5jRtbZtw1urjPVyLbcbSLNzr1NKGVqjTlgo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725853AbfLBW2U (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Dec 2019 17:28:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:50724 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725834AbfLBW2T (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 2 Dec 2019 17:28:19 -0500
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A06FC20865
        for <devicetree@vger.kernel.org>; Mon,  2 Dec 2019 22:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575325698;
        bh=vtI7mRkc90kox/lp/QnBdenTVtng043mxOskJbzb9LY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=raTio8Ys9WlfQ98qiG2STnIIyPWVEnVIJb/FJkcQEoyHYxDITPZpNIkt5Y2yp16Ts
         cSsS+PL/X2nuQTOuK7wBZo8pC7jiTNQfD/fR/7rgytt+/QGcfnzlE76pmReo+TDIUk
         J9lMFH+gNRZ8S4//f6ye6YEbjkvZgO5VRaZPSJg8=
Received: by mail-qk1-f179.google.com with SMTP id d124so1361386qke.6
        for <devicetree@vger.kernel.org>; Mon, 02 Dec 2019 14:28:18 -0800 (PST)
X-Gm-Message-State: APjAAAVWC9NOWFREfVx/rKdGQ/7xKuskF4GBdBEvip598V9sdb/V758m
        3EQV7fw65u/vLwmUEsEvg7IS9zbot2PQLCn/eg==
X-Google-Smtp-Source: APXvYqwalRjZ37h1dEK3CqI89rRu9nNpBLiaC1kZVv+jq2pIZ7D2g8faIIJOpR+XFOSAiuprP7WyGvAVM0hjiKKL/qQ=
X-Received: by 2002:a37:4904:: with SMTP id w4mr1472009qka.119.1575325697704;
 Mon, 02 Dec 2019 14:28:17 -0800 (PST)
MIME-Version: 1.0
References: <20191128090726.51107-1-linus.walleij@linaro.org>
In-Reply-To: <20191128090726.51107-1-linus.walleij@linaro.org>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 2 Dec 2019 16:28:05 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL5RpR9QVsdJGZoBfGfeAmpSoVKW=60zHLWZ3BkPuwbJQ@mail.gmail.com>
Message-ID: <CAL_JsqL5RpR9QVsdJGZoBfGfeAmpSoVKW=60zHLWZ3BkPuwbJQ@mail.gmail.com>
Subject: Re: [PATCH v6] drm/panel: Add generic DSI display controller YAML bindings
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Nov 28, 2019 at 3:07 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> This adds a starting point for processing and defining generic
> bindings used by DSI display controllers and panels attached to
> the virtual DSI ports.
>
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Cc: devicetree@vger.kernel.org
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v5->v6:
> - Rename subject to pertain to DSI display controllers in general.
> - Change some of the wording in the DSI controller description text,
>   making it clear that the binding pertains to the combination of a
>   DSI controller with at least one panel attached.
> - Add a proper compiling example.
> ChangeLog v4->v5:
> - Drop the example.
> - I still have a vert annoying error message in the Sony
>   panel bindings that uses this schema:
>   sony,acx424akp.example.dt.yaml: panel@0: $nodename:0: 'panel@0' does not match '^dsi-controller(@.*)?$'
>   As this is modeled very closely to
>   Documentation/devicetree/bindings/net/mdio.yaml
>   and that one doesn't emit this type of warning for its ethernet-phy@0
>   etc I am pretty much clueless and just can't see what the problem
>   is.
> - If I can't figure this out the only viable next step is to drop the
>   ambition to create yaml bindings simply because I'm unable to do
>   it, and go back to traditional text bindings :(
> ChangeLog v3->v4:
> - Rename into display/dsi-controller.yaml
> - Require a virtual channel number for the DSI panel, as
>   DSI have this 2-bit virtual address field.
> - Bring in some but not all properties from the existing MIPI
>   DSI bindings. This schema can be used with simpler panels but
>   not complex panels with multiple virtual channels for the
>   moment. Let's handle it when we get there.
> - Add an example.
> ChangeLog v2->v3:
> - Make a more complete DSI panel binding including the controller
>   and its address-cells and size-cells and a pattern for the panel
>   nodes. The panel is one per DSI master, the reg property is
>   compulsory but should always be 0 (as far as I can tell) as
>   only one panel can be connected. The bus doesn't really have
>   any addresses for the panel, the address/reg notation seems
>   to be cargo-culted from the port graphs and is not necessary
>   to parse some device trees, it is used to tell whether the
>   node is a panel or not rather than any addressing.
> - I have no idea how many displays you can daisychain on a single
>   DSI master, I just guess 15 will be enough. The MIPI-specs
>   are memberwalled. Someone who knows can tell perhaps?
> ChangeLog v1->v2:
> - New patch after feedback.
> ---
>  .../bindings/display/dsi-controller.yaml      | 91 +++++++++++++++++++
>  1 file changed, 91 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/dsi-controller.yaml

I'll let you apply to drm-misc.

Reviewed-by: Rob Herring <robh@kernel.org>
