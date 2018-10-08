From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2] of: base: Fix english spelling in of_alias_get_alias_list()
Date: Mon, 8 Oct 2018 10:00:57 -0500
Message-ID: <CAL_JsqL445pSkwmjet7BrSa5gLeAtf9R9fgdi-GApqfLK672tg@mail.gmail.com>
References: <1e4e9047636e94dc2bff62b915bd0261f334dd8a.1538999925.git.michal.simek@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1e4e9047636e94dc2bff62b915bd0261f334dd8a.1538999925.git.michal.simek@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michal Simek <monstr@monstr.eu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 8, 2018 at 6:58 AM Michal Simek <michal.simek@xilinx.com> wrote:
>
> Fix english spelling in of_alias_get_alias_list().
>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Fixes: b1078c355d76 ("of: base: Introduce of_alias_get_alias_list() to check alias IDs")
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> ---
>
> Changes in v2:
> - Fix 2 more issues reported by Randy Dunlap
> - Add fixed log sha1
>
> Greg: Please apply it on the top of tty-next because patch is going via
> your tree.

Acked-by: Rob Herring <robh@kernel.org>
