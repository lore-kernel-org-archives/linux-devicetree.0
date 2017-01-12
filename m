From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 3/4] drivers/misc: Add ASpeed LPC control driver
Date: Thu, 12 Jan 2017 09:36:16 -0600
Message-ID: <1484235376.2492.42.camel@kernel.crashing.org>
References: <20170112002910.3650-1-cyrilbur@gmail.com>
         <20170112002910.3650-4-cyrilbur@gmail.com>
         <20170112074312.GA23943@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170112074312.GA23943-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Cyril Bur <cyrilbur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org, xow-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2017-01-12 at 08:43 +0100, Greg KH wrote:
> On Thu, Jan 12, 2017 at 11:29:09AM +1100, Cyril Bur wrote:
> > This driver exposes a reserved chunk of BMC ram to userspace as
> > well as
> > an ioctl interface to control the BMC<->HOST mapping of the LPC
> > bus.
> > This allows for a communication channel between the BMC and the
> > host
> 
> Why not make this a UIO driver?  Why does it have to be a character
> device?

See my other email (looks like I'm getting things in reverse order
today ;-), basically it should just be some ioctl's, but what they do
should really be done by the kernel as it controls external access to
part of the chip physical address space.

Cheers,
Ben.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
