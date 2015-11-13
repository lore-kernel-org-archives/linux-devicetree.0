From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] mtd: create a partition type device tree binding
Date: Fri, 13 Nov 2015 14:00:39 -0800
Message-ID: <20151113220039.GA74382@google.com>
References: <1446123152-22666-1-git-send-email-linus.walleij@linaro.org>
 <20151029162908.GA13275@localhost>
 <CACRpkdYS5Jf8UC2K0bNdEQZDjTeZZx44Uu-kkof+9E=4Ny0oDg@mail.gmail.com>
 <20151030175145.GF13239@google.com>
 <CAL_JsqL2F3p7qBPbOiGytVyzF_aNLWbrCT0mAX1WZo6SxE3JoA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqL2F3p7qBPbOiGytVyzF_aNLWbrCT0mAX1WZo6SxE3JoA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 06, 2015 at 08:13:13AM -0600, Rob Herring wrote:
> Since we now have partitions contained in a sub node, how about using
> compatible for that sub node instead.

I see that Linus and I spoke up in agreement on this one.

I took a little look at adding of_match_table support to the core MTD
partitioning code (not sure if that's duplicating anything Linus was
attempting on his own?), and I'm observing that there's potential for
conflict with the new binding [1]. If we're going to start overloading
the 'partitions' node to support other partitioning types via
'compatible' property, then we either need to:

 (1) go back to specifying that full ofpart specifications must have
 *no* compatible property or

 (2) we should define a comptible property for the hard-coded
 partitioning case (e.g., compatible = "partitions")

IOW, I could imagine a new partition parser that needs a DT like this:

	flash@xxx {
		compatible = "vendor,flash-type";
		...
		partitions {
			compatible = "some-new-partition-parser";
			...
			subnode {
				// "some-new-partition-parser" might
				// need to put something here
			};
		};
	};

But currently, the binding would say that 'subnode' must be a partition,
even if it's really something else auxiliary to
"some-new-partition-parser" [2].

If we went with option (1), then we'd just have ofpart.c see that
'partitions' has a compatible property and bail out. That seems kinda
hacky.

If we went with option (2), then ofpart.c could just check only for
'compatible = "partitions"' (or similar), and if not found bail out.

I think option (2) makes more sense. But it would require an update to
the binding and code for 4.4, since [1] was only introduced during this
release cycle.

Brian

[1] fe2585e9c29a ("doc: dt: mtd: support partitions in a special 'partitions' subnode")

[2] Possibilities: something relevant to partition splitting. See some
previous work, which I haven't gotten around to fully addressing yet,
but can hopefully be rolled into this work:

http://patchwork.ozlabs.org/patch/476373/
http://patchwork.ozlabs.org/patch/473364/
http://patchwork.ozlabs.org/patch/475988/
