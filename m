From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 12/13] dt-bindings: auxdisplay: Add bindings for Hitachi
 HD44780
Date: Wed, 8 Feb 2017 19:11:30 -0600
Message-ID: <20170209011130.t63w45ud55332uhy@rob-hp-laptop>
References: <1486391895-9554-1-git-send-email-geert@linux-m68k.org>
 <1486391895-9554-13-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1486391895-9554-13-git-send-email-geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Miguel Ojeda Sandonis <miguel.ojeda.sandonis-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Willy Tarreau <willy-W4YR9g1X7EZBDgjK7y7TUQ@public.gmane.org>, Ksenija Stanojevic <ksenija.stanojevic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 06, 2017 at 03:38:14PM +0100, Geert Uytterhoeven wrote:
> Add DT bindings for an Hitachi HD44780 Character LCD Controller where
> its M6800 bus interface is connected to GPIOs.

Really, you should have a bit-bang M6800 bus driver and binding and then 
the binding for the LCD ctrl looks the same whether you are bit-banging 
it or not.

That's a bit more work though. Maybe you could split the binding like 
this, but keep a monolithic driver for now. The driver can just fetch 
the GPIOs from the parent (bus controller) node. And you'd have to work 
out probing the driver.

> Memory-mapped configurations are not yet supported.

I guess this would require faulting on some address and then bit-banging 
the access. That sounds fun...

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
