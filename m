From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [RFC/PATCH 0/3] Add devicetree scanning for randomness
Date: Tue, 18 Feb 2014 12:56:24 -0500
Message-ID: <20140218175624.GY7862@titan.lakedaemon.net>
References: <1392168805-14200-1-git-send-email-lauraa@codeaurora.org>
 <201402121251.06280.arnd@arndb.de>
 <20140217155419.682F7C401D4@trevor.secretlab.ca>
 <1418981.0py7JxXCp8@wuerfel>
 <20140217182312.GV7862@titan.lakedaemon.net>
 <CAMuHMdW7S=o4oHVsNtYo0i_giB5cgWhygo-GgSaA1Kur6m3vng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdW7S=o4oHVsNtYo0i_giB5cgWhygo-GgSaA1Kur6m3vng-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Laura Abbott <lauraa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 17, 2014 at 10:07:50PM +0100, Geert Uytterhoeven wrote:
> On Mon, Feb 17, 2014 at 7:23 PM, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org> wrote:
> >> Could we use a faster hash function that scans the entire device tree and
> >> then just feed the output of that into add_device_randomness? We probably
> >> can't expect that there is a lot of entropy in the DT blob, so the
> >> result wouldn't be all that different in terms of quality of the random
> >> seed.
> >
> > I think it would be easier to identify the few attributes that differ
> > from board to board (mac address, serial number, etc), and differ from
> > boot to boot (random-seed, timestamp) and just extract and feed those
> > in.
> 
> Isn't identifying those (mostly) a manual process?
> Calculating a fast hash is fully automatic.

The list would be pretty short, and once created wouldn't likely change
too often.  But it really depends on the 'fast hash'.  if the two
methods have comparable speed, I'd definitely prefer the hash.  Easier
to maintain.

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
