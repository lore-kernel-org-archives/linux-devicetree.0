Return-Path: <SRS0=5oXa=TN=verge.net.au=horms@kernel.org>
Date: Mon, 13 May 2019 14:25:59 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 01/15] ARM: dts: r7s9210: Add USB clock
Message-ID: <20190513122558.kqbg2kc3exytjkgm@verge.net.au>
References: <20190509201142.10543-1-chris.brandt@renesas.com>
 <20190509201142.10543-2-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190509201142.10543-2-chris.brandt@renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Thu, May 09, 2019 at 03:11:28PM -0500, Chris Brandt wrote:
> Add USB clock node. If present, this clock input must be 48MHz.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Thanks,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
