From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 1/2] kbuild: create built-in.o automatically if parent
 directory wants it
Date: Thu, 9 Nov 2017 06:35:29 +0100
Message-ID: <20171109053529.GA12717@ravnborg.org>
References: <1510072307-16819-1-git-send-email-yamada.masahiro@socionext.com>
 <1510072307-16819-2-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kbuild-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1510072307-16819-2-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Michal Marek <mmarek@suse.com>
List-Id: devicetree@vger.kernel.org

Hi Masahiro.

Thanks for picking this up.

> A key point is, the parent Makefile knows whether built-in.o is needed
> or not.  If a subdirectory needs to create built-in.o, its parent can
> tell the fact when Kbuild descends into it.
Good observation!
> 
> diff --git a/Makefile b/Makefile
> index 008a4e5..cc0b618 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1003,7 +1003,7 @@ $(sort $(vmlinux-deps)): $(vmlinux-dirs) ;
>  
>  PHONY += $(vmlinux-dirs)
>  $(vmlinux-dirs): prepare scripts
> -	$(Q)$(MAKE) $(build)=$@
> +	$(Q)$(MAKE) $(build)=$@ need-builtin=1

The need-bultin may also be required for the shortcuts
that allows one to use:

	make <dir>/

    example:

	make net/

And maybe selftest, documentation shortcuts too?
Other than that - looks good.

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

	Sam

