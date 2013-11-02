From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 0/2] move of_find_next_cache_node to DT core
Date: Sat, 02 Nov 2013 18:06:46 +0000
Message-ID: <20131102180646.1A722C40DDC@trevor.secretlab.ca>
References: <1379501585-12532-1-git-send-email-Sudeep.KarkadaNagesha@arm.com> <20130918145116.D53A5C42CDF@trevor.secretlab.ca> <5239D26E.5090505@arm.com> <524E9BA9.4000506@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <524E9BA9.4000506-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha-5wv7dgnIgG8@public.gmane.org>Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha-5wv7dgnIgG8@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 04 Oct 2013 11:42:49 +0100, Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha-5wv7dgnIgG8@public.gmane.org> wrote:
> Hi Grant,
> 
> On 18/09/13 17:18, Sudeep KarkadaNagesha wrote:
> > On 18/09/13 15:51, Grant Likely wrote:
> >> On Wed, 18 Sep 2013 11:53:03 +0100, Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha-5wv7dgnIgG8@public.gmane.org> wrote:
> >>> From: Sudeep KarkadaNagesha <sudeep.karkadanagesha-5wv7dgnIgG8@public.gmane.org>
> >>>
> >>> Hi,
> >>>
> >>> The cache bindings are generic and used by many other architectures
> >>> apart from PPC. These patches fixes and move the existing definition
> >>> of of_find_next_cache_node to DT common code.
> >>>
> >>> Regards,
> >>> Sudeep
> >>
> >> Acked-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> >>
> >> However, do you have a user for this function on other architectures
> >> yet? I'd like to see a user for the function in the same patch series..
> >>
> > 
> > Yes I have posted an RFC[1] following this series implementing cacheinfo
> > for ARM similar to x86 implementation. I was not sure if it's good idea
> > to combine it as its still initial RFC version.
> > 
> 
> Do you prefer to have this a independent change or to go with the cache topology
> support patches[1] on ARM ?

Ben's already picked it up, so I'm fine with it.

g.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
