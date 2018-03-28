From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] devicetree: Remove dangling symlinks
Date: Wed, 28 Mar 2018 08:04:34 -0500
Message-ID: <CABGGiswL9Mw_viewE9v0OFrnvxOZyaYRyMW5GNEP_R0JEiWDhQ@mail.gmail.com>
References: <20180328083213.by4sjrk3nx5s4rbk@fm.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180328083213.by4sjrk3nx5s4rbk@fm.suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Libor Pechacek <lpechacek@suse.com>, Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org, James Hogan <jhogan@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Olof Johansson <olof@lixom.net>, Heiko Stuebner <heiko@sntech.de>, trivial@kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

+Arnd

On Wed, Mar 28, 2018 at 3:32 AM, Libor Pechacek <lpechacek@suse.com> wrote:
> Support for CRIS and Meta was dropped.
>
> Signed-off-by: Libor Pechacek <lpechacek@suse.com>
> Fixes: bb6fb6dfcc17 ("metag: Remove arch/metag/")
> Fixes: c690eddc2f3b ("CRIS: Drop support for the CRIS port")
> Cc: James Hogan <jhogan@kernel.org>
> Cc: Jesper Nilsson <jesper.nilsson@axis.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Olof Johansson <olof@lixom.net>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: devicetree@vger.kernel.org
> Cc: trivial@kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  scripts/dtc/include-prefixes/cris  | 1 -
>  scripts/dtc/include-prefixes/metag | 1 -
>  2 files changed, 2 deletions(-)
>  delete mode 120000 scripts/dtc/include-prefixes/cris
>  delete mode 120000 scripts/dtc/include-prefixes/metag

I'm assuming Arnd will take this.

Acked-by: Rob Herring <robh@kernel.org>
