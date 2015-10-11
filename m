From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] ARM: shmobile: henninger: add MSIOF0 DT support
Date: Mon, 12 Oct 2015 08:55:40 +0900
Message-ID: <20151011235540.GB20025@verge.net.au>
References: <201405070048.00213.sergei.shtylyov@cogentembedded.com>
 <56182654.6070205@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56182654.6070205@cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-sh@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 09, 2015 at 11:40:52PM +0300, Sergei Shtylyov wrote:
> On 05/07/2014 12:47 AM, Sergei Shtylyov wrote:
> 
> >Define the Henninger board dependent part of the MSIOF0 device node.
> >Add device node for Renesas R2A11302FT PMIC for which no bindings exist yet.
> 
>    I've just realized that there's no such PMIC on the Henninger/Porter
> boards and MSIOF0 is only connected to CN6, hence this patch was wrong.
> The .dts is going to be deleted anyway though...

Feel free to send an incremental update to the henninger if you
want to clean this up before removing the file entirely.

> >Based on the Koelsch MSIOF device tree patch by Geert Uytterhoeven.
> >
> >Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> MBR, Sergei
> 
