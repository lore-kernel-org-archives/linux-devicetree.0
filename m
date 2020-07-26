Return-Path: <SRS0=vke8=BF=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B523C433DF
	for <linux-devicetree@archiver.kernel.org>; Sun, 26 Jul 2020 10:13:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E2F9D206E3
	for <linux-devicetree@archiver.kernel.org>; Sun, 26 Jul 2020 10:13:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725960AbgGZKNQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 26 Jul 2020 06:13:16 -0400
Received: from mail-out.m-online.net ([212.18.0.9]:60147 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725810AbgGZKNQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 26 Jul 2020 06:13:16 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4BDzKQ29Q0z1qrfD;
        Sun, 26 Jul 2020 12:13:14 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4BDzKQ0nmvz1qw6h;
        Sun, 26 Jul 2020 12:13:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id I3uHk3kyKvZs; Sun, 26 Jul 2020 12:13:13 +0200 (CEST)
X-Auth-Info: +UxxsQTk0lTXcwxY3B7PbpBPvZXT0hDIdYuGW0bu7v4=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Sun, 26 Jul 2020 12:13:12 +0200 (CEST)
Subject: Re: [PATCH 1/2] dt-bindings: Add DT bindings for Toshiba TC358762
 DSI-to-DPI bridge
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org, Eric Anholt <eric@anholt.net>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
References: <20200725211457.5772-1-marex@denx.de>
 <20200726070627.GC1691925@ravnborg.org>
From:   Marek Vasut <marex@denx.de>
Message-ID: <a3eb3adc-ebfc-50bb-4da9-032a5c7279fe@denx.de>
Date:   Sun, 26 Jul 2020 12:13:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200726070627.GC1691925@ravnborg.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 7/26/20 9:06 AM, Sam Ravnborg wrote:
> Hi Marek.

Hi,

> On Sat, Jul 25, 2020 at 11:14:56PM +0200, Marek Vasut wrote:
>> Add DT bindings for Toshiba TC358762 DSI-to-DPI bridge, this
>> one is used in the Raspberry Pi 7" touchscreen display unit.
[...]
> This looks like a candidate for the simple-bridge-yaml binding.
> Did you check if this is sufficient or we really need a new binding?

The binding says "Transparent non-programmable DRM bridges", but this
TC358762 one is programmable, so I would expect a separate binding file
is better in case the driver evolves and needs more DT properties.

> If we need a new binding then they to take a look at how simple-bridge
> define the ports. You can do this in a simple way than what is used
> here.
> It looks like this was copied from toshiba,tc358768.yaml, but there are
> better examples to follow.

I took a subset of the file.

[...]
