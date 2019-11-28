Return-Path: <SRS0=Bobf=ZU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9179C432C0
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 Nov 2019 09:29:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9740D21774
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 Nov 2019 09:29:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbfK1J3J (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 Nov 2019 04:29:09 -0500
Received: from ns.iliad.fr ([212.27.33.1]:52872 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726191AbfK1J3J (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 28 Nov 2019 04:29:09 -0500
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id ADBD02056B;
        Thu, 28 Nov 2019 10:29:07 +0100 (CET)
Received: from [192.168.108.51] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 99B2820234;
        Thu, 28 Nov 2019 10:29:07 +0100 (CET)
Subject: Re: [RFC PATCH 1/1] arm64: dts: added basic DTS for qmx8 congatec
 board
To:     Oliver Graute <oliver.graute@kococonnector.com>
References: <20191029122026.14208-1-oliver.graute@kococonnector.com>
 <20191029122026.14208-2-oliver.graute@kococonnector.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        DT <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <9b865fc1-3c7a-f1bd-8ef2-65088d64b314@free.fr>
Date:   Thu, 28 Nov 2019 10:29:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191029122026.14208-2-oliver.graute@kococonnector.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Thu Nov 28 10:29:07 2019 +0100 (CET)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 29/10/2019 13:23, Oliver Graute wrote:

> +&fec1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_fec1>;
> +	phy-mode = "rgmii";
> +	phy-handle = <&ethphy0>;
> +	fsl,magic-packet;
> +	fsl,rgmii_txc_dly;
> +	fsl,rgmii_rxc_dly;
> +	status = "okay";

The two fsl,rgmii* properties do not exist in mainline.
I suppose there were copied from downstream?

> +
> +	mdio {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ethphy0: ethernet-phy@0 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <6>;
> +			at803x,eee-disabled;
> +			at803x,vddio-1p8v;
> +		};
> +	};
> +};

Regards.
