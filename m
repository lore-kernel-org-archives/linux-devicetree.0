From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 1/7] dt-bindings: timer: renesas, cmt: Add CMT0234 to
 sh73a0 and r8a7740
Date: Wed, 24 Jul 2019 13:12:36 +0200
Message-ID: <20190724111236.gkhs22rizwalpc63@verge.net.au>
References: <156345023791.5307.6113391102648394591.sendpatchset@octo>
 <156345025207.5307.17135263586186534810.sendpatchset@octo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <156345025207.5307.17135263586186534810.sendpatchset@octo>
Sender: linux-kernel-owner@vger.kernel.org
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, geert+renesas@glider.be, daniel.lezcano@linaro.org, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, tglx@linutronix.de
List-Id: devicetree@vger.kernel.org

On Thu, Jul 18, 2019 at 08:44:12PM +0900, Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> Document the on-chip CMT devices included in r8a7740 and sh73a0.
> 
> Included in this patch is DT binding documentation for 32-bit CMTs
> CMT0, CMT2, CMT3 and CMT4. They all contain a single channel and are
> quite similar however some minor differences still exist:
>  - "Counter input clock" (clock input and on-device divider)
>     One example is that RCLK 1/1 is supported by CMT2, CMT3 and CMT4.
>  - "Wakeup request" (supported by CMT0 and CMT2)
> 
> Because of this one unique compat string per CMT device is selected.
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
