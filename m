Return-Path: <SRS0=cv1X=H3=vger.kernel.org=devicetree-owner@kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55016 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752228AbeEHNqK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 8 May 2018 09:46:10 -0400
Date: Tue, 8 May 2018 15:46:06 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 0/2] ARM: dts: renesas: Add missing interrupt-affinity to
 PMU
Message-ID: <20180508134605.7bpanbkuuxibgza7@verge.net.au>
References: <1525700405-7993-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1525700405-7993-1-git-send-email-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, May 07, 2018 at 03:40:03PM +0200, Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus,
> 
> The Cortex-A9 PMU nodes on SH-Mobile AG5 and Emma Mobile EV2 reference
> two interrupts, but lack interrupt-affinity properties, leading to:
> 
>     hw perfevents: no interrupt-affinity property for /pmu, guessing.
> 
> This series adds the missing properties to fix this.
> 
> Thanks!
> 
> Geert Uytterhoeven (2):
>   ARM: dts: sh73a0: Add missing interrupt-affinity to PMU node
>   ARM: dts: emev2: Add missing interrupt-affinity to PMU node

Thanks, applied.
