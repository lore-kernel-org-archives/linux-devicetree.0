Return-Path: <SRS0=Gvwe=WR=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-lj1-f194.google.com ([209.85.208.194]:41368 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726899AbfHUH4Y (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 21 Aug 2019 03:56:24 -0400
Received: by mail-lj1-f194.google.com with SMTP id m24so1228290ljg.8
        for <devicetree@vger.kernel.org>; Wed, 21 Aug 2019 00:56:23 -0700 (PDT)
Date: Wed, 21 Aug 2019 09:56:20 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH] dt-bindings: clk: emev2: Rename bindings documentation
 file
Message-ID: <20190821075620.GB28351@bigcity.dyn.berto.se>
References: <20190819135630.18462-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190819135630.18462-1-horms+renesas@verge.net.au>
Sender: devicetree-owner@vger.kernel.org
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Simon,

Thanks for your work.

On 2019-08-19 15:56:30 +0200, Simon Horman wrote:
> Rename the device tree clock bindings for Renesas EMMA Mobile EV2
> from emev2-clock.txt to emev2-renesas,emev2-smu.txt.

Should this not be renesas,emev2-smu.txt to align with the compatible 
string?

> 
> This is part of an ongoing effort to name bindings documentation files for
> Renesas IP blocks consistently, in line with the compat strings they
> document.
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
> Based on v5.3-rc1
> ---
>  .../bindings/clock/{emev2-clock.txt => emev2-renesas,emev2-smu.txt}       | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename Documentation/devicetree/bindings/clock/{emev2-clock.txt => emev2-renesas,emev2-smu.txt} (100%)
> 
> diff --git a/Documentation/devicetree/bindings/clock/emev2-clock.txt b/Documentation/devicetree/bindings/clock/emev2-renesas,emev2-smu.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/clock/emev2-clock.txt
> rename to Documentation/devicetree/bindings/clock/emev2-renesas,emev2-smu.txt
> -- 
> 2.11.0
> 

-- 
Regards,
Niklas S�derlund
