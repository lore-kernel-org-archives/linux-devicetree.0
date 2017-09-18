From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] hwmon: add dt binding for max1619
Date: Mon, 18 Sep 2017 16:11:24 -0500
Message-ID: <20170918211124.jvvl75mznwf3n6sk@rob-hp-laptop>
References: <20170911191649.3344-1-atull@kernel.org>
 <20170911191649.3344-2-atull@kernel.org>
 <20170911195857.GB2580@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170911195857.GB2580-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 11, 2017 at 12:58:57PM -0700, Guenter Roeck wrote:
> On Mon, Sep 11, 2017 at 02:16:49PM -0500, Alan Tull wrote:
> > Add new device tree binding for max1619.
> > 
> > Signed-off-by: Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> 
> Technically that should already work, without explicit binding,
> or did the i2c core change lately ?

There was some work in that direction IIRC.

We don't really want to rely on that behavior and should have DT match 
strings.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
