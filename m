From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Patch to improve device tree structure
Date: Wed, 19 Nov 2014 12:03:57 -0800
Message-ID: <546CF7AD.8060707@gmail.com>
References: <1416199976-21147-1-git-send-email-gaurav.minocha.os@gmail.com> <20141118151026.D2D63C40966@trevor.secretlab.ca> <546BF447.6080300@gmail.com> <CACxGe6u1YwQAivktwmiOZx1K1Ch0F1ofx3EriBi1qEAU99X9PQ@mail.gmail.com> <546CEFC4.805@gmail.com>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <546CEFC4.805-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/19/2014 11:30 AM, Frank Rowand wrote:
> On 11/19/2014 5:56 AM, Grant Likely wrote:
>> On Wed, Nov 19, 2014 at 1:37 AM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

< snip >

> I include a patch below to also drop the *next pointer.  Not to actually
> propose submitting the patch, but to suggest that Gaurav's patch should be
> counted as a net of +2 pointers.  I expect that you will accept either a
> list_head of an hlist_head patch, but if you do not then I will submit the

  list_head _or_ and hlist_head

stupid typos...

> below patch to remove *next or a patch to rename *next to match the actual
> usage of the field.
> 
> I still do not have a strong opinion, but I am still feeling that the gain
> probably does not outweigh the cost.
> 
> -Frank

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
