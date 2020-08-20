Return-Path: <SRS0=Ay4y=B6=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AA6AC433E3
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Aug 2020 11:42:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1839F2076E
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Aug 2020 11:42:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="V80QP2Vk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730883AbgHTLmp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 20 Aug 2020 07:42:45 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:45208 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726786AbgHTLmm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 20 Aug 2020 07:42:42 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07KBgdNg096474;
        Thu, 20 Aug 2020 06:42:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1597923759;
        bh=EIH1ECgBvoD2uN2VEYtoKj0pqSnYNbZnnh+P30Q9wzY=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=V80QP2Vk5DFaRAaiEz/9AYEcaFy/NUdLU/90Xp7yNt4/KnEc6gG7j1wDiPpb5ctnx
         thJ9RImAZiouq8piZQwqhNvXxRNj58fGyW/f5dmD5AXqBovCEDwmEh83DhPwkGmXMT
         lbCylLKgkmlqIGMM/97bsvjGMo5rzc1UlmIthSZw=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07KBgdjp007063
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 20 Aug 2020 06:42:39 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 20
 Aug 2020 06:42:38 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 20 Aug 2020 06:42:38 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07KBgck6047929;
        Thu, 20 Aug 2020 06:42:38 -0500
Date:   Thu, 20 Aug 2020 06:42:38 -0500
From:   Nishanth Menon <nm@ti.com>
To:     Suman Anna <s-anna@ti.com>
CC:     Tero Kristo <t-kristo@ti.com>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/7] arm64: dts: ti: k3-j721e-common-proc-board: Add
 mailboxes to C66x DSPs
Message-ID: <20200820114238.7ovvxq5n3fogzowi@akan>
References: <20200820010331.2911-1-s-anna@ti.com>
 <20200820010331.2911-3-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200820010331.2911-3-s-anna@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 20:03-20200819, Suman Anna wrote:
> Add the required 'mboxes' property to both the C66x DSP processors on the
> TI J721E common processor board. The mailboxes and some shared memory

I am not sure I understand the logic here. The carveout is added to
p0 SOM - and the mbox is added to common_proc_board. I am not sure I
get the difference. The C66x processors are on the SoC, stack is as
follows: - SoC - SoM - Common Proc board

I am just wondering if the carveouts and mbox linkage should be in the
common processor board? if that makes sense at all? I know we already
have other definitions.. Trying to see if we are making it harder to
understand the definition than that is necessary..

> are required for running the Remote Processor Messaging (RPMsg) stack
> between the host processor and each of the R5Fs. The chosen sub-mailboxes
> match the values used in the current firmware images. This can be changed,
> if needed, as per the system integration needs after making appropriate
> changes on the firmware side as well.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
> index e8fc01d97ada..ff541dc09eca 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
> @@ -379,6 +379,14 @@ &mailbox0_cluster11 {
>  	status = "disabled";
>  };
>  
> +&c66_0 {
> +	mboxes = <&mailbox0_cluster3 &mbox_c66_0>;
> +};
> +
> +&c66_1 {
> +	mboxes = <&mailbox0_cluster3 &mbox_c66_1>;
> +};
> +
>  &main_sdhci0 {
>  	/* eMMC */
>  	non-removable;
> -- 
> 2.28.0
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
