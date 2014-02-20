From: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Subject: Re: devicetree repository separation/migration
Date: Thu, 20 Feb 2014 09:49:11 +0000
Message-ID: <1392889751.23342.10.camel@kazak.uk.xensource.com>
References: <20140217180544.GU7862@titan.lakedaemon.net>
	 <20140218155750.GS17250@pengutronix.de>
	 <20140218181854.GB7862@titan.lakedaemon.net> <5303DB5B.2090505@gmail.com>
	 <20140219184626.GP7862@titan.lakedaemon.net> <5305119F.2070405@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5305119F.2070405-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2014-02-19 at 12:18 -0800, Frank Rowand wrote:
> I am predicting increased pain for little gain if the dts files move out
> of the linux kernel repository.

That's only the case if you take a very Linux centric point of view and
as others have pointed out there are numerous other projects which would
like to both consume and contribute to the set of DTS files, forcing all
those people to take part in Linux development in order to do so is a
barrier which has been shown to be too high in many cases, which is
already leading to fragmentation.

If DTB is to be taken seriously as a generic standard for describing
hardware then IMHO it cannot afford to remain so closely tied to a
single consumer.

Ian.

--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
