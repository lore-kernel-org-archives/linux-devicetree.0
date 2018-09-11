MIME-Version: 1.0
Date: Tue, 11 Sep 2018 14:19:53 -0500
References: <20180910154227.xsbbqvw3cayro4gg@linutronix.de>
In-Reply-To: <20180910154227.xsbbqvw3cayro4gg@linutronix.de>
Message-ID: <CAL_JsqJ_8_7HNV0jje9yupmPT-p1Aaq5qYPVjKsG__Lx7c266w@mail.gmail.com>
Subject: Re: [RFC PATCH] of: allocate / free phandle cache outside of the devtree_lock
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Thomas Gleixner <tglx@linutronix.de>
List-ID: <devicetree@vger.kernel.org>

On Mon, Sep 10, 2018 at 10:42 AM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> The phandle cache code allocates memory while holding devtree_lock which
> is a raw_spinlock_t. Memory allocation (and free()) is not possible on
> RT while a raw_spinlock_t is held.
> Invoke the kfree() and kcalloc() while the lock is dropped.
>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>
> The devtree_lock lock is raw_spin_lock_t and as of today there are a few
> users which invoke a DT call via a smp_function_call and need it that
> way.
> If this is not acceptable, is there a reason not to use RCU lookups?

No, in fact, that's in the TODO in Documentation/devicetree/todo.txt.
It isn't really maintained though I don't think anything in the list
has gotten done (it was kind of Grant's list).

> Since every lookup requires to hold devtree_lock it makes parallel
> lookups not possible (not sure if it needed / happens, maybe only during
> boot).

Yeah, it's not really a hot path and mostly at boot. That's part of
the reason why converting from a rwlock wasn't an issue.

> While looking through the code when the lock is held, I noticed that
> of_find_last_cache_level() is using a node after dropping a reference to
> it. With RCU, some modifications of the node would require making a copy
> of the node and then replacing the node.

Needing to understand details like this is why it hasn't been done
yet. :) What modifications need a copy?

>  drivers/of/base.c |   22 ++++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)

If we go this route, there's a fix just today[1] that it will need to
be rebased onto.

Rob

[1] http://patchwork.ozlabs.org/patch/968583/
