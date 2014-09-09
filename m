From: Matti Vaittinen <matti.vaittinen-OYasijW0DpE@public.gmane.org>
Subject: Re: [PATCH v4 2/2] rtc: ds1307: add trickle charger device tree
 binding.
Date: Tue, 9 Sep 2014 13:47:46 +0300
Message-ID: <20140909104746.GE21342@fi-ourus-dhcp00977.emea.nsn-net.net>
References: <20140909103832.GA338@fi-ourus-dhcp00977.emea.nsn-net.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140909103832.GA338-3P0KQDf13zYjNwtGTSXw41mm0B4v8B71Fo5piaCiEZ7R7s880joybQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, "jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org" <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, "linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org" <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, "jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org" <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org, san-KGKi0rHxN0fKWSuBa/xFvVpr/1R2p/CL@public.gmane.org, hs-ynQEQJNshbs@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Sverdlin Alexander <alexander.sverdlin-OYasijW0DpE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 09, 2014 at 01:38:39PM +0300, Matti Vaittinen wrote:
> rtc: ds1307: add trickle charger device tree binding.
> 
> Some DS13XX devices have "trickle chargers". Introduce a device tree
> binding for specifying the trickle charger configuration for ds1339.
> 
> Only ds1339 dt binding is supported because this is the only chip I have.
> I _assume_ the code would have worked on other allready supported chips.
> However I cannot check the resistor values for the other chips or test them.
> For other chips the driver code works as earlier Eg. it does not check the
> dt bindings at all.
> 

I forgot to mention changes compared to patch v3:
    -Splitted patch to two. Documentation and driver changes both in own
    patches.
    -Switched the diode-connected to be the default when charging is
    used.
    -Fixed the property name to match the one in the documentation.

    Br.
    Matti Vaittinen

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
