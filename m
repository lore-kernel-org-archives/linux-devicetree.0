MIME-Version: 1.0
Date: Tue, 30 Oct 2018 14:10:56 -0500
References: <d7007cad85bb06e0f4e081bc4daf6f0f79c81861.1540921794.git.ren_guo@c-sky.com>
	<3bbfd02a59c0a9865cf63ac454408c87cd9c7427.1540921794.git.ren_guo@c-sky.com>
In-Reply-To: <3bbfd02a59c0a9865cf63ac454408c87cd9c7427.1540921794.git.ren_guo@c-sky.com>
Message-ID: <CAL_JsqKsx6OqbW+Z8q=2CBC+dU99ay5ggT8eONxf1eCh+Jwkig@mail.gmail.com>
Subject: Re: [PATCH V3 2/2] csky: use common dtb build rules
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Guo Ren <ren_guo@c-sky.com>
Cc: Arnd Bergmann <arnd@arndb.de>, "open list:GENERIC INCLUDE/ASM HEADER FILES" <linux-arch@vger.kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, Oct 30, 2018 at 12:50 PM Guo Ren <ren_guo@c-sky.com> wrote:
>
> Remove the Kbuild rules in arch/csky and use common dtb build rules.
>
> This modification is based on:
>
> commit 37c8a5fafa3b ("kbuild: consolidate Devicetree dtb build rules")
>
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/csky/Makefile          | 11 +----------
>  arch/csky/boot/dts/Makefile |  3 ---
>  2 files changed, 1 insertion(+), 13 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
