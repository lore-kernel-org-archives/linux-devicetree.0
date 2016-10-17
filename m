From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] make of_device_make_bus_id() static
Date: Mon, 17 Oct 2016 12:08:51 -0700
Message-ID: <580521C3.20108@gmail.com>
References: <1476719426-12549-1-git-send-email-frowand.list@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1476719426-12549-1-git-send-email-frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/17/16 08:50, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> From: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>
> 
> of_device_make_bus_id() was changed to non-static by commit c66012253800
> ("of/device: Make of_device_make_bus_id() usable by other code") more than
> 6 years ago, but there are no users of it outside of platform.c.  Make the
> function static again.
> 
> Signed-off-by: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>


Rob,

Please ignore due to bad subject. I will resend
with proper subject.

-Frank

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
