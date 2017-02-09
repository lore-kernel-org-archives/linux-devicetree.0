From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of/unittest: Swap arguments of of_unittest_apply_overlay()
Date: Thu, 9 Feb 2017 09:12:42 -0600
Message-ID: <CAL_JsqKuNXsBwxkrw7EnX-ZgUm_DtP-0VZtSYYnq0_0Uxrc2GA@mail.gmail.com>
References: <20170119100616.4679-1-alexander.sverdlin@nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170119100616.4679-1-alexander.sverdlin-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Sverdlin <alexander.sverdlin-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 19, 2017 at 4:06 AM, Alexander Sverdlin
<alexander.sverdlin-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org> wrote:
> Function signature
>
>   of_unittest_apply_overlay(int unittest_nr, int overlay_nr, ...
>
> and call sites, like in of_unittest_apply_overlay_check():
>
>   ret = of_unittest_apply_overlay(overlay_nr, unittest_nr, ...
>
> do not match. Fix this in one place (function signature).
> The only affected test case is 15, which supplies non-existing
> overlay number 16, but two bugs matched here. Fix the test case.
>
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>  drivers/of/unittest.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
