From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/4] phy: miphy365x: Add Device Tree bindings for the MiPHY365x
Date: Tue, 24 Jun 2014 16:08:15 +0200
Message-ID: <4274516.nCpbjAuUJp@wuerfel>
References: <1400766819-22286-1-git-send-email-lee.jones@linaro.org> <6599289.0ZjjaMbRqj@wuerfel> <20140624124634.GO13803@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140624124634.GO13803@lee--X1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 24 June 2014 13:46:34 Lee Jones wrote:
> > > > > converting all addresses to to resources so drivers can easily pull
> > > > > them out using platform_get_resource() and friends.  Pushing the reg
> > > > 
> > > > right. Can't we use of_address_to_resource here?
> > > 
> > > We could, but that would be an extra layer.  We'd be pulling the
> > > address, putting it into a resource, then pulling it from the resource
> > > for use.  If we're going to be pulling addresses out manually, we're
> > > probably better off using of_get_address().  But again, we're just
> > > carrying out functionality which is already provided by the
> > > framework.
> > 
> > there is also of_ioremap().
> 
> Isn't this SPARK only?  And doesn't it require a populated resource?  
> Which is what I'm saying is the issue here i.e. we don't have one.

Sorry, I meant of_iomap(). I think it's only for historic reaons
that we have both. Probably of_iomap started out on powerpc with
the same intention as the sparc of_ioremap.

of_iomap does not require a resource, just an index.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
