From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [RFC] Add of_path property for all devices with a node
Date: Wed, 19 Nov 2014 13:25:53 +1100
Message-ID: <1416363953.5704.19.camel@kernel.crashing.org>
References: <1415342031.4925.27.camel@kernel.crashing.org>
	 <1415342117.4925.29.camel@kernel.crashing.org>
	 <1415596626.5769.14.camel@kernel.crashing.org>
	 <CAL_JsqKG=vpeGKj3v-2VW9oGQsnmuYMHRfy6LuXDXE=ROjHT4w@mail.gmail.com>
	 <CACxGe6vg8SxwCHZ8HxzLzimQOAf8Q81wd5eO=x2LavD4dv81Rw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACxGe6vg8SxwCHZ8HxzLzimQOAf8Q81wd5eO=x2LavD4dv81Rw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2014-11-18 at 15:18 +0000, Grant Likely wrote:
> >> So not much reactions here .. a bit more on IRC, where Olof
> suggested
> >> that rather than a file containing a path, we could use a symlink
> since
> >> the devtree is now in sysfs, so we can do relative links.
> >
> > +1 on this. That was part of the motivation to move DT into sysfs.
> >
> > Rob
> 
> I had a patch that did exactly that. I wonder what happened to it...
> 
> But regardless, as Frank said in his reply, this data is already in
> the uevent file for every device.

I sent a patch doing the symlink days ago.... I think it's still
valuable, the patch is triviall and the symlink is a lot easier to deal
with than parsing the uevent file.

Cheers,
Ben.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
