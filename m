From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [PATCH V6 4/3] brcmfmac: use wiphy_read_of_freq_limits to
 respect extra limits
Date: Mon, 09 Jan 2017 12:07:41 +0100
Message-ID: <1483960061.17582.27.camel@sipsolutions.net>
References: <20170104175832.25996-1-zajec5@gmail.com>
         <20170104175832.25996-4-zajec5@gmail.com>
         <3fc87224-7f08-e365-7bbb-a4b8b5746e4f@broadcom.com>
         <CACna6rxay9sC+QT2G4AfjWT1ERsNDzFQ620hNhVhr0FRHXJu=w@mail.gmail.com>
         <e2bbce35-af09-adfa-09ea-e9fcf57b4d09@broadcom.com>
         <CACna6rw22benfuw_7BSFw1wedavmMJWTo_hfPLCVa1t0kV+Aqg@mail.gmail.com>
         <36d2dbd1-bcbe-021b-dd7f-068a5b9739ef@broadcom.com>
         <CACna6rxS-JqyW3cXFMJR6Lp-+HdJjZfkwsVRMPGn5Q1z8av75w@mail.gmail.com>
         <1483952320.17582.13.camel@sipsolutions.net>
         <684d1aff-a9ce-ae42-0c11-5840d3a92daf@broadcom.com>
         (sfid-20170109_120214_167212_462C1A4A)
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <684d1aff-a9ce-ae42-0c11-5840d3a92daf-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> (sfid-20170109_120214_167212_462C1A4A)
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arend Van Spriel <arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2017-01-09 at 12:02 +0100, Arend Van Spriel wrote:

> > However, with the OF, I argued (succesfully it seems :P) that the
> > sensible thing to do was to register with the DISABLED flag and
> > thereby
> > "permanently" disable the channels that OF didn't think were
> > usable,
> > but in this case now the driver has to adhere to the cfg80211 logic
> > of
> > preserving orig_flags forever.
> 
> By adhere you mean we should not enable channes for which orig_flags
> indicate DISABLED?

Well, the regulatory code will "OR" in all the orig_flags after
modifications. If you don't use any of the others before registering,
and you don't use any other helpers other than the OF one that we know
sets only DISABLED, then keeping only the DISABLED flag would be OK -
however, it should *also* be OK to always keep *all* of the orig_flags,
just like the normal regulatory code would?

johannes
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
