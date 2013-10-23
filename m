From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCHv4] video: backlight: gpio-backlight: Add DT support.
Date: Wed, 23 Oct 2013 17:51:13 +0100
Message-ID: <5267FE81.3070201@wwwdotorg.org>
References: <20131019104555.GI18477@ns203013.ovh.net> <1382346813-8449-1-git-send-email-denis@eukrea.com> <20131022045833.GB17512@ns203013.ovh.net> <20131022072307.GA8681@ulmo.nvidia.com> <20131022153445.GD17512@ns203013.ovh.net> <20131022200141.GA8037@mithrandir>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131022200141.GA8037@mithrandir>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Eric B??nard <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lothar Wa??mann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/22/2013 09:01 PM, Thierry Reding wrote:
> On Tue, Oct 22, 2013 at 05:34:45PM +0200, Jean-Christophe
> PLAGNIOL-VILLARD wrote:
...
>> I'm sorry but the blacklight descibe in DT have nothing to do
>> with the common pratice that the current driver have today
> 
> That's not at all what I said. What I said was that the majority
> of backlight drivers currently default to turning the backlight on
> when probed. Therefore I think it would be consistent if this
> driver did the same.
> 
> I also said that I don't think it's a very good default, but at the
> same time we can't just go and change the default behaviour at will
> because people may rely on it.

It may well be reasonable to change the default behaviour for devices
instantiated from DT. If it's not possible to instantiate the device
from DT yet, then it's not possible for anyone to be relying on the
default behaviour yet, since there is none. So, perhaps the default
could be:

* If device instantiated from a board file, default to on, for
backwards-compatibility.

* If device instantiated from DT, there is no backwards compatibility
to be concerned with, since this is a new feature, hence default to
off, since we think that's the correct thing to do.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
