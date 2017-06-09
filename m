From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] checkpatch.pl: Add SPDX license tag check for dts files
 and headers
Date: Fri, 9 Jun 2017 08:56:50 -0500
Message-ID: <20170609135650.xypd22odmaqfkwfe@rob-hp-laptop>
References: <20170223155644.24213-1-robh@kernel.org>
 <CAK7LNASGzmF_WctWVJRQN_Ko7aOeXbwh6KHujKw1J-LAhvGQ2w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAK7LNASGzmF_WctWVJRQN_Ko7aOeXbwh6KHujKw1J-LAhvGQ2w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Whitcroft <apw-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 07, 2017 at 05:45:03PM +0900, Masahiro Yamada wrote:
> Hi Rob,
> 
> 2017-02-24 0:56 GMT+09:00 Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>:
> > Add a check for using SPDX-License-Identifier tags to define the license of
> > .dts{i} and DT header files rather than using free form license text. This
> > check looks for GPL, BSD, or X11(really incorrectly labeled MIT license)
> > license text which are the commonly used DT licenses.
> >
> > Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > Cc: Andy Whitcroft <apw-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
> > Cc: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
> 
> I have a question.
> 
> Is SPDX encouraged only for DT?
> 
> What should we do with C source files?

Depends on the maintainer and your lawyer I guess. gregkh is 
supportive[1]. I wouldn't recommend changing existing license text 
though.

Rob

[1] https://lkml.org/lkml/2017/2/15/968
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
