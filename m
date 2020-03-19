Return-Path: <SRS0=Rh3i=5E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7E42C4332D
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Mar 2020 17:34:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 913442071C
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Mar 2020 17:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584639285;
	bh=VXfXgaMFHwNAHnGdP2ayK9lcFqo6HP23jwlKsSeqPks=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=tYG+lQ+jvIkHpMvNZ2smGKH071arlNy3GNXZ5Kn/r5m/+mksxgfGK5EQl8XffY/QL
	 3L0IQlMq4vOqsqOPh3VrvHBCxHRIrlQr22ddS1NirRJU0jSEAbCplGX2g4siCY5l01
	 DKsO6NLD2mIga38foY+dxIqhBgnXjmgli6zM2Ibk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728189AbgCSRep (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 19 Mar 2020 13:34:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:33048 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727382AbgCSRep (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 19 Mar 2020 13:34:45 -0400
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2E7DE2071C;
        Thu, 19 Mar 2020 17:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584639284;
        bh=VXfXgaMFHwNAHnGdP2ayK9lcFqo6HP23jwlKsSeqPks=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=yADHZla9eDm6uT5/naVtKy2V7v/CxxTuk0BpddC2YxBmqic9QIobFusOdjeYAkdDd
         yay2lu6tWwGoY1Ex+C/0N15wVo9qAVgMCNgFSa5OF4MK2L+w4XWeXm/UfhsMFmWmg+
         ADdMbphVXQNOF0UHRPrnK27tXcKQ/p6D8f/lTcLc=
Received: by mail-qk1-f171.google.com with SMTP id e11so3939169qkg.9;
        Thu, 19 Mar 2020 10:34:44 -0700 (PDT)
X-Gm-Message-State: ANhLgQ38POrXbJTFTa/anRp/FuuDvAjg0NF8tyX3dlThJs4SJqDtHIte
        1XakrdYogUM6yGdYXvPPZ2jwTtuGIVGkTIImlA==
X-Google-Smtp-Source: ADFU+vvCif+AbtJFy+eeJq9FFa3yvU/q7tK8ZTPl46tG4rh1c7+IhWsiFrJ7XIwJOlAm6vTIotVo3PR3cKxoFwawl/8=
X-Received: by 2002:a37:8502:: with SMTP id h2mr4196059qkd.223.1584639283252;
 Thu, 19 Mar 2020 10:34:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200314093941.2533-1-peter.chen@nxp.com> <20200314093941.2533-2-peter.chen@nxp.com>
 <20200318220420.GA15468@bogus> <20200319064655.GB11834@b29397-desktop>
In-Reply-To: <20200319064655.GB11834@b29397-desktop>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 19 Mar 2020 11:34:31 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLF6cPCXqZiSOr6DPQad60w9Hd4yemEAmmCAR2TU86CqQ@mail.gmail.com>
Message-ID: <CAL_JsqLF6cPCXqZiSOr6DPQad60w9Hd4yemEAmmCAR2TU86CqQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] doc: dt-binding: cdns-salvo-phy: add binding doc
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "kishon@ti.com" <kishon@ti.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jun Li <jun.li@nxp.com>, dl-linux-imx <linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Mar 19, 2020 at 12:46 AM Peter Chen <peter.chen@nxp.com> wrote:
>
> On 20-03-18 16:04:20, Rob Herring wrote:
> > On Sat, 14 Mar 2020 17:39:41 +0800, Peter Chen wrote:
> > > Add Cadence SALVO PHY binding doc, this PHY is a legacy module,
> > > and is only used for USB3 and USB2.
> > >
> > > Signed-off-by: Peter Chen <peter.chen@nxp.com>
> > > ---
> > > Changes for v2:
> > > - Fix kinds of yaml style issue
> > >
> > >  .../bindings/phy/cdns,salvo-phy.yaml          | 49 +++++++++++++++++++
> > >  1 file changed, 49 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/phy/cdns,salvo-phy.yaml
> > >
> >
> > My bot found errors running 'make dt_binding_check' on your patch:
> >
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/cdns,salvo-phy.example.dt.yaml: usb3-phy@5B160000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
>
> The 'power-domains' is described at:
> Documentation/devicetree/bindings/power/power_domain.txt

.txt files don't generate warnings.

And you might want to be up to date with your kernel tree.

>
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/cdns,salvo-phy.example.dt.yaml: usb3-phy@5B160000: #phy-cells:0:0: 1 was expected
> >
>
> #phy-cell could be 0 if it is a dedicated PHY, eg single function PHY.
> See below comments from drivers/phy/phy-core.c
>
> /**
>  * of_phy_simple_xlate() - returns the phy instance from phy provider
>  * @dev: the PHY provider device
>  * @args: of_phandle_args (not used here)
>  *
>  * Intended to be used by phy provider for the common case where #phy-cells is
>  * 0. For other cases where #phy-cells is greater than '0', the phy provider
>  * should provide a custom of_xlate function that reads the *args* and returns
>  * the appropriate phy.
>  */

What's your point? You have an error either in the schema or the
example. You must fix it.

Rob
