From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] DT: ATA: Add missing documentation of clocks to
 marvell binding.
Date: Thu, 5 Dec 2013 12:22:54 +0000
Message-ID: <20131205122254.GN29200@e106331-lin.cambridge.arm.com>
References: <1386244271-16127-1-git-send-email-andrew@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1386244271-16127-1-git-send-email-andrew-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kishon-l0cyMroinI0@public.gmane.org" <kishon-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 05, 2013 at 11:51:11AM +0000, Andrew Lunn wrote:
> The marvell SATA driver can optionally make use of clocks specified in
> the DT node. This has been available in the driver since Febuary 2012,
> but the documentation is missing from the binding. Add it.
> 
> Signed-off-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
> ---
> FYI: This will cause merge conflicts with the SATA PHY driver comming soon.
> ---
>  Documentation/devicetree/bindings/ata/marvell.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/ata/marvell.txt b/Documentation/devicetree/bindings/ata/marvell.txt
> index b5cdd20cde9c..f6c68d157749 100644
> --- a/Documentation/devicetree/bindings/ata/marvell.txt
> +++ b/Documentation/devicetree/bindings/ata/marvell.txt
> @@ -6,11 +6,17 @@ Required Properties:
>  - interrupts    : Interrupt controller is using
>  - nr-ports      : Number of SATA ports in use.
>  
> +Optional Properties:
> +- clocks        : List of pHandles to clocks

s/pHandle/phandle/. Don't forget the clock-specifier too!

> +- clock-names   : Must be "0", "1", mapping port number to clock.

This line leads to the erroneous impression that the clocks can be in
arbitrary order (as is generally true for bindings with clock-names
properties). The driver doesn't request clocks by name, and doesn't even
look at clock-names.

Please document the required order in the description of the clocks
property. If you want to add clock-names, please add support to the
driver or it's somewhat pointless.

I also think the names could be improved, albeit slightly ("port0" is a
little clearer than "0").

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
