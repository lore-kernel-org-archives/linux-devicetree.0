From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/2] of: Fix issue where code would fall through to
 error case.
Date: Tue, 29 Nov 2016 10:41:24 -0800
Message-ID: <583DCBD4.4010908@gmail.com>
References: <1480278058-19688-1-git-send-email-moritz.fischer@ettus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1480278058-19688-1-git-send-email-moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/27/16 12:20, Moritz Fischer wrote:
> No longer fall through into the error case that prints out
> an error if no error (err = 0) occurred.
> 
> Rework error handling to print error where it occured instead
> of having a global catch-all at the end of the function.
> 
> Fixes d9181b20a83(of: Add back an error message, restructured)
> Signed-off-by: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
> Reviewed-by: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>
> ---
> Hi Rob, Frank
> 
> this has already Frank's Reviewed-by: tag on it, but since I changed around the
> earlier part (before tree_node gets assigned) Frank might wanna take another look
> at this.

< snip >

Hi Moritz,

I agree with Rob's suggested one line solution (that I initially misunderstood).
The one line fix is to add "if (err)" immediately following label "err_out" in
of_resolve_phandles().

As far as patch 2/2, I'm not bothered by the two instances of line over 80 chars.
But if Rob wants to take patch 2/2 I have no objection.

-Frank
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
