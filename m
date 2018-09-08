From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 3/4] of: Convert to using %pOFn instead of
 device_node.name
Date: Fri, 07 Sep 2018 17:30:23 -0700
Message-ID: <0999919005219fa94ccc69ff57659d47911d3abd.camel@perches.com>
References: <20180828155254.10709-1-robh@kernel.org>
         <20180828155254.10709-4-robh@kernel.org> <20180907122928.GA5821@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180907122928.GA5821@ulmo>
Sender: netdev-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 2018-09-07 at 14:29 +0200, Thierry Reding wrote:
> On Tue, Aug 28, 2018 at 10:52:53AM -0500, Rob Herring wrote:
> > In preparation to remove the node name pointer from struct device_node,
> > convert printf users to use the %pOFn format specifier.
> > 
> > Cc: Frank Rowand <frowand.list@gmail.com>
> > Cc: Andrew Lunn <andrew@lunn.ch>
> > Cc: Florian Fainelli <f.fainelli@gmail.com>
> > Cc: devicetree@vger.kernel.org
> > Cc: netdev@vger.kernel.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >  drivers/of/device.c   |  4 ++--
> >  drivers/of/of_mdio.c  | 12 ++++++------
> >  drivers/of/of_numa.c  |  4 ++--
> >  drivers/of/overlay.c  |  4 ++--
> >  drivers/of/platform.c |  8 ++++----
> >  drivers/of/unittest.c | 12 ++++++------
> >  6 files changed, 22 insertions(+), 22 deletions(-)
> > 
> > diff --git a/drivers/of/device.c b/drivers/of/device.c
> > index 5957cd4fa262..daa075d87317 100644
> > --- a/drivers/of/device.c
> > +++ b/drivers/of/device.c
> > @@ -219,7 +219,7 @@ static ssize_t of_device_get_modalias(struct device *dev, char *str, ssize_t len
> >  		return -ENODEV;
> >  
> >  	/* Name & Type */
> > -	csize = snprintf(str, len, "of:N%sT%s", dev->of_node->name,
> > +	csize = snprintf(str, len, "of:N%pOFnT%s", dev->of_node,
> >  			 dev->of_node->type);
> >  	tsize = csize;
> >  	len -= csize;
> 
> This seems to cause the modalias to be improperly constructed. As a
> consequence, automatic module loading at boot time is now broken. I
> think the reason why this fails is because vsnprintf() will skip all
> alpha-numeric characters after a call to pointer(). Presumably this
> is meant to be a generic way of skipping whatever specifiers we throw
> at it.
> 
> Unfortunately for the case of OF modaliases, this means that the 'T'
> character gets eaten, so we end up with something like this:
> 
> 	# udevadm info /sys/bus/platform/devices/54200000.dc
> 	[...]
> 	E: MODALIAS=of:Ndc<NULL>Cnvidia,tegra124-dc
> 	[...]
> 
> instead of this:
> 
> 	# udevadm info /sys/bus/platform/devices/54200000.dc
> 	[...]
> 	E: MODALIAS=of:NdcT<NULL>Cnvidia,tegra124-dc
> 	[...]
> 
> Everything is back to normal if I revert this patch. However, since
> that's obviously not what we want, I think perhaps what we need is a
> way for pointer() (and its implementations) to report back how many
> characters in the format string it consumed so that we can support
> these kinds of back-to-back strings.
> 
> If nobody else has the time I can look into coding up a fix, but in the
> meantime it might be best to back this one out until we can handle the
> OF modalias format string.

Or just use 2 consecutive snprintf calls

	csize = snprintf(str, len, "of:N%pOFn", dev->of_node);
	csize += snprintf(str + csize, len - csize, "T%s",
			  dev->of_node->type);
