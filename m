Return-Path: <SRS0=Z6b/=FS=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:33838 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751414AbeBXSBU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 24 Feb 2018 13:01:20 -0500
Received: by mail-lf0-f68.google.com with SMTP id l191so16742793lfe.1
        for <devicetree@vger.kernel.org>; Sat, 24 Feb 2018 10:01:19 -0800 (PST)
Subject: Re: [PATCH] DT: net: renesas,ravb: document R8A77980 bindings
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
References: <1eb6b81c-500e-ef21-7c21-e8bc7a1ff227@cogentembedded.com>
Message-ID: <ad5fce6e-81df-f898-387e-3c40417fe691@cogentembedded.com>
Date: Sat, 24 Feb 2018 21:01:15 +0300
MIME-Version: 1.0
In-Reply-To: <1eb6b81c-500e-ef21-7c21-e8bc7a1ff227@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, linux-renesas-soc@vger.kernel.org, David Miller <davem@davemloft.net>
List-ID: <devicetree@vger.kernel.org>

On 02/01/2018 11:13 PM, Sergei Shtylyov wrote:

> Renesas R-Car V3H (R8A77980) SoC has the R-Car gen3 compatible EtherAVB
> device, so document the SoC specific bindings.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> The patch is against DaveM's 'net-next.git' repo but I wouldn't mind if it's
> applied to 'net.git' instead. :-)

   David, I see this patch was marked as "not applicable" in patchwork. Why, because
it was posted during the merge window?

MNBR, Sergei
