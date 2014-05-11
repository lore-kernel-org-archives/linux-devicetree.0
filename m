From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] ARM: shmobile: henninger: add SDHI0/2 DT support
Date: Sun, 11 May 2014 09:20:34 +0900
Message-ID: <20140511002034.GQ31760@verge.net.au>
References: <201405032104.35276.sergei.shtylyov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201405032104.35276.sergei.shtylyov@cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-sh@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sat, May 03, 2014 at 09:04:34PM +0400, Sergei Shtylyov wrote:
> Define the Henninger board dependent part of the SDHI0/2 device nodes along with
> the necessary voltage regulators (note that the Vcc regulators are dummy -- they
> are required but don't actually exist on the board). Also, GPIOs have to be used
> for the CD and WP signals due to the SDHI driver constraints...
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> This patch is against 'renesas-devel-v3.15-rc3-20140502' tag of Simon Horman's
> 'renesas.git' repo.
> 
>  arch/arm/boot/dts/r8a7791-henninger.dts |   76 ++++++++++++++++++++++++++++++++
>  1 file changed, 76 insertions(+)

Thanks, I have queued this up.
