From: Philippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org>
Subject: Re: [PATCH 2/2] regulator: sc2731: Add regulator driver to support
 Spreadtrum SC2731 PMIC
Date: Fri, 1 Dec 2017 14:39:42 +0100
Message-ID: <CAOFm3uHsT8PTZL0tQ0E+7Bje9C8ZUcPd13qz9v6jZHzqEoXqKQ@mail.gmail.com>
References: <f6d8ff765f4864e5b6ace1f022202d8793a7becf.1512118703.git.erick.chen@spreadtrum.com>
 <75a6a48f603a25d744ef46287e036975b0203608.1512118703.git.erick.chen@spreadtrum.com>
 <CAOFm3uFWhOMy=0nibOjDP_vP+m7Dcf1cGOmXXgcrSy6PDfqEWQ@mail.gmail.com> <20171201124935.qgqclyoatnnph63p@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171201124935.qgqclyoatnnph63p-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Erick Chen <erick.chen-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Mark,

On Fri, Dec 1, 2017 at 1:49 PM, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Fri, Dec 01, 2017 at 10:13:27AM +0100, Philippe Ombredanne wrote:
>> On Fri, Dec 1, 2017 at 9:58 AM, Erick Chen <erick.chen-lxIno14LUO0EEoCn2XhGlw@public.gmane.org> wrote:
>
>> I think that per Linus, and Thomas doc patches for SPDX ids this
>> should be instead either:
>
>> > +// SPDX-License-Identifier: GPL-2.0
>> > + // Copyright (c) 2017 Spreadtrum Communications Inc.
>
>> or at least this with the id on the first and the // comment style
>
>> > +// SPDX-License-Identifier: GPL-2.0
>
> Are you saying SPDX requires C++ style comments?  That seems totally
> broken.

In can understand your point, but for reference please check Linus
[1][2][3], Thomas[4] and Greg[5] comments on the topic.

I am just a lowly messenger and even though I personally agree with
Linus points and taste in this area, my weightless voice does not
matter.

CC: Linus, Greg and Thomas

[1] https://lkml.org/lkml/2017/11/2/715
[2] https://lkml.org/lkml/2017/11/25/125
[3] https://lkml.org/lkml/2017/11/25/133
[4] https://lkml.org/lkml/2017/11/2/805
[5] https://lkml.org/lkml/2017/10/19/165
-- 
Cordially
Philippe Ombredanne
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
