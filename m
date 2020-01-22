Return-Path: <SRS0=6ipe=3L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6AE5C32771
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jan 2020 07:21:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 93B0124125
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jan 2020 07:21:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="j2de91DR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726077AbgAVHVa (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 22 Jan 2020 02:21:30 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:58202 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725884AbgAVHVa (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 22 Jan 2020 02:21:30 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00M7LF1d067824;
        Wed, 22 Jan 2020 01:21:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579677675;
        bh=tuTL4sy8/HeIWgu77c/L0wft9ngd5/VvsXnD0Sjb69c=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=j2de91DRSR8TsZd9qokQJJm9yWglwcaxXA+HihQJyliny9X8ME+obivyz25o3rwL6
         +TWC35zBF/9qxZjthACt3mqO/UZ11wOut+QR8nGRQCfbxW9gPYfPJcOHeuL0MYxASf
         gfR7FntSu4FG2XNbQkysJnZ9y/8X+SMNFd6SX+0U=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00M7LF9p017807
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 22 Jan 2020 01:21:15 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 22
 Jan 2020 01:21:14 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 22 Jan 2020 01:21:14 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00M7LCYW067754;
        Wed, 22 Jan 2020 01:21:13 -0600
Subject: Re: OK to relicense text from display-timings.txt?
To:     Sam Ravnborg <sam@ravnborg.org>,
        Steffen Trumtrar <s.trumtrar@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     <devicetree@vger.kernel.org>
References: <20200121211421.GA15494@ravnborg.org>
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <e49653de-023c-5598-bc4e-acc605af3e08@ti.com>
Date:   Wed, 22 Jan 2020 09:21:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200121211421.GA15494@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Sam,

On 21/01/2020 23.14, Sam Ravnborg wrote:
> Hi Steffen/Philipp.
> 
> In commit:
> cc3f414cf2e404130584b63d373161ba6fd24bc2 ("video: add of helper for display timings/videomode")
> 
> You added display-timings.txt - which include a nice drawing that explains
> the timing signals.
> 
> I am working on a DT schema variant of the same - see:
> https://www.spinics.net/lists/devicetree/msg331526.html
> 
> In the revised version the preferred license is:
> (GPL-2.0-only OR BSD-2-Clause)
> 
> Is it OK to re-license to (GPL-2.0-only OR BSD-2-Clause) in the
> DT schema variant?
> 
> 
> Hi Peter.
> 
> You contributed with following patch:
> 86f46565dff313a149b4bd09d4a8655274ef8f33 ("dt-bindings: display: display-timing: Add property to configure sync drive edge")
> 
> Part of the text is re-used in the panel-timing.yaml file.
> OK to relicense?

As it is a necessity for the DT binding, yes (not a big fan of BSD
license otherwise).

Acked-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

> 
> Hi Laurent.
> 
> You contributed the following patch:
> 9cad9c95d7e8d6d61d8c9729e0b6bbd18f47d86d ("Documentation: DocBook DRM framework documentation")
> This patch added a nice timing diagram - which Daniel Vetter later moved to drm_modes.h.
> 
> The timing diagram is re-used in panel-timing.yaml.
> As the original author are you OK that this is relicensed?
> 
> 
> Note: I need positive reply from all of you to re-license.
> In case I get it your postive feedback it will be documented in
> the commit message for panel-timing.
> To keep a record for the background for the re-licensing.
> 
> 	Sam
> 

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
