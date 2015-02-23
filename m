From: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] Input: bcm-keypad: add device tree bindings
Date: Mon, 23 Feb 2015 09:49:13 -0800
Message-ID: <20150223174913.GB604@dtor-glaptop>
References: <sbranden@broadcom.com>
 <1423526861-29579-1-git-send-email-sbranden@broadcom.com>
 <1423526861-29579-2-git-send-email-sbranden@broadcom.com>
 <20150210005134.GA13695@dtor-ws>
 <54DF7C8B.3050103@broadcom.com>
 <20150216051751.GA15948@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150216051751.GA15948@dtor-ws>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Dmitry Torokhov <dtor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Anatol Pomazao <anatol-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Scott,

On Sun, Feb 15, 2015 at 09:17:51PM -0800, Dmitry Torokhov wrote:
> On Sat, Feb 14, 2015 at 08:49:15AM -0800, Scott Branden wrote:
> > On 15-02-09 04:51 PM, Dmitry Torokhov wrote:
> > >On Mon, Feb 09, 2015 at 04:07:40PM -0800, Scott Branden wrote:
> > >>+
> > >>+- col-debounce-filter-period: The debounce period for the Column filter.
> > >>+
> > >>+	KEYPAD_DEBOUNCE_1_ms	=	0
> > >>+	KEYPAD_DEBOUNCE_2_ms	=	1
> > >>+	KEYPAD_DEBOUNCE_4_ms	=	2
> > >>+	KEYPAD_DEBOUNCE_8_ms	=	3
> > >
> > >>+	KEYPAD_DEBOUNCE_16_ms	=	4
> > >>+	KEYPAD_DEBOUNCE_32_ms	=	5
> > >>+	KEYPAD_DEBOUNCE_64_ms	=	6
> > >>+	KEYPAD_DEBOUNCE_128_ms	=	7
> > >>+
> > >>+- status-debounce-filter-period: The debounce period for the Status filter.
> > >>+
> > >>+	KEYPAD_DEBOUNCE_1_ms	=	0
> > >>+	KEYPAD_DEBOUNCE_2_ms	=	1
> > >>+	KEYPAD_DEBOUNCE_4_ms	=	2
> > >>+	KEYPAD_DEBOUNCE_8_ms	=	3
> > >>+	KEYPAD_DEBOUNCE_16_ms	=	4
> > >>+	KEYPAD_DEBOUNCE_32_ms	=	5
> > >>+	KEYPAD_DEBOUNCE_64_ms	=	6
> > >>+	KEYPAD_DEBOUNCE_128_ms	=	7
> > >
> > >I could swear device-specific properties should be in form of
> > ><vendor-prefix>,<property-name> to ensure it won't clash with changes on
> > >subsystem level later on. Device-tree folks, what say you?
> > I see examples with and without vendor-prefix.
> > qcom,pm8xxx-keypad.txt does not have prefixes
> > st-keyscan.txt does have a prefix
> > 
> > I can't find any documented guidelines for this.
> 
> As I mentioned I'll try to get clarification on this.

I have chatted with a couple of people on this and it is acceptable to
omit vendor prefix in bindings when we are using a specific driver like
we have here (i.e. when driver's compatible string already includes
vendor prefix). Vendor prefixes on properties are required when we
augment a generic driver's binding.

So the above 2 entries are fine as is.

Thanks.

-- 
Dmitry
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
