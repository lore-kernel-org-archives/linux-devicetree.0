From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: renesas: r8a77970: add LVDS support
Date: Tue, 10 Apr 2018 15:02:39 +0300
Message-ID: <0baa0f6e-f275-4a27-c76b-e4f8aec0b5f6@cogentembedded.com>
References: <1523357646-3946-1-git-send-email-jacopo+renesas@jmondi.org>
 <1523357646-3946-4-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1523357646-3946-4-git-send-email-jacopo+renesas@jmondi.org>
Content-Language: en-MW
Sender: linux-kernel-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>, horms@verge.net.au, magnus.damm@gmail.com, geert@linux-m68k.org, laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund+renesas@ragnatech.se>
List-Id: devicetree@vger.kernel.org

On 04/10/2018 01:54 PM, Jacopo Mondi wrote:

> From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Add the LVDS device to r8a77970.dtsi in a disabled state. Also connect
> the it to the LVDS output of the DU.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> ---
> v1 -> v2:
> - Rebased on the modified endpoint name and changed patch subject to
>   comply with other patches in the series from Sergei.

   Stop, what was wrong with my R8A77970 LVDS patch, reposted on the popular
demand? :-)

MBR, Sergei
