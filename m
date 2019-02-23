From: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH] checkpatch: don't complain about "undocumented" USB VID
Date: Fri, 22 Feb 2019 17:00:40 -0800
Message-ID: <CA+ASDXOy64dLEOXwQZ9Mv9+gD7qecv5njTYAMmV49qonOaswNg@mail.gmail.com>
References: <20190222225545.78031-1-briannorris@chromium.org> <82b7d3bb2799468a715e280366401f732d83cfdf.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <82b7d3bb2799468a715e280366401f732d83cfdf.camel@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Andy Whitcroft <apw@canonical.com>, Linux Kernel <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 22, 2019 at 4:52 PM Joe Perches <joe@perches.com> wrote:
>
> On Fri, 2019-02-22 at 14:55 -0800, Brian Norris wrote:
> > Documentation/devicetree/bindings/usb/usb-device.txt describes the
> > 'usbVID,...' compatible format, where VID is hexadecimal, with leading
> > zeroes suppressed. Allow it here without complaining.
> []
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> []
> > @@ -3012,6 +3012,8 @@ sub process {
> >                               }
> >
> >                               next if $compat !~ /^([a-zA-Z0-9\-]+)\,/;
> > +                             # USB VIDs don't need special vendor prefix documentation.
> > +                             next if $compat =~ /^usb[1-9a-f][0-9a-f]{0,3},/;
>
> Maybe check the PID too?
>
>                                 next if $compat =~ /^usb[1-9a-f][0-9a-f]{0,3},[1-9a-f][0-9a-f]{0,3}\b/;

Ah, good point. I shouldn't be allowing, e.g.,
"usb123,something-that's-not-a-PID".

> Maybe add a test for uses of the leading 0?

I suppose that'd be good too. Would help catch problems with the PID,
at least. (VID problems would fall into the "invalid vendor prefix"
check that's already present.)

Thanks,
Brian
