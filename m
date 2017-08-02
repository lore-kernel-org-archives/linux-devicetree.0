From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v5 0/2] ZII RAVE platform driver
Date: Wed, 2 Aug 2017 16:03:34 -0700
Message-ID: <20170802230334.GA23728@kroah.com>
References: <20170728142704.11156-1-andrew.smirnov@gmail.com>
 <20170728233054.GB30604@kroah.com>
 <CAHQ1cqFxgK-j3AtKD186L+M8SFWS02cv2fVSrJHToMPtr41hAw@mail.gmail.com>
 <CAHQ1cqEjA39DXhpBR0JUpEiC1P_7aaku3P823Wh2En6KARF3aA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHQ1cqEjA39DXhpBR0JUpEiC1P_7aaku3P823Wh2En6KARF3aA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Chris Healy <cphealy@gmail.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Lee Jones <lee.jones@linaro.org>, Lucas Stach <l.stach@pengutronix.de>, Nikita Yushchenko <nikita.yoush@cogentembedded.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 02, 2017 at 01:31:51PM -0700, Andrey Smirnov wrote:
> On Fri, Jul 28, 2017 at 5:07 PM, Andrey Smirnov
> <andrew.smirnov@gmail.com> wrote:
> > On Fri, Jul 28, 2017 at 4:30 PM, Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> >> On Fri, Jul 28, 2017 at 07:27:02AM -0700, Andrey Smirnov wrote:
> >>> Greg,
> >>>
> >>> I am not sure if you are the right person to send these to, if you are
> >>> not, please let me know who would be the appropriate recepient and sorry for the noise.
> >>
> >> Why not the platform driver maintainer(s)?  Doesn't
> >> scripts/get_maintainer.pl give you an idea for who to send them to?
> >
> > Unfortunately I wasn't able to find anyone in MAINTAINERS and running
> > scripts/get_maintainer.pl on the patch returns only:
> >
> > scripts/get_maintainer.pl
> > v5-0001-platform-Add-driver-for-RAVE-Supervisory-Processo.patch
> > Andrey Smirnov <andrew.smirnov@gmail.com>
> > (commit_signer:1/1=100%,authored:1/1=100%,added_lines:2/2=100%,added_lines:1/1=100%,added_lines:26/26=100%,added_lines:1127/1127=100%,added_lines:54/54=100%)
> > Andy Shevchenko <andy.shevchenko@gmail.com> (commit_signer:1/1=100%)
> > linux-kernel@vger.kernel.org (open list)
> >
> > hence me reaching out to you.
> 
> Greg, did you have any chance to consider this? I have a v6 with a fix
> for build break reported by kbuild test robot, and I want to avoid
> spamming the mailing list too much and send it to an appropriate
> person.

$ mdfrm -c ~/mail/todo/
944 messages in /home/gregkh/mail/todo/

Please be patient if you are waiting for a review from me, my queue is
kind of big...

greg k-h
