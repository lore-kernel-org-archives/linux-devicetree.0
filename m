Return-Path: <SRS0=jMr8=BA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CDC1C433E4
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jul 2020 05:37:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 05AF620792
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jul 2020 05:37:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727012AbgGUFhu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 21 Jul 2020 01:37:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbgGUFhu (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 21 Jul 2020 01:37:50 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A5C1C061794
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2020 22:37:50 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: rcn)
        with ESMTPSA id 4283C295F2C
Date:   Tue, 21 Jul 2020 07:37:45 +0200
From:   Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To:     Wei Xu <xuwei5@hisilicon.com>
Cc:     laurent.pinchart@ideasonboard.com, kernel@collabora.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        robh+dt@kernel.org, michal.simek@xilinx.com,
        mcoquelin.stm32@gmail.com, marex@denx.de
Subject: Re: [PATCH v3 2/4] arm64: dts: hisilicon: hikey: fixes to comply
 with adi,adv7533 DT binding
Message-ID: <20200721053745.b2vtrzibwzvcnsqx@rcn-XPS-13-9360>
Mail-Followup-To: Wei Xu <xuwei5@hisilicon.com>,
        laurent.pinchart@ideasonboard.com, kernel@collabora.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        robh+dt@kernel.org, michal.simek@xilinx.com,
        mcoquelin.stm32@gmail.com, marex@denx.de
References: <20200601063308.13045-1-ricardo.canuelo@collabora.com>
 <20200601063308.13045-3-ricardo.canuelo@collabora.com>
 <5F1655ED.60703@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5F1655ED.60703@hisilicon.com>
User-Agent: NeoMutt/20171215
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Wei,

On mar 21-07-2020 10:41:49, Wei Xu wrote:
> Hi Ricardo,
> 
> On 2020/6/1 14:33, Ricardo Cañuelo wrote:
> > hi3660-hikey960.dts:
> >   Define a 'ports' node for 'adv7533: adv7533@39' and the
> >   'adi,dsi-lanes' property to make it compliant with the adi,adv7533 DT
> >   binding.
> > 
> >   This fills the requirements to meet the binding requirements,
> >   remote endpoints are not defined.
> > 
> > hi6220-hikey.dts:
> >   Change property name s/pd-gpio/pd-gpios, gpio properties should be
> >   plural. This is just a cosmetic change.
> > 
> > Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>
> > Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Thanks!
> Applied this patch only to the hisilicon arm64 dt tree since
> it does not depend on the new yaml format binding.
> 
> Best Regards,
> Wei

Great, thanks!

Cheers,
Ricardo
