Return-Path: <SRS0=NbWy=4X=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8CECC10DCE
	for <linux-devicetree@archiver.kernel.org>; Fri,  6 Mar 2020 09:57:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AC02C207FD
	for <linux-devicetree@archiver.kernel.org>; Fri,  6 Mar 2020 09:57:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726069AbgCFJ5M convert rfc822-to-8bit (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 6 Mar 2020 04:57:12 -0500
Received: from gloria.sntech.de ([185.11.138.130]:59936 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726054AbgCFJ5M (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 6 Mar 2020 04:57:12 -0500
Received: from ip5f5a5d2f.dynamic.kabel-deutschland.de ([95.90.93.47] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1jA9j9-0000WK-EV; Fri, 06 Mar 2020 10:57:07 +0100
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     linux-rockchip@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: rockchip: Enable eDP display on rk3399 evb
Date:   Fri, 06 Mar 2020 10:57:06 +0100
Message-ID: <9485978.lUYvBEQYsF@diego>
In-Reply-To: <88f23464-1868-464f-7e0b-c9cd1c12c9d5@gmail.com>
References: <3739122.I207nbqjcC@phil> <88f23464-1868-464f-7e0b-c9cd1c12c9d5@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Johan,

Am Freitag, 6. März 2020, 08:39:13 CET schrieb Johan Jonker:
> Hi,
> 
> Missing #address-cells, #size-cells
> Can you still fix that?
> Also include all email addresses that are produced by:
> 
> ./scripts/get_maintainer.pl --nogit-fallback --nogit
> 
> > 
> > Am Donnerstag, 5. März 2020, 12:39:12 CET schrieb Andy Yan:
> >> Add eDP panle and enable relative dt node like vop/iommu
> >> to enable eDP display on rk3399 evb.
> >> 
> >> Signed-off-by: Andy Yan <andy.yan at rock-chips.com>
> > 
> > applied for 5.7 - after removing the added blank line at the end
> > of the file
> > 
> > Thanks
> > Heiko
> 
> 
> 
> > +&edp {
> > +	status = "okay";
> > +	force-hpd;
> > +
> > +	ports {
> 
> #address-cells = <1>;
> #size-cells = <0>;
> 
> Don't forget that extra empty line here.

same comment as on the Pinebook pro, the #address-cells
under the ports node get inherited from the main edp node
in rk3399.dtsi

Heiko

> 
> > +		edp_out: port at 1 {
> > +			reg = <1>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +
> > +			edp_out_panel: endpoint at 0 {
> > +				reg = <0>;
> > +				remote-endpoint = <&panel_in_edp>;
> > +			};
> > +		};
> > +	};
> > +};
> 
> 




