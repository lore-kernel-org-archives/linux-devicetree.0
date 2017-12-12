From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] eeprom: at25: Add DT support for EEPROMs with odd
 address bits
Date: Tue, 12 Dec 2017 14:54:39 -0600
Message-ID: <20171212205439.ijhvzmsumiu3l5pp@rob-hp-laptop>
References: <1512740801-21142-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1512740801-21142-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Ivo Sieben <meltedpianoman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Dec 08, 2017 at 02:46:41PM +0100, Geert Uytterhoeven wrote:
> Certain EEPROMS have a size that is larger than the number of address
> bytes would allow, and store the MSB of the address in bit 3 of the
> instruction byte.
> 
> This can be described in platform data using EE_INSTR_BIT3_IS_ADDR, or
> in DT using the obsolete legacy "at25,addr-mode" property.
> But currently there exists no non-deprecated way to describe this in DT.
> 
> Hence extend the existing "address-width" DT property to allow
> specifying 9 address bits, and enable support for that in the driver.
> 
> This has been tested with a Microchip 25LC040A.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
> ---
> v2:
>   - Do not consider odd address widths of 17 or 25 bits,
>   - Move handling inside the switch() statement.
> ---
>  Documentation/devicetree/bindings/eeprom/at25.txt | 4 +++-
>  drivers/misc/eeprom/at25.c                        | 3 +++
>  2 files changed, 6 insertions(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>                  
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
