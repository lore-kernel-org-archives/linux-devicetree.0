From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] of: add vendor prefix for Chipidea
Date: Wed, 8 Oct 2014 08:40:59 -0500
Message-ID: <CAL_JsqKLK+sYiSKxKG_XGQi_OsK+gE6kGr1tVQUFYAFfk6CpaQ@mail.gmail.com>
References: <1410827745-4101-1-git-send-email-peter.chen@freescale.com>
 <CAL_JsqLVUrxEZKQiHa=-+krnoog0rybEgp8O7pZxbR5TyQx5kA@mail.gmail.com> <20140928002439.GA3324@peterchendt>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140928002439.GA3324@peterchendt>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Adding Grant as it is in his tree now...

On Sat, Sep 27, 2014 at 7:24 PM, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> On Fri, Sep 26, 2014 at 11:32:49AM -0500, Rob Herring wrote:
>> On Mon, Sep 15, 2014 at 7:35 PM, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
>> > Adds chipidea to the list of DT vendor prefixes.
>> >
>> > Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>>
>> Applied.
>
> Hi Rob & Greg,
>
> I am sorry I also sent this DT patch to Greg by mistake, and queued by usb tree.
> Will meet error when linus pulls both of your trees?

I think git will sort it out okay, but if patches like this are not
part of a larger series they should go thru the DT tree.

Also, IIRC, if you put people in cc in the commit, we get notified
when Greg applies patches.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
