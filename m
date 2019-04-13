Return-Path: <SRS0=x3bE=SP=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-lj1-f196.google.com ([209.85.208.196]:44370 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727104AbfDMSZM (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 13 Apr 2019 14:25:12 -0400
Received: by mail-lj1-f196.google.com with SMTP id h16so11771339ljg.11
        for <devicetree@vger.kernel.org>; Sat, 13 Apr 2019 11:25:10 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a77980: Add "renesas,id" to
 VIN
References: <20190412113832.30075-1-jacopo+renesas@jmondi.org>
 <20190412113832.30075-3-jacopo+renesas@jmondi.org>
Message-ID: <9797b2c6-58b0-954c-0d8d-f60c95ebc8e1@cogentembedded.com>
Date: Sat, 13 Apr 2019 21:25:08 +0300
MIME-Version: 1.0
In-Reply-To: <20190412113832.30075-3-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>, niklas.soderlund@ragnatech.se, laurent.pinchart@ideasonboard.com, horms@verge.net.au, geert+renesas@glider.be
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-media@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 04/12/2019 02:38 PM, Jacopo Mondi wrote:

> Add the "renesas,id" property to VIN nodes in the R-Car V3H R8A77980
> device tree.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
> 
> I do not have a V3H board to test on, but I suspect VIN failed to probe
> on V3H before these 2 patches.

   Yes, probably. The upstream patch wasn't ever runtime tested, so this
went unnoticed. The BSPs use the old soc_camera driver.

> If that's the case, these patches would merit
> Fixes: 3182aa4e0bf4 ("arm64: dts: renesas: r8a77980: add CSI2/VIN support")

   I'm OK with that.

> Sergei, do you still have a V3H board around? Could I have your Tested-by
> tag if things are fine now?

   I have V3H Stater Kit on my desk but I don't think it has VINs wired to
anything...

> Thanks
>   j

MBR, Sergei
