From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [TRIVIAL PATCH] of: per-file dtc preprocessor flags
Date: Sat, 20 Jul 2019 11:40:59 +0900
Message-ID: <CAK7LNARJjb3fgdo_dxPSv-vs5x573OHKf-UAUJGMc89Jfmk+QA@mail.gmail.com>
References: <20190719192824.24639-1-Eugeniy.Paltsev@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190719192824.24639-1-Eugeniy.Paltsev@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, arcml <linux-snps-arc@lists.infradead.org>, Vineet Gupta <Vineet.Gupta1@synopsys.com>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>
List-Id: devicetree@vger.kernel.org

On Sat, Jul 20, 2019 at 4:28 AM Eugeniy Paltsev
<Eugeniy.Paltsev@synopsys.com> wrote:
>
> As of today we are able to pass custom flags to dtc compiler but not
> to dtc preprocessor.
> This ability is required for including some board-specific header files.
> It allows us to pass defined constants to dts without their duplication
> in several places.

How to use this option in a useful way?

I see a bunch of defined constants under include/dt-bindings/.

If you are talking about code duplication across architectures,
you can include arm dtsi from arm64 dts, or vice versa.
This was made possible by the symbolic links
in scripts/dtc/include-prefixes/.

Could you please elaborate your issues if you cannot solve them
by the current strategy?



> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> ---
>  scripts/Makefile.lib | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index f1f38c8cdc74..f2595a608dce 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -166,6 +166,8 @@ dtc_cpp_flags  = -Wp,-MD,$(depfile).pre.tmp -nostdinc                    \
>                  $(addprefix -I,$(DTC_INCLUDE))                          \
>                  -undef -D__DTS__
>
> +dtc_cpp_flags  += $(DTC_CPP_FLAGS_$(basetarget))
> +
>  # Useful for describing the dependency of composite objects
>  # Usage:
>  #   $(call multi_depend, multi_used_targets, suffix_to_remove, suffix_to_add)
> --
> 2.21.0
>


-- 
Best Regards
Masahiro Yamada
