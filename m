From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of: add 'const' for of_property_*_string*() parameter '*np'
Date: Thu, 3 Mar 2016 18:14:37 -0600
Message-ID: <CAL_JsqLzqnyYZvEuBGnCkEOzt5XGy95OAyS_r_coa2QWCFa29Q@mail.gmail.com>
References: <1456954551-31742-1-git-send-email-drivshin.allworx@gmail.com>
 <CAL_JsqJgOa7wzYCrQFwko-HXQVTkWf+=rwGkimS1n6qucH=jbw@mail.gmail.com> <20160303171640.6a156643.drivshin.allworx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160303171640.6a156643.drivshin.allworx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "David Rivshin (Allworx)" <drivshin.allworx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 3, 2016 at 4:16 PM, David Rivshin (Allworx)
<drivshin.allworx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Thu, 3 Mar 2016 07:52:51 -0600
> Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>
>> On Wed, Mar 2, 2016 at 3:35 PM, David Rivshin (Allworx)
>> <drivshin.allworx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> > From: David Rivshin <drivshin-5fOYsn7Fw8lBDgjK7y7TUQ@public.gmane.org>
>> >
>> > The of_property_{read,count,match}_string* family of functions never
>> > modify the struct device_node pointer that is passed in, so there is no
>> > reason for it to be non-const. Equivalent functions for all other types
>> > already take a 'const struct device_node *np'.
>> >
>> > Signed-off-by: David Rivshin <drivshin-5fOYsn7Fw8lBDgjK7y7TUQ@public.gmane.org>
>> > ---
>> >
>> > MAINTAINTERS says that the appropriate tree is
>> >     git://git.kernel.org/pub/scm/linux/kernel/git/glikely/linux.git
>>
>> Yes, we probably need to update that.
>>
>> > but it looks like that hasn't been updated in a while. So this patch
>> > is based off the "for-next" branch of
>> >     git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
>> > instead. Let me know if you need me to respin from another tree/branch.
>>
>> You should base off of Linus' tree unless you have some dependency. I
>
> I was under the impression that the general rule would be to base off
> whichever tree it is likely to go through, to make it easier for the
> maintainer if nothing else. Is that an incorrect impression, or do you
> mean that just for OF/DT changes?

This applies to all of the kernel. You should base your work off of
Linus' tree unless you know you have a dependency. If you do, then the
maintainer needs to know that. It is nice though to test your patches
on a maintainer's tree and check if there are conflicts. If trivial,
then it's okay to let the maintainer fix up the patch. If not trivial,
then you should base on the maintainer's tree. All this matters less
with patches than pull requests.

Different maintainers have different rules for the stability of their
branches also.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
