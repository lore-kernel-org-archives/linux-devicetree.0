From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] scripts/dtc: dt_to_config - kernel config options for
 a devicetree
Date: Fri, 24 Jun 2016 15:31:06 -0500
Message-ID: <CAL_JsqKf4Xrqz5Cu345yqDqfoEgvjrbsDk6JKAPN0USNzckRBw@mail.gmail.com>
References: <575B46CE.6080903@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <575B46CE.6080903-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 10, 2016 at 6:01 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> From: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>
>
> Determining which kernel config options need to be enabled for a
> given devicetree can be a painful process.  Create a new tool to
> find the drivers that may match a devicetree node compatible,
> find the kernel config options that enable the driver, and
> optionally report whether the kernel config option is enabled.
>
> Signed-off-by: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>

I applied, but this is what I get running it:

$ scripts/dtc/dt_to_config arch/arm/boot/dts/highbank.dts

file 'dtx_diff' is not executable or does not exist
   Is scripts/dtc/ in the shell $PATH variable?
   Are you in the root directory of a kernel tree?

The answer to the first question is no, and I'm not going to add it.
If I'm in the kernel root, then the script should know where to find
it.

Rob

P.S. There is this new tool called git and its sub command
git-format-patch. It has some nifty features like setting the file
mode, so the maintainer doesn't have to. And it enables doing a 3-way
merge when applying patches that don't apply cleanly. ;)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
