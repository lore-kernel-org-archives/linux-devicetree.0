From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] dt-bindings: net: renesas-ravb: Add support for R8A77995
 RAVB
Date: Thu, 14 Sep 2017 12:44:58 +0300
Message-ID: <de2287b5-f208-1ffd-e8a4-3779a11695f7@cogentembedded.com>
References: <1505347598-4156-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1505347598-4156-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello!

On 9/14/2017 3:06 AM, Yoshihiro Shimoda wrote:

> Add a new compatible string for the R8A77995 (R-Car D3) RAVB.
> 
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

    Usually those are added after sign-off.

> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Acked-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

> ---
>   Changes from v1:
>    - Based on r8a77970 patch.
>     https://marc.info/?l=linux-renesas-soc&m=150524655515476

    So this is against net-next, right? The net.git repo now has a patch 
making me a reviewer for the Renesas bindings too.

[...]

MBR, Sergei
