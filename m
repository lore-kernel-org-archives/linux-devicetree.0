Return-Path: <SRS0=/Yzg=6L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4B26C54FD0
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Apr 2020 09:50:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BA4E8206B8
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Apr 2020 09:50:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726349AbgD0JuN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Apr 2020 05:50:13 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35928 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726755AbgD0JuN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Apr 2020 05:50:13 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: rcn)
        with ESMTPSA id A6FFF2A0DCF
Date:   Mon, 27 Apr 2020 11:50:07 +0200
From:   Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     devicetree@vger.kernel.org, enric.balletbo@collabora.com,
        robh+dt@kernel.org, kernel@collabora.com,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] dt-bindings: display: anx7814.txt: convert to yaml
Message-ID: <20200427095007.5b5hauxev7yho2bj@rcn-XPS-13-9360>
References: <20200427084658.27962-1-ricardo.canuelo@collabora.com>
 <20200427090900.GA25058@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200427090900.GA25058@ravnborg.org>
User-Agent: NeoMutt/20171215
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On lun 27-04-2020 11:09:00, Sam Ravnborg wrote:
> Hi Ricardo.
> 
> On Mon, Apr 27, 2020 at 10:46:58AM +0200, Ricardo Cañuelo wrote:
> > This converts the Analogix ANX7814 bridge DT binding to yaml. Port
> > definitions and descriptions were expanded, apart from that it's a
> > direct translation from the original binding.
> > 
> > Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>
> 
> One comment below, with that fixed:
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>
> ...
>
> > +
> > +    i2c0 {
> Name this i2c

Hi Sam,

Thanks for the review, I'll do that.

Cheers,
Ricardo
