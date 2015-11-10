From: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Subject: Re: [PATCH] of: Print rather than WARN'ing when overlap check fails
Date: Tue, 10 Nov 2015 20:28:55 +1100
Message-ID: <1447147735.1314.1.camel@ellerman.id.au>
References: <1447132113-31434-1-git-send-email-mpe@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447132113-31434-1-git-send-email-mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, mitchelh-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2015-11-10 at 16:08 +1100, Michael Ellerman wrote:

> __rmem_check_for_overlap() is called very early in boot, and on some
> powerpc systems it's not safe to call WARN that early in boot.
> 
> If the overlap check fails the system will oops instead of printing a
> warning. Furthermore because it's so early in boot the console is not up
> and the user doesn't see the oops, they just get a dead system.
> 
> Fix it by printing an error instead of calling WARN.
> 
> Fixes: ae1add247bf8 ("of: Check for overlap in reserved memory regions")
> Signed-off-by: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
> ---
>  drivers/of/of_reserved_mem.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

I forgot to say, I assume you're OK to merge this and get it to Linus soonish?
Otherwise I can stuff it in a fix branch and ask Linus to pull that. Let me
know which you'd prefer.

cheers

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
