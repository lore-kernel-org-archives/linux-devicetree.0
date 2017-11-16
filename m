From: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/8] dt-bindings: usb: document hub and host-controller
 properties
Date: Thu, 16 Nov 2017 09:45:40 +0100
Message-ID: <20171116084540.GH11226@localhost>
References: <20171109170723.10960-1-johan@kernel.org>
 <20171109170723.10960-5-johan@kernel.org>
 <20171115154655.rw4n5ihhcm7ilrmv@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171115154655.rw4n5ihhcm7ilrmv@rob-hp-laptop>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 15, 2017 at 09:46:55AM -0600, Rob Herring wrote:
> On Thu, Nov 09, 2017 at 06:07:19PM +0100, Johan Hovold wrote:
> > Hub nodes and host-controller nodes with child nodes must specify values
> > for #address-cells (1) and #size-cells (0).
> > 
> > Also make the definition of the related reg property a bit more
> > stringent, and add comments to the example source.
> > 
> > Signed-off-by: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/usb/usb-device.txt | 20 ++++++++++++++++----
> >  1 file changed, 16 insertions(+), 4 deletions(-)
> 
> I'm happy to apply patches 1-4 for 4.15 if you want.

Sure, that would be great. Greg will probably base usb-next on 4.15-rc2,
and otherwise the rest of the binding updates can just go through your
tree instead.

Thanks,
Johan
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
