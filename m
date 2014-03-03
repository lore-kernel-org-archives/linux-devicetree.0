From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/2] checkpatch: fix spurious vendor compatible warnings
Date: Mon, 3 Mar 2014 07:50:20 -0600
Message-ID: <CAL_JsqJfSpanHTCsshQKvbSziQyONC=zzSSunxFoaJytciozCw@mail.gmail.com>
References: <1393604742-14317-1-git-send-email-florian.vaussard@epfl.ch>
	<1393604742-14317-3-git-send-email-florian.vaussard@epfl.ch>
	<1393621571.10280.49.camel@joe-AO722>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393621571.10280.49.camel@joe-AO722>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Cc: Florian Vaussard <florian.vaussard-p8DiymsW2f8@public.gmane.org>, Andy Whitcroft <apw-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 28, 2014 at 3:06 PM, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org> wrote:
> Hi.
>
> A couple of suggestions and a couple of questions.
>
> I made the patch below against your patches to.
>
> o Look for ".compatible = "foo" strings in .c and .h files too
> o Improve the vendor name match in vendor-prefix.txt by only
>   matching the exact vendor name at the beginning of lines.
>
> I then produced a file of all the compatible uses in dts
> and used checkpatch on it.  It's a long list and a longer
> checkpatch warning list.
>
> $ git ls-files | grep -E "\.dtsi?$" | \
>   xargs grep -hE "^\s*compatible\s*="| \
>   sed -r -e 's/^\s*//' -e 's/\s*=\s*/ = /'| sort | uniq > tmp.dts
> $ .scripts/checkpatch.pl -f tmp.dts
>
> A couple of questions:
>
> How does the $compat2 variable actually work?
> What is it supposed to do?
>
>                                 my $compat2 = $compat;
>                                 $compat2 =~ s/\,[a-z]*\-/\,<\.\*>\-/;
>
> For instance:
> WARNING: DT compatible string "marvell,tauros2-cache" appears un-documented -- check ./Documentation/devicetree/bindings/
>
> The prefix "tauros2-" doesn't match '=~ s/[a-z]*-/
>
> Should it?  Should the '[a-z]*' be '[a-zA-Z0-9-]+'
> like the other test?

What Florian said is exactly right.

> Also the grep used when $compat2 is different than $compat
> has <.*>
>
> There aren't any descriptions I see in binding/ that have
> any <foo> like uses with the angle brackets.
>
> Are the angle brackets "<" and ">" necessary?
>
> I think the code block should look more like:
>
>                                 my $compat2 = $compat;
>                                 $compat2 =~ s/\,[a-zA-Z0-9]*\-/\,\.\*\-/g;
>                                 my $grepfor = "\Q$compat\E";
>                                 $grepfor .= "|\Q$compat2\E" if ($compat2 ne $compat);
>                                 `grep -Erq "$grepfor" $dt_path`;
>
> so that there's only 1 grep pattern when
> $compat2 is the same as $compat and the
> strings are escape quoted.
>
> There are a _lot_ of missing entries:
>
> o 164 vendor names
> o 2408 device names (maybe due to bad compat2 greps?)
>
> What, if anything, should be done about them?

Documenting DT bindings is somewhat new, so there are lots of older
sparc and powerpc bindings that don't have documentation and are
basically grandfathered in. I had thought about adding documentation
in an undocumented binding list, but that would only help making
checks on files pass. For any new bindings, documentation is required,
but we are only hitting like 50-60% in each kernel version. Those are
the ones I hope to catch.

I've written a script that finds the commit adding the undocumented
property and can email the authors, but I've been reluctant to start
spamming people with this. I want to see if checkpatch helps improve
the rate.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
