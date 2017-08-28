From: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH v5 0/2] ZII RAVE platform driver
Date: Mon, 28 Aug 2017 17:51:40 +0200
Message-ID: <20170828155140.GA29358@kroah.com>
References: <20170728142704.11156-1-andrew.smirnov@gmail.com>
 <20170728233054.GB30604@kroah.com>
 <CAHQ1cqFxgK-j3AtKD186L+M8SFWS02cv2fVSrJHToMPtr41hAw@mail.gmail.com>
 <CAHQ1cqEjA39DXhpBR0JUpEiC1P_7aaku3P823Wh2En6KARF3aA@mail.gmail.com>
 <20170802230334.GA23728@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170802230334.GA23728-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chris Healy <cphealy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Nikita Yushchenko <nikita.yoush-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 02, 2017 at 04:03:34PM -0700, Greg Kroah-Hartman wrote:
> On Wed, Aug 02, 2017 at 01:31:51PM -0700, Andrey Smirnov wrote:
> > On Fri, Jul 28, 2017 at 5:07 PM, Andrey Smirnov
> > <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > > On Fri, Jul 28, 2017 at 4:30 PM, Greg Kroah-Hartman
> > > <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org> wrote:
> > >> On Fri, Jul 28, 2017 at 07:27:02AM -0700, Andrey Smirnov wrote:
> > >>> Greg,
> > >>>
> > >>> I am not sure if you are the right person to send these to, if you are
> > >>> not, please let me know who would be the appropriate recepient and sorry for the noise.
> > >>
> > >> Why not the platform driver maintainer(s)?  Doesn't
> > >> scripts/get_maintainer.pl give you an idea for who to send them to?
> > >
> > > Unfortunately I wasn't able to find anyone in MAINTAINERS and running
> > > scripts/get_maintainer.pl on the patch returns only:
> > >
> > > scripts/get_maintainer.pl
> > > v5-0001-platform-Add-driver-for-RAVE-Supervisory-Processo.patch
> > > Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > > (commit_signer:1/1=100%,authored:1/1=100%,added_lines:2/2=100%,added_lines:1/1=100%,added_lines:26/26=100%,added_lines:1127/1127=100%,added_lines:54/54=100%)
> > > Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> (commit_signer:1/1=100%)
> > > linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org (open list)
> > >
> > > hence me reaching out to you.
> > 
> > Greg, did you have any chance to consider this? I have a v6 with a fix
> > for build break reported by kbuild test robot, and I want to avoid
> > spamming the mailing list too much and send it to an appropriate
> > person.

As I can't do anything with v5, please send v6, never wait for me...

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
