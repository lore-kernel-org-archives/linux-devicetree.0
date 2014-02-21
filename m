From: Warner Losh <wlosh-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org>
Subject: Re: devicetree repository separation/migration
Date: Fri, 21 Feb 2014 11:28:04 -0700
Message-ID: <F59CF498-8B79-49FB-B9AC-D94C07179144@bsdimp.com>
References: <20140217180544.GU7862@titan.lakedaemon.net> <20140218155750. GS17250@pengutronix.de> <20140218181854.GB7862@titan.lakedaemon.net> < CACxGe6vU3j4-UtUtxBkT=Mf+AeLVxBcWicGqQhcGVZXnEBUkig@mail.gmail.com> < 88923CF8-5E0A-46A4-AAA0-AC277F5C9446@bsdimp.com> <20140220113951.612DDC4050F@trevor.secretlab.ca>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140220113951.612DDC4050F-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, =?utf-8?Q?Pawe=C5=82_Moll?= <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


On Feb 20, 2014, at 4:39 AM, Grant Likely wrote:

> On Wed, 19 Feb 2014 14:43:58 -0700, Warner Losh <wlosh-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org> wrote:
>> 
>> On Feb 19, 2014, at 2:09 PM, Grant Likely wrote:
>> 
>>> On Tue, Feb 18, 2014 at 6:18 PM, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org> wrote:
>>>> On Tue, Feb 18, 2014 at 04:57:50PM +0100, Sascha Hauer wrote:
>>>>> It will be interesting to see which rules should apply for merging new
>>>>> bindings. I know that devicetrees should be OS agnostic, but sometimes
>>>>> they are modelled after how Linux currently works. What happens when the
>>>>> *BSD guys have different ideas how a good binding looks like? How will
>>>>> such conflicts be resolved?
>>>> 
>>>> That's more a question for Grant.  I assume we'll all put on our big-boy
>>>> pants and pick the best technical solution based on their merits. :)
>>> 
>>> I think you've answered it pretty competently.
>> 
>> What, the BSDs don't get a free pass to dump junk into the process. I'm shocked :)
>> 
>> But we have bug-boy pants over in BSD land, so that shouldn't be a problem.
> 
> Bug-boy pants? Sounds sticky.

Yea, gotta those accidental typos...

Warner

--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
