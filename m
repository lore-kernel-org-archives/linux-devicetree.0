From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2] ARM: DTS: r8a7794: alt: Fix PFC names for DU
Date: Fri, 4 Nov 2016 14:43:18 +0300
Message-ID: <c0a3c44b-545c-7af3-feed-857cb20ef698@cogentembedded.com>
References: <1478180574-15464-1-git-send-email-jacopo@jmondi.org>
 <1478201686-25488-1-git-send-email-jacopo@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1478201686-25488-1-git-send-email-jacopo@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Jacopo Mondi <jacopo@jmondi.org>, horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello.

On 11/3/2016 10:34 PM, Jacopo Mondi wrote:

> Update the PFC pin groups and function names of DU interface for
> r8a7794 ALT board.
>
> The currently specified pin groups and function names prevented PFC and
> DU interfaces from being correctly configured:
>
> sh-pfc e6060000.pin-controller: function 'du' not supported
> sh-pfc e6060000.pin-controller: invalid function du in map table
> sh-pfc e6060000.pin-controller: function 'du' not supported
> sh-pfc e6060000.pin-controller: invalid function du in map table
> sh-pfc e6060000.pin-controller: function 'du' not supported
> sh-pfc e6060000.pin-controller: invalid function du in map table
> sh-pfc e6060000.pin-controller: function 'du' not supported
> sh-pfc e6060000.pin-controller: invalid function du in map table
> rcar-du: probe of feb00000.display failed with error -22
>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>

Acked-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

MBR, Sergei
