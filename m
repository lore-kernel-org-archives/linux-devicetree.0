From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] auxdisplay: hd44780: Fix DT properties to include units
 of measurement
Date: Tue, 28 Mar 2017 21:34:04 -0500
Message-ID: <20170329023404.7p7k4t7ow2evm6my@rob-hp-laptop>
References: <1490275537-3769-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1490275537-3769-1-git-send-email-geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Willy Tarreau <willy-W4YR9g1X7EZBDgjK7y7TUQ@public.gmane.org>, Miguel Ojeda Sandonis <miguel.ojeda.sandonis-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ksenija Stanojevic <ksenija.stanojevic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 23, 2017 at 02:25:37PM +0100, Geert Uytterhoeven wrote:
> DT properties specifying physical properties should contain appropriate
> suffices indicating the units of measurement.
> 
> Hence amend the HD44780 DT bindings to add "chars" suffixes to the
> "display-height" and "display-width" properties, and update the driver
> to parse them.
> 
> Fixes: dd9502a9e9156dd8 ("dt-bindings: auxdisplay: Add bindings for Hitachi HD44780")
> Fixes: d47d88361feea2ce ("auxdisplay: Add HD44780 Character LCD support")
> Signed-off-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
> ---
> Against char-misc-next
> 
>  Documentation/devicetree/bindings/auxdisplay/hit,hd44780.txt | 11 ++++++-----
>  drivers/auxdisplay/hd44780.c                                 |  5 +++--
>  2 files changed, 9 insertions(+), 7 deletions(-)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
