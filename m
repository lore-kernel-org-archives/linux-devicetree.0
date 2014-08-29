From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2] rtc: ds1307: add trickle charger device tree binding
Date: Fri, 29 Aug 2014 11:49:04 +0100
Message-ID: <20140829104904.GA21473@leverpostej>
References: <20140829112902.GA14650@fi-ourus-dhcp00977.emea.nsn-net.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140829112902.GA14650-3P0KQDf13zYjNwtGTSXw41mm0B4v8B71Fo5piaCiEZ7R7s880joybQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matti Vaittinen <matti.vaittinen-OYasijW0DpE@public.gmane.org>
Cc: "a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org" <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, "jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org" <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, "linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org" <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, "jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org" <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>, "jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org" <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, "san-KGKi0rHxN0fKWSuBa/xFvVpr/1R2p/CL@public.gmane.org" <san-KGKi0rHxN0fKWSuBa/xFvVpr/1R2p/CL@public.gmane.org>, "hs-ynQEQJNshbs@public.gmane.org" <hs-ynQEQJNshbs@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Sverdlin Alexander <alexander.sverdlin-OYasijW0DpE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Mati,

Looks like my last reply [1] raced with this posting.

[...]

> +Optional properties:
> +- trickle : Used Trickle Charger configuration,
> +	corresponding to 4 lowest bits in trickle charger register.
> +	Following values are specified:
> +		0x5 => No diode, 250 ohm
> +		0x9 => Diode, 250 ohm
> +		0x6 => No diode, 2k ohm
> +		0xa => Diode, 2k ohm
> +		0x7 => No diode, 4k ohm
> +		0xb => Diode, 4k ohm

Optional?

For an optional property, please describe when said property should be
present, and what the absence implies.

Usually something like "should be present if $foo is not implemented in
$such_way", so it's obvious what the behaviour should be either way.

I still think this should be two proeprties and that the driver should
handle that as appropriate, as I mentioned in my last reply [1].

Mark.

[1] http://lkml.kernel.org/r/20140829104001.GB19424@leverpostej
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
