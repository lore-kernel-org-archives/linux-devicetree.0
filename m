Return-Path: <robherring2@gmail.com>
Date: Tue, 31 Jul 2018 13:39:38 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/4] serial: sh-sci: Improve interrupts description
Message-ID: <20180731193938.GA28314@rob-hp-laptop>
References: <20180731104139.93291-1-chris.brandt@renesas.com>
 <20180731104139.93291-2-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180731104139.93291-2-chris.brandt@renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-serial@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

On Tue, Jul 31, 2018 at 05:41:36AM -0500, Chris Brandt wrote:
> Describe interrupts property in more detail, especially when there are
> more than one interrupt.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../devicetree/bindings/serial/renesas,sci-serial.txt    | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>
