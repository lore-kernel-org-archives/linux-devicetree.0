From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH-RFC 6/7] drivers: of: ifdef out cmdline section
Date: Tue, 13 Oct 2015 16:17:54 -0500
Message-ID: <CAL_JsqK5qymGdMaayK61WKPw1-Ws9K+Lxi5w6rO2CEg08Aq60A@mail.gmail.com>
References: <1444146434-12776-6-git-send-email-danielwa@cisco.com>
 <CAL_JsqLmVRdWZqxFRAZ-pgd225PGW8MNv4A47bcfD+cD_+K7rg@mail.gmail.com>
 <20151007162755.GA23283@fifo99.com> <CAL_JsqJwFeDGJ0cTYwikX7DAvR7SK=CL6Qxyp9oKFWeFMgZNiA@mail.gmail.com>
 <561D6603.4060006@cisco.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <561D6603.4060006-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Walker <danielwa-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Cc: Daniel Walker <dwalker-zu3NM2574RrQT0dZR+AlfA@public.gmane.org>, xe-kernel-qGaTmy9+pjmU+GOnkdjqUdBPR1lH4CV8@public.gmane.org, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 13, 2015 at 3:13 PM, Daniel Walker <danielwa-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org> wrote:
> On 10/07/2015 02:48 PM, Rob Herring wrote:
>>
>> On Wed, Oct 7, 2015 at 11:27 AM,  <dwalker-zu3NM2574RrQT0dZR+AlfA@public.gmane.org> wrote:
>>>
>>> On Tue, Oct 06, 2015 at 12:14:43PM -0500, Rob Herring wrote:
>>>>
>>>> On Tue, Oct 6, 2015 at 10:47 AM, Daniel Walker <danielwa-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
>>>> wrote:
>>>>>
>>>>> It looks like there's some seepage of cmdline stuff into
>>>>> the generic device tree code. This conflicts with the
>>>>> generic cmdline implementation so I remove it in the case
>>>>> when that's enabled.
>>>>
>>>> Nice series in general. I've had passing desire to do this every time
>>>> I run into the command line code.
>>>>
>>>> The DT handling of the command line is generic across architectures.
>>>> The current design is working around that the kernel command line code
>>>> is not that way. I think we can take this a bit further by making the
>>>> generic DT code add the command line string directly rather than
>>>> relying on the arch to do that. Then we can remove all command line
>>>> handling from the arch code. I would also look at whether we can make
>>>> boot_command_line static rather than directly accessed. We might have
>>>> to leave it public for now, but could treat it as static for generic
>>>> cmdline case.
>>>>
>>> Sorry I didn't respond sooner. I was waiting to see if there were more
>>> replies.
>>>
>>> One of my colleague suggested something similar, I was reluctant to
>>> change anything
>>> prior to sending it out so I could get more feedback on the direction.
>>>
>>> So your suggesting this patch be something like,
>>>
>>> #ifdef CONFIG_GENERIC_CMDLINE
>>> // call generic cmdline functions
>>> #else
>>> // keep what's there currently
>>> #endif
>>
>> I think so yes, but I'd hope that the else case is empty. You've
>> converted the hard arches already. I'd guess the rest using DT would
>> be easy to convert as they either don't use DT for command line at all
>> or always use it.
>
>
> So I was thinking about doing a simplification like this,
>    932 int __init early_init_dt_scan_chosen(unsigned long node, const char
> *uname,
>    933                                      int depth, void *data)
>    934 {
>    ...
>    945
>    946         /* Retrieve command line */
>    947         p = of_get_flat_dt_prop(node, "bootargs", &l);
>    948         /*
>    949          * The builtin command line will be added here, or can
> override
>    950          * the DT bootargs.
>    951          */
>    952         cmdline_add_builtin(data, p, COMMAND_LINE_SIZE);
>
> The cmdline code would copy "p" over, or not if it's NULL. Then it would
> either do the builtin command line override, or not. The thing that is
> bothering me is that you have a length check in there "if (p != NULL && l >
> 0)" , is there a situation when "p" is not NULL, but "l" is 0 ?

Yes, you can have properties with no data (e.g. just "bootargs;"). I
don't think that would happen in this case. I generally don't think it
is the kernel's job to validate bindings, but given this comes from
the bootloader we probably should here.


> I could also do this,
> cmdline_add_builtin(data, (l > 0) ? p : NULL, COMMAND_LINE_SIZE);
>
> but the strlcpy you have also only copies over "l" bytes, so there would
> have to be a situation when the string is not NULL terminated or someone
> only wants a section of it ?

I don't think either would ever be true. If so, that should be the
caller's problem to deal with.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
