From: Warner Losh <imp-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org>
Subject: (unknown)
Date: Wed, 18 May 2016 10:26:32 -0600
Message-ID: <CANCZdfow154vh3kHqUNUM6CoBsC9Vu3_+SEjFG1dz=FOkc9vsg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Subject: 
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Greetings,

I was looking at the draft link posted here
https://github.com/devicetree-org/devicetree-specification-released/blob/master/prerelease/devicetree-specification-v0.1-pre1-20160429.pdf
a while ago. I hope this is the right place to ask about it.

It raised a bit of a question. There's nothing in it talking about the
current
practice of using CPP to pre-process the .dts/.dtsi files before passing
them
into dtc to compile them into dtb.

Normally, I see such things outside the scope of standardization. However,
many of the .dts files that are in the wild today use a number of #define
constants to make things more readable (having GPIO_ACTIVE_HIGH
instead of '0' makes the .dts files easier to read). However, there's a
small
issue that I've had. The files that contain those definitions are currently
in the Linux kernel and have a wide variety of licenses (including none
at all).

So before even getting to the notion of licenses and such (which past
expereince suggests may be the worst place to start a discussion), I'm
wondering where that will be defined, and if these #defines will become
part of the standard for each of the bindings that are defined.

I'm also wondering where the larger issue of using cpp to process the dts
files will be discussed, since FreeBSD's BSDL dtc suffers interoperability
due to this issue. Having the formal spec will also be helpful for its care and
feeding since many fine points have had to be decided based on .dts
files in the wild rather than a clear spec.

Thanks again for spear-heading the effort to get a new version out now
that ePAPR has fallen on hard times.

Warner

P.S. I'm mostly a FreeBSD guy, but just spent some time digging into this
issue for another of the BSDs that's considering adopting DTS files.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
