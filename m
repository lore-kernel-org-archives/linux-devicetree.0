From: Srinivas KANDAGATLA <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH v4] media: st-rc: Add ST remote control driver
Date: Thu, 26 Sep 2013 14:49:37 +0100
Message-ID: <52443B71.7060402@st.com>
References: <1379581176-25078-1-git-send-email-srinivas.kandagatla@st.com> <5240A740.7000407@wwwdotorg.org> <5241488F.5010000@st.com> <5241ECCC.3020808@wwwdotorg.org>
Reply-To: srinivas.kandagatla-qxv4g6HH51o@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5241ECCC.3020808-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On 24/09/13 20:49, Stephen Warren wrote:
>>> >> Should those property names be prefixed with "st,"; I assume they're
>>> >> specific to this binding rather than something generic that applies to
>>> >> all IR controller bindings? If you expect them to be generic, it's fine.
>> > 
>> > Officially these bindings are not specified in ePAPR specs
> Well, there are plenty of properties we now consider generic that aren't
> in ePAPR...
> 
>> > but I see no reason for not having these properties as generic ones.
>> >
>> > Are you ok with that?
> I suppose that infrared-vs-uhf is a concept that's probably common
> enough across any similar HW device, so it may make sense for these
> properties to be generic. If we do intend them to be generic, I'd
> suggest they be defined in some generic binding document though; perhaps
> something like bindings/media/ir.txt or
> bindings/media/remote-control.txt? That way, a HW-specific binding isn't
> the only place where a supposedly generic property is defined.

For now I will send a v5 for this driver with these generic properties.

And, I will send an separate RFC for the generic binding document
(bindings/media/remote-control.txt) so that we can get more inputs from
others as well.

Thanks,
srini

> 
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
