From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: Order in "compatibility" DT property ignored by a platform bus
Date: Wed, 3 Jan 2018 15:29:40 -0600
Message-ID: <20180103212940.gza4vmxrpsgb4cy2@rob-hp-laptop>
References: <CACna6ry3iOrqbFqS6EroVhhP3szNgfCQxpe=yx1eHmY2oD3big@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACna6ry3iOrqbFqS6EroVhhP3szNgfCQxpe=yx1eHmY2oD3big-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 02, 2018 at 10:19:42AM +0100, Rafał Miłecki wrote:
> I was wondering how platform bus handles order of strings in the
> "compatibility" property. After reading the code & testing it I
> realized it doesn't.
> 
> The property should store strings ordered from the most specific to
> the most generic. You could expect a more specific string to have a
> priority while matching.
> 
> In platform_match there isn't any magic code for handling that. It
> simply checks if a driver that was passed can support a given device.
> I also did 2 quick tests with:
> 1) compatible = "foo", "bar";
> 2) compatible = "bar", "foo";

Strictly speaking one of these has to be invalid, but I get your point.

> and it each case a foo platform driver was used. It just happened to
> be before bar platform driver on kernel's internal list (both drivers
> were built-in).
> 
> If you compare this with ARM's setup_machine_fdt you will notice that
> one actually looks for the best matching machine code (it's handled
> with the __of_match_node).
> 
> Am I correct understanding this isn't a proper behavior? 

Yes. The current state is that multiple drivers matching is not 
supported (or undefined behavior).

> Are there any
> plans fixing this?

Not that I'm aware of. I think it should really only be a problem when 
you have a generic driver and then a device specific driver. It seems to 
be a rare enough problem that no one has bothered to fix it for years.

It gets more complicated because what happens in the 2nd case if driver 
foo is built-in and driver bar is loaded later?

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
