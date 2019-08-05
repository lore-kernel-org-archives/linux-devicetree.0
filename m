Return-Path: <SRS0=3ErU=WB=vger.kernel.org=devicetree-owner@kernel.org>
Received: from anchovy2.45ru.net.au ([203.30.46.146]:58474 "EHLO
        anchovy2.45ru.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726423AbfHEIeG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 5 Aug 2019 04:34:06 -0400
Subject: Re: [PATCH v2 0/2] clk: clk-cdce925: Add regulator support
References: <1561691950-42154-1-git-send-email-preid@electromag.com.au>
From: Phil Reid <preid@electromag.com.au>
Message-ID: <116f2971-c311-81b8-b0b9-0bb6a74b75e4@electromag.com.au>
Date: Mon, 5 Aug 2019 16:26:41 +0800
MIME-Version: 1.0
In-Reply-To: <1561691950-42154-1-git-send-email-preid@electromag.com.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 28/06/2019 11:19, Phil Reid wrote:
> The cdce925 power supplies could be controllable on some platforms.
> Enable them before communicating with the cdce925.
> 
> Changes from V1
> - Add devicetree updates
> 
> 
> Phil Reid (2):
>    dt-bindings: clock: cdce925: Add regulator documentation
>    clk: clk-cdce925: Add regulator support
> 
>   .../devicetree/bindings/clock/ti,cdce925.txt       |  4 +++
>   drivers/clk/clk-cdce925.c                          | 34 ++++++++++++++++++++++
>   2 files changed, 38 insertions(+)
> 

Any more feedback on this series?

-- 
Regards
Phil Reid
