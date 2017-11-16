From: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Subject: Re: [GIT PULL] DeviceTree updates for 4.15
Date: Wed, 15 Nov 2017 21:15:06 -0800
Message-ID: <CA+55aFx7-inRaLcb1iV58x6=WA4TKgN4aaQ1pZuhhtNzyxGYrw@mail.gmail.com>
References: <CAL_JsqLbJP4T014Mgb4-RTmuTtV7nOiFDBPPzak=d9NHb3-w9Q@mail.gmail.com>
 <CA+55aFyPe=uWLF8gH5_bkPTbGbTP5h1Uq6XTUZA7oiNF8nd_SQ@mail.gmail.com> <CAL_JsqLgpL+19ekd_J7h-jBic1whcQuU+Vp-HEh-VgShhvSVGQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLgpL+19ekd_J7h-jBic1whcQuU+Vp-HEh-VgShhvSVGQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 15, 2017 at 9:05 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> These cases are intentionally bad DT data to feed the testcase. We can
> switch off the warning (at least I think the kbuild infrastructure is
> there), but then the check is disabled for all the good cases too
> which isn't great.

It's fine to have test-cases that are supposed to fail.

But they should warn not as they fail, but only if they fail to fail.

Warning about expected behavior and annoying everybody else is simply
not acceptable.

                Linus
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
