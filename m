From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [RFC 1/3] dt-bindings: rtc: Add Realtek RTD1295
Date: Sun, 27 Aug 2017 15:47:29 +0200
Message-ID: <20170827134729.GE13622@lunn.ch>
References: <20170820013632.18375-1-afaerber@suse.de>
 <20170820013632.18375-2-afaerber@suse.de>
 <20170823002911.y35nn7jkt34dvjbc@rob-hp-laptop>
 <629b9ed0-7b2d-7c5c-20b8-17289a76f097@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <629b9ed0-7b2d-7c5c-20b8-17289a76f097-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Roc He <hepeng-qoVzM6YEWSw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ????????? <jiang.liqin-31gW8twSeR21Z/+hSey0Gg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

> Thanks. Did you read the RFC question in the cover letter as well and
> have any comments? Downstream has an rtc-base-year = <2014>; property
> that I had left out in this RFC and due to your ack not included in v2.
> 
> Should we default to 2014 in the driver and add an optional base-year
> property once we encounter a diverging device, or should we make it
> required from the beginning? I did not spot any other rtc binding with
> such a property and would appreciate a clarification.

Hi Andreas

>From the perspective of the hardware, does it care what the base is?

A device using a different base will initially return the wrong
time. But once the correct time has been written back, it will be O.K.

This only becomes an issue if a device is used with different OSs,
which have different bases. Swapping back and forth between OSs then
becomes an issue.

KISS suggests not having a base in DT until it is actually
required. Since it is an additional property, it does not break
backwards compatibility when added.

	  Andrew

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
