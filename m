From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC v3 3/3] of: Make of_find_node_by_path() handle /aliases
Date: Sat, 15 Mar 2014 14:44:02 -0500
Message-ID: <CAL_JsqLxexGWALTVb4BEzqpxj_iOnrHA3XtRNxbP1HRSOJeByg@mail.gmail.com>
References: <1394817109-26199-1-git-send-email-grant.likely@linaro.org>
	<CAL_JsqLtYFiLnLgdN_GMG33JD53wFdyfhCwLHek3tLBbQB7maQ@mail.gmail.com>
	<20140315123331.7351DC40A1B@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140315123331.7351DC40A1B-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Mar 15, 2014 at 7:33 AM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Fri, 14 Mar 2014 16:39:38 -0500, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Fri, Mar 14, 2014 at 12:11 PM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> > Make of_find_node_by_path() handle aliases as prefixes. To make this
>> > work the name search is refactored to search by path component instead
>> > of by full string. This should be a more efficient search, and it makes
>> > it possible to start a search at a subnode of a tree.
>> >
>> > Signed-off-by: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
>> > Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
>> > [grant.likely: Rework to not require allocating at runtime]
>> > Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>
>> I should have read the comments before trying to figure out why you
>> had that "pointless" recursion...
>
> Hi Rob,
>
> Thanks for the review. However, I'm a little slow this morning and I
> don't understand what you mean. Did I miss an early comment?

No, it's me that was being slow. At first glance I was thinking the
recursion was pointless until I saw the alias + path case.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
