From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 4/4] iio: ad5755: Add full DT binding documentation
Date: Mon, 8 Feb 2016 11:37:27 -0600
Message-ID: <20160208173727.GA823@rob-hp-laptop>
References: <1454509864-32285-1-git-send-email-sean.nyekjaer@prevas.dk>
 <1454509864-32285-2-git-send-email-sean.nyekjaer@prevas.dk>
 <1454509864-32285-3-git-send-email-sean.nyekjaer@prevas.dk>
 <1454509864-32285-4-git-send-email-sean.nyekjaer@prevas.dk>
 <56B63BAC.2040001@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56B63BAC.2040001-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Sean Nyekjaer <sean.nyekjaer-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Daniel Baluta <daniel.baluta-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Feb 06, 2016 at 06:30:04PM +0000, Jonathan Cameron wrote:
> On 03/02/16 14:31, Sean Nyekjaer wrote:
> > Signed-off-by: Sean Nyekjaer <sean.nyekjaer-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
> Hmm. Complex beast.  Going to want Lars to look at this in particular.
> Also a device tree review would be good on this one.
> 
> My personal gut feeling is not to wrap up things that are really numeric
> with names, but rather to provide docs on the valid values for them.
> Not sure what is the preferred by the device tree guys??

Agreed. I'm not such a fan of defines in DT.

Also, if there is some possibility that bindings could be generic, I 
prefer to see them use the native units rather than the enumerated 
register values. The downside is adding the translation into the driver. 
These look like they could possibly be generic DAC properties.

Rob
