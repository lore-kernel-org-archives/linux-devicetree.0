From: Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [PATCH 1/2] hwmon: (lm70) Utilize dev_warn instead of pr_warn
Date: Mon, 23 Jan 2017 13:00:35 +0100 (CET)
Message-ID: <alpine.DEB.2.20.1701231300240.3435@hadrien>
References: <20170121192010.30681-1-f.fainelli@gmail.com>  <20170121192010.30681-2-f.fainelli@gmail.com>  <1485153837.12563.23.camel@perches.com> <1485154594.12563.27.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1485154594.12563.27.camel@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



On Sun, 22 Jan 2017, Joe Perches wrote:

> On Sun, 2017-01-22 at 22:43 -0800, Joe Perches wrote:
> > Two questions for Julia Lawall:
> >
> > o is there a better way to do this than repeat the blocks
> >   one for each replacement
> > o can struct device * dev be made an arbitrary identifier
> >
> > $ cat dev_printk.cocci
> > @@
> > identifier fn;
> > type T;
> > @@
> >
> > T fn ( ..., struct device * dev, ... ) {
> > <...
> > -	pr_emerg(
> > +	dev_emerg(dev,
> > 	...);
> > ...>
> > }
>
> Well, the second question is simple if I would just
> think a little before asking...
>
> @@
> identifier fn;
> identifier dev;

Yes :)

julia

> type T;
> @@
>
> T fn ( ..., struct device * dev, ... ) {
> <...
> -	pr_emerg(
> +	dev_emerg(dev,
> 	...);
> ...>
> }
>
> etc...
>
>
