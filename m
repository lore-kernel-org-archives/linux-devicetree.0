From: Gyungoh Yoo <gyungoh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2.2 2/2] dt-bindings: Adding compatible attribute for
 SKY81452 regulator
Date: Thu, 11 Sep 2014 14:22:30 +0900
Message-ID: <20140911052230.GA3764@jack-ThinkPad-T520>
References: <20140813190423.GI17528@sirena.org.uk>
 <1409539218-5571-1-git-send-email-jack.yoo@skyworksinc.com>
 <1409539218-5571-3-git-send-email-jack.yoo@skyworksinc.com>
 <20140901103158.GO29327@sirena.org.uk>
 <20140905015507.GA2636@jack-ThinkPad-T520>
 <20140906143828.GJ2601@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140906143828.GJ2601-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Gyungoh Yoo <jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Sep 06, 2014 at 03:38:28PM +0100, Mark Brown wrote:
> On Fri, Sep 05, 2014 at 10:55:07AM +0900, Gyungoh Yoo wrote:
> > On Mon, Sep 01, 2014 at 11:31:58AM +0100, Mark Brown wrote:
> 
> > > Why is this a good idea - can this driver be used for anything other
> > > than a sky81452?
> 
> > Yes. There is a possibility that this driver will be used by similar
> > device with SKY81452.
> 
> OK, so tha was slightly the wrong question.  What added information is
> forcing the user to create a subnode and specify a compatible string
> providing?  This driver is specifying a block of multiple regulators
> with absolute register addresses hard coded into it, there's no real
> ability to use the driver in a different configuration here.  As soon as
> we see the parent device we already know everything there is to know
> about the IP block, having a separate compatible string just forces the
> user to do more typing for no gain.

Thank you for your comments.

By the way,
I knew that compatible string is used for binding a driver.
http://devicetree.org/Device_Tree_Usage#Understanding_the_compatible_Property

And, from kernel 3.6, MFD core has a mechanism for binding of_node
to the driver with of_compatible.

Can I have a question about if it is possible to assign compatible string
for binding driver independently with reusability?

Thanks,
Gyungoh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
