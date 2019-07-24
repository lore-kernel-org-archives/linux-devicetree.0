From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 7/7] clocksource/drivers/sh_cmt: Document "cmt-48" as
 deprecated
Date: Wed, 24 Jul 2019 13:13:27 +0200
Message-ID: <20190724111327.gwurememjdhsbgtf@verge.net.au>
References: <156345023791.5307.6113391102648394591.sendpatchset@octo>
 <156345033835.5307.9206628986166423962.sendpatchset@octo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <156345033835.5307.9206628986166423962.sendpatchset@octo>
Sender: linux-kernel-owner@vger.kernel.org
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, geert+renesas@glider.be, daniel.lezcano@linaro.org, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, tglx@linutronix.de
List-Id: devicetree@vger.kernel.org

On Thu, Jul 18, 2019 at 08:45:38PM +0900, Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> Update the CMT driver to mark "renesas,cmt-48" as deprecated.
> 
> Instead of documenting a theoretical hardware device based on current software
> support level, define DT bindings top-down based on available data sheet
> information and make use of part numbers in the DT compat string.
> 
> In case of the only in-tree users r8a7740 and sh73a0 the compat strings
> "renesas,r8a7740-cmt1" and "renesas,sh73a0-cmt1" may be used instead.
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
