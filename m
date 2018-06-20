From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [RFC PATCH] of: overlay: update phandle cache on overlay apply
 and remove
Date: Wed, 20 Jun 2018 12:23:01 -0600
Message-ID: <CAL_JsqJdp16D4svB8Y7jurNVdHzVgz8_pkOKBA6mFyhXkqWi6w@mail.gmail.com>
References: <1529251416-14814-1-git-send-email-frowand.list@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1529251416-14814-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: Alan Tull <atull@kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jun 17, 2018 at 10:03 AM,  <frowand.list@gmail.com> wrote:
> From: Frank Rowand <frank.rowand@sony.com>
>
> A comment in the review of the patch adding the phandle cache said that
> the cache would have to be updated when modules are applied and removed.
> This patch implements the cache updates.
>
> Fixes: 0b3ce78e90fc ("of: cache phandle nodes to reduce cost of of_find_node_by_phandle()")
> Reported-by: Alan Tull <atull@kernel.org>
> Suggested-by: Alan Tull <atull@kernel.org>
> Signed-off-by: Frank Rowand <frank.rowand@sony.com>
> ---
>
> Compiles for one configuration.
> NOT boot tested.
> Not run through my normal process to check for new warnings, etc.

I'm assuming you will resend a non-RFC version for me to apply.

I think it would be a bit better if callers didn't have to do free and
populate themselves, but just made an invalidate call (like a normal
cache) and re-populating the cache could happen on demand. Or if it
was done as a single call, you could just copy the old entries to the
new larger array. But maybe there would be a race condition in doing
that? In any case, all that could be a subsequent patch.

Rob
