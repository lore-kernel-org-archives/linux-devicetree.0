From: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 3/4] drivers/misc: Add ASpeed LPC control driver
Date: Thu, 12 Jan 2017 17:00:51 +0100
Message-ID: <20170112160051.GB8095@kroah.com>
References: <20170112002910.3650-1-cyrilbur@gmail.com>
 <20170112002910.3650-4-cyrilbur@gmail.com>
 <20170112074750.GB23943@kroah.com>
 <1484216163.11416.8.camel@gmail.com>
 <20170112103038.GA19239@kroah.com>
 <1484234867.2492.39.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1484234867.2492.39.camel-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Cyril Bur <cyrilbur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org, xow-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 12, 2017 at 09:27:47AM -0600, Benjamin Herrenschmidt wrote:
> On Thu, 2017-01-12 at 11:30 +0100, Greg KH wrote:
> > > > And don't call access_ok(), it's racy and no driver should ever do that.
> > > > 
> > > 
> > > Oh, duly noted. I'll be sure to check out how and why. Perhaps it
> > > would be wise that no driver actually do that, I'm quite sure I used
> > > other drivers as examples of best practice.
> > 
> > You did?  Please point me at that code so we can fix them up properly.
> > Cargo-cult coding is not a good thing, but it happens, so if we can at
> > least provide clean code to fixate on, it's good overall for everyone.
> 
> How so ? I mean, access_ok followed by __get/__put_user is still a
> classic, what's wrong with it ?

No "normal" driver should do that, just call copy_to/from_user and be
done with it.  That way all of the proper locking and validation checks
like this are done correctly for you.  Why would a driver ever call the
"raw" __get/__put_user functions?

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
