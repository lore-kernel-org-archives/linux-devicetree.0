From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Subject: Re: [RFC 13/18] v4l: of: Read lane-polarity endpoint property
Date: Fri, 13 Mar 2015 00:25:03 +0200
Message-ID: <20150312222503.GN11954@valkosipuli.retiisi.org.uk>
References: <1425764475-27691-1-git-send-email-sakari.ailus@iki.fi>
 <1425764475-27691-14-git-send-email-sakari.ailus@iki.fi>
 <5943571.XgR4Bv1QGx@avalon>
 <20150312222327.GM11954@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150312222327.GM11954-S+BSfZ9RZZmRSg0ZkenSGLdO1Tsj/99ntUK59QYPAWc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 13, 2015 at 12:23:27AM +0200, Sakari Ailus wrote:
...
> > > +
> > > +		for (i = 0; i < ARRAY_SIZE(bus->lane_polarity); i++) {
> > > +			polarity = of_prop_next_u32(prop, polarity, &v);
> > > +			if (!polarity)
> > > +				break;
> > > +			bus->lane_polarity[i] = v;
> > > +		}
> > 
> > Should we check that i == num_data_lines + 1 ?
> 
> Good question. I think I'd just replace this with
> of_property_read_u32_array() instead, how about that? Then there would have
> to be at least as many lane polarities defined as there are lanes (data and
> clock). Defining more wouldn't be an error.

Oh, I missed the variable in the struct is bool. I'll just add the check.

-- 
Sakari Ailus
e-mail: sakari.ailus-X3B1VOXEql0@public.gmane.org	XMPP: sailus-PCDdDYkjdNMDXYZnReoRVg@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
