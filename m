From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 3/4] perf: xgene: Add APM X-Gene SoC Performance
 Monitoring Unit driver
Date: Tue, 5 Apr 2016 20:21:00 +0100
Message-ID: <20160405192100.GA5946@svinekod>
References: <1459467472-31561-1-git-send-email-ttnguyen@apm.com>
 <1459467472-31561-4-git-send-email-ttnguyen@apm.com>
 <20160401121820.GB29876@leverpostej>
 <CACgAJHwZ0MwjBDa65P7tYAkF4-m+TCj-65OGpYYQD2tO6hkFqQ@mail.gmail.com>
 <20160404233338.GA1917@svinekod>
 <CACgAJHx6Y8yt57m3YB51dOQjuxNHFvEnJe255mDhnVZOjmJu_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACgAJHx6Y8yt57m3YB51dOQjuxNHFvEnJe255mDhnVZOjmJu_A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tai Tri Nguyen <ttnguyen-qTEPVZfXA3Y@public.gmane.org>
Cc: will.deacon-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, patches <patches-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 05, 2016 at 11:50:10AM -0700, Tai Tri Nguyen wrote:
> On Mon, Apr 4, 2016 at 4:33 PM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
> > On Mon, Apr 04, 2016 at 04:42:11PM -0700, Tai Tri Nguyen wrote:
> >> On Fri, Apr 1, 2016 at 5:18 AM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
> >> >> +     hwc->config = config;
> >> >> +     if (config1)
> >> >> +             hwc->extra_reg.config = config1;
> >> >> +     else
> >> >> +             /* Enable all Agents */
> >> >> +             hwc->extra_reg.config = 0xFFFFFFFFFFFFFFFFULL;
> >> >
> >> > I'm not sure I follow what's going on here.
> >> >
> >> > It would be good to document precisely what this means.
> >>
> >> These are X-Gene PMU specific for monitoring performance of a specific
> >> data path.
> >> X-Gene PMUs have 2 registers capable of masking the Agents from which
> >> the request come from. If the bit with the bit number corresponding to
> >> the AgentID
> >> is set, the event will be counted only if it is caused by a request
> >> from that agent.
> >> Each PMU has different set of Agents. By default, the event will be counted for
> >> all agent requests.
> >>
> >> I'll have it commented better for next revision of the patch.
> >
> > It might be worth having something under Documentation/ for this, similarly to
> > what we do for CCN in Documentation/arm/CCN.txt.
> >
> > How is the user expected to determine agent IDs? Is there a listing somewhere?
> > Does this change between reivisions? This may be worth documenting.
> >
> 
> Each of the SoC PMU has an agent ID list in our product User Manual
> documentation.
> An user is expected to refer to the list to determine the agent ID.
> The agent ID list
> per each PMU is different. Also we may change or add more agents to the list for
> next generations of APM X-Gene. I think it would be too much to document it in
> the Documentation/ folder.

Given that the IDs are so variable, you can simply defer to user manuals in the
documentation. However, there should definitely be documentation describing the
format of the config and config1 fields.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
