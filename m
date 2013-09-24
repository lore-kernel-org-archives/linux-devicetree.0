From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/3] of: Add Chunghwa Picture Tubes Ltd. vendor prefix
Date: Tue, 24 Sep 2013 13:02:38 -0600
Message-ID: <5241E1CE.6010209@wwwdotorg.org>
References: <1380012714-19073-1-git-send-email-treding@nvidia.com> <1380012714-19073-2-git-send-email-treding@nvidia.com> <5241CC20.1010800@wwwdotorg.org> <20130924184754.GC9911@mithrandir>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130924184754.GC9911@mithrandir>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/24/2013 12:47 PM, Thierry Reding wrote:
> On Tue, Sep 24, 2013 at 11:30:08AM -0600, Stephen Warren wrote:
>> On 09/24/2013 02:51 AM, Thierry Reding wrote:
>>> Chunghwa Picture Tubes Ltd. isn't listed on the stock exchange
>>> and just Chunghwa is too generic, so use the official
>>> abbreviation "CPTT" as the vendor prefix.
>> 
>> cptt is not very mnemonic. If plain "chungwa" is too generic
>> (could you expand upon that?), would "chungwapt" be better?
> 
> Well, there are Chunghwa Post and Chunghwa Telecom. I guess none
> of these make devices that would ever need to be represented in a
> device tree, but you never know.
> 
> I'm having some trouble understanding the criteria on how to choose
> a good vendor prefix.

I don't think there are any hard/fast rules, which may be the problem!

> As I mentioned in another subthread I remember some discussion that
> concluded that the stock symbol should be used if one existed.
> That's not the case for Chunghwa so I looked for some sort of 
> specific abbreviation. cptt is what Chunghwa Picture Tubes uses
> for their website (http://www.cptt.com.tw) and seemed like a good
> fit.

I guess if I search Google for "cptt", the right website is the second
hit, so perhaps it's not so bad.

> If something mnemonic is preferred, perhaps we should just go with
> plain "chunghwa". If it turns out that the newspaper or telecom
> company ever do ship a product that needs a device tree
> representation we can always come up with a variant then.

That'd probably be fine too. A telecom company at least seems like it
could easily start making HW, but like you say, we can deal with that
then!
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
