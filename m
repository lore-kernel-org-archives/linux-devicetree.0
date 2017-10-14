From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-bindings: iio: health: Fix max30100 I2C chip
 address in example
Date: Sat, 14 Oct 2017 19:23:16 +0100
Message-ID: <20171014192316.34460c76@archlinux>
References: <1507712948-29300-1-git-send-email-pmeerw@pmeerw.net>
        <20171013215438.fqb3qvevxmwb6i2z@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171013215438.fqb3qvevxmwb6i2z@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 13 Oct 2017 16:54:38 -0500
Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:

> On Wed, Oct 11, 2017 at 11:09:07AM +0200, Peter Meerwald-Stadler wrote:
> > Should be in hex, not decimal or even octal
> > 
> > Signed-off-by: Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/iio/health/max30100.txt | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)  
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Applied to the togreg branch of iio.git and pushed out as testing.

Thanks,

Jonathan

> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
