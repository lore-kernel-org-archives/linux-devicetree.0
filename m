From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 2/7] dt-bindings: timer: renesas, cmt: Update CMT1 on
 sh73a0 and r8a7740
Date: Wed, 24 Jul 2019 13:12:52 +0200
Message-ID: <20190724111252.bamz3fwd47n3kmwj@verge.net.au>
References: <156345023791.5307.6113391102648394591.sendpatchset@octo>
 <156345026539.5307.17098096827162445534.sendpatchset@octo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <156345026539.5307.17098096827162445534.sendpatchset@octo>
Sender: linux-kernel-owner@vger.kernel.org
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, geert+renesas@glider.be, daniel.lezcano@linaro.org, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, tglx@linutronix.de
List-Id: devicetree@vger.kernel.org

On Thu, Jul 18, 2019 at 08:44:25PM +0900, Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> This patch reworks the DT binding documentation for the 6-channel
> 48-bit CMTs known as CMT1 on r8a7740 and sh73a0.
> 
> After the update the same style of DT binding as the rest of the upstream
> SoCs will now also be used by r8a7740 and sh73a0. The DT binding "cmt-48"
> is removed from the DT binding documentation, however software support for
> this deprecated binding will still remain in the CMT driver for some time.
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
