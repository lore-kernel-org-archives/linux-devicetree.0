From: Javi Merino <javi.merino-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] v4l: async: make v4l2 coexist with devicetree nodes
 in a dt overlay
Date: Tue, 6 Dec 2016 09:08:51 +0000
Message-ID: <20161206090851.GA1704@ct-lt-587>
References: <1480932596-4108-1-git-send-email-javi.merino@kernel.org>
 <0b71cde6-143c-0fa3-30c3-22caf94e14ec@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <0b71cde6-143c-0fa3-30c3-22caf94e14ec-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Cc: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 05, 2016 at 10:13:38AM -0300, Javier Martinez Canillas wrote:
> Hello Javi,
> 
> On 12/05/2016 07:09 AM, Javi Merino wrote:
> > In asds configured with V4L2_ASYNC_MATCH_OF, the v4l2 subdev can be
> > part of a devicetree overlay, for example:
> > 
> > &media_bridge {
> > 	...
> > 	my_port: port@0 {
> > 		#address-cells = <1>;
> > 		#size-cells = <0>;
> > 		reg = <0>;
> > 		ep: endpoint@0 {
> > 			remote-endpoint = <&camera0>;
> > 		};
> > 	};
> > };
> > 
> > / {
> > 	fragment@0 {
> > 		target = <&i2c0>;
> > 		__overlay__ {
> > 			my_cam {
> > 				compatible = "foo,bar";
> > 				port {
> > 					camera0: endpoint {
> > 						remote-endpoint = <&my_port>;
> > 						...
> > 					};
> > 				};
> > 			};
> > 		};
> > 	};
> > };
> > 
> > Each time the overlay is applied, its of_node pointer will be
> > different.  We are not interested in matching the pointer, what we
> > want to match is that the path is the one we are expecting.  Change to
> > use of_node_cmp() so that we continue matching after the overlay has
> > been removed and reapplied.
> > 
> > Cc: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > Cc: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
> > Cc: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> > Signed-off-by: Javi Merino <javi.merino-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > ---
> 
> I already reviewed v1 but you didn't carry the tag. So again:

I forgot to add it :(

> Reviewed-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>

Thanks!
Javi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
