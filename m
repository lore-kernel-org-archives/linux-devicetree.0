Return-Path: <SRS0=L07u=CG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C298BC433E2
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Aug 2020 13:10:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8481E20665
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Aug 2020 13:10:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="h6hW5yaR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729461AbgH1NKf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 28 Aug 2020 09:10:35 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:39128 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729455AbgH1NHd (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 28 Aug 2020 09:07:33 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07SD78NA041901;
        Fri, 28 Aug 2020 08:07:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1598620028;
        bh=ekVVOEWqdgbGbUmbraegt5QvlLGNEUCePCEa+IFZYP4=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=h6hW5yaRX5gi/dKUHVJbd6+5XEu51buMJcM6mX2tqtS8kKeaChcnRzoBW7544Qdhm
         t7bHyUUrv2ErG/AOa/uy+OG0x3qiC3VySAE4MtZTXVMwoyPnOIrtEDU8Zf1dXLiuD8
         ZQvjLO5emljhoPJhuTeq05tAUqFB0ZoQ8fnYNGYs=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07SD78xV130749
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 28 Aug 2020 08:07:08 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 28
 Aug 2020 08:07:07 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 28 Aug 2020 08:07:07 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07SD77KX025722;
        Fri, 28 Aug 2020 08:07:07 -0500
Date:   Fri, 28 Aug 2020 08:07:07 -0500
From:   Nishanth Menon <nm@ti.com>
To:     Lokesh Vutla <lokeshvutla@ti.com>
CC:     Tero Kristo <t-kristo@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Sekhar Nori <nsekhar@ti.com>, Suman Anna <s-anna@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: arm: ti: Convert K3 board/soc
 bindings to DT schema
Message-ID: <20200828130707.gwjh7zht3om72qxe@akan>
References: <20200827065144.17683-1-lokeshvutla@ti.com>
 <20200827065144.17683-2-lokeshvutla@ti.com>
 <20200828004105.givypeu3vextefc6@akan>
 <1c9508ce-9336-e20a-5b58-5dd257247273@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1c9508ce-9336-e20a-5b58-5dd257247273@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 08:44-20200828, Lokesh Vutla wrote:
> Hi Nishanth,
> 
> On 28/08/20 6:11 am, Nishanth Menon wrote:
> > On 12:21-20200827, Lokesh Vutla wrote:
> >> Convert TI K3 Board/SoC bindings to DT schema format.
> >>
> >> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> >> ---
> >>  .../devicetree/bindings/arm/ti/k3.txt         | 26 ----------------
> >>  .../devicetree/bindings/arm/ti/k3.yaml        | 31 +++++++++++++++++++
> >>  MAINTAINERS                                   |  2 +-
> >>  3 files changed, 32 insertions(+), 27 deletions(-)
> >>  delete mode 100644 Documentation/devicetree/bindings/arm/ti/k3.txt
> >>  create mode 100644 Documentation/devicetree/bindings/arm/ti/k3.yaml
> > 
> > 
> > Thanks for doing this, but I have a problem with dbs_check and dtbs
> > W=2 build warnings on existing dts files that this exposes further..
> 
> IMHO, that should not block the conversion to yaml bindings. May I know the
> problem you are seeing?


Things are starting to literally bitrot and I saw Rob's[1] attempt to try
and clean up the cruft of warnings we had introduced. we should fix all that up
before introducing new platforms. I am going to see how much cleanup I
can do today, but will help if more folks pitch in.

> 
> > Do you mind pulling this patch out of this j7200 series ? I would
> > rather us cleanup the warnings a bit as well, and deal with yaml
> > conversion seperate from j7200 bindings?
> 
> Ill wait for Rob's view on this. He already asked to convert it during J721e
> binding update. Not sure we would like to delay any further.
> 

Sure.


[1] https://lore.kernel.org/linux-arm-kernel/CAL_JsqLqVdyKkVKJP0EG7s7m4A=r-+DjY+X4kVs9boFfPoHsfw@mail.gmail.com/#r
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
