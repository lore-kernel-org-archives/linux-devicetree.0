From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 1/3] dt-bindings: Add vendor prefix for ProBox2
Date: Sat, 2 Sep 2017 12:08:31 +0200
Message-ID: <7c7224a9-b0a6-caa4-483a-d9613af48d13@suse.de>
References: <20170827125425.3400-1-afaerber@suse.de>
 <20170827125425.3400-2-afaerber@suse.de>
 <20170831211427.7pmjdd5n4baes3d4@rob-hp-laptop>
 <CAD4Jqzs=SHBGOrACbGiURxsz8OEcp9NpUZV-vkkLqXtBV97XoQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD4Jqzs=SHBGOrACbGiURxsz8OEcp9NpUZV-vkkLqXtBV97XoQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: PROBOX2-CS <support-UNCqqGnNuERBDgjK7y7TUQ@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Probox2 <sales-UNCqqGnNuERBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Wilson,

Please note that HTML-format mails are not permitted on most Linux
mailing lists, so your below message did not arrive for the other reviewers.

Am 01.09.2017 um 04:11 schrieb PROBOX2-CS:
> Hi Rob,
> 
> For the company of the brand is W2COMP COMPANY LIMITED or you can write
> PROBOX2.

My updated proposal is:

probox2         PROBOX2 (by W2COMP Co., Ltd.)

Rationale: Repeating the same name with just different casing on the
right does not provide additional information to a reader wondering whom
this prefix belongs to and whether to use it for new compatible strings.

If that proposal is okay with you, we still need to figure out how to
describe your company in the commit message below.

> thanks,
> Wilson
> PROBOX2
> 
> On Fri, Sep 1, 2017 at 5:14 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
> <mailto:robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>> wrote:
> 
>     On Sun, Aug 27, 2017 at 02:54:23PM +0200, Andreas Färber wrote:
>     > PROBOX2 is a Hong Kong based manufacturer of TV boxes.

W2COMP describes itself as an "online reseller", and PROBOX2 does not
have any About Us page to derive a fair description from - "reseller"
appears to contradict my above description as "manufacturer".
Therefore my (unanswered) off-list inquiry from Aug 28, when you first
mentioned W2COMP to me.

So what about: "PROBOX2 is a TV box brand by Hong Kong based online
reseller W2COMP Company Limited."?

CC'ing William.

Thanks,
Andreas


>     >
>     > Cc: support-UNCqqGnNuERBDgjK7y7TUQ@public.gmane.org <mailto:support-UNCqqGnNuERBDgjK7y7TUQ@public.gmane.org>
>     > Signed-off-by: Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org
>     <mailto:afaerber-l3A5Bk7waGM@public.gmane.org>>
>     > ---
>     >  I did not find a fully spelled out company name for this brand.
>     >
>     >  http://probox2.com/contact-us/
>     >  https://www.facebook.com/pg/probox2/about/
>     <https://www.facebook.com/pg/probox2/about/>
>     >
>     >  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>     >  1 file changed, 1 insertion(+)
> 
>     Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org <mailto:robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>>

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
