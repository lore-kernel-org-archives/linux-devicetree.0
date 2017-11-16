From: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Subject: Re: [GIT PULL] DeviceTree updates for 4.15
Date: Wed, 15 Nov 2017 19:00:53 -0800
Message-ID: <CA+55aFyPe=uWLF8gH5_bkPTbGbTP5h1Uq6XTUZA7oiNF8nd_SQ@mail.gmail.com>
References: <CAL_JsqLbJP4T014Mgb4-RTmuTtV7nOiFDBPPzak=d9NHb3-w9Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLbJP4T014Mgb4-RTmuTtV7nOiFDBPPzak=d9NHb3-w9Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

So these two warnings seems to be happening:

  drivers/of/unittest-data/testcases.dtb: Warning
(interrupts_extended_property): Could not get phandle node for
/__local_fixups__/testcase-data/interrupts/interrupts-extended0:interrupts-extended(cell
3)

  drivers/of/unittest-data/testcases.dtb: Warning
(interrupts_property): interrupts size is (4), expected multiple of 8
in /testcase-data/testcase-device2

and honestly, warnings during "make allmodconfig" are not acceptable.
Right now we have a few module license warnings that I hope are going
to go away, but the devicetree one I didn't even notice when it
appeared. I'm actually surprised, because I do a "make allmodconfig"
in between all pulls, and I didn't notice it after doing the
devicetree pull.

Of course, that is probably just exactly because those module-license
warnings have made me warning-blind, which is why warnings aren't
acceptable.

"It's a benign warning" is never true, exactly because a couple of
benign warnings that people get used to then end up hiding all the
_bad_ cases.

I have no idea how that dts test-case is _supposed_ to work, so I'll
just write this plaintive email. Please fix it.

           Linus
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
