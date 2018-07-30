Return-Path: <robherring2@gmail.com>
Date: Mon, 30 Jul 2018 17:19:20 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 3/3] serial: sh-sci: Document r7s9210 bindings
Message-ID: <20180730231920.GA13385@rob-hp-laptop>
References: <20180725143850.32985-1-chris.brandt@renesas.com>
 <20180725143850.32985-4-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180725143850.32985-4-chris.brandt@renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-serial@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

On Wed, Jul 25, 2018 at 09:38:50AM -0500, Chris Brandt wrote:
> Add R7S9210 (RZ/A2) support.
> Also describe interrupts property in more detail.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
> v2:
>  * Add more details to interrupts property
>  * Geert gave a Reviewed-by for V1, but then later said that was a
>    mistake because it was missing the interrupts description, so
>    I didn't include his Reviewed-by yet.
> ---
>  .../devicetree/bindings/serial/renesas,sci-serial.txt   | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>
