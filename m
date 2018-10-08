From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH] reset: Fix potential use-after-free in
 __of_reset_control_get()
Date: Mon, 08 Oct 2018 15:28:49 +0200
Message-ID: <1539005329.11512.26.camel@pengutronix.de>
References: <20181008111435.25994-1-geert+renesas@glider.be>
         <1539003375.11512.19.camel@pengutronix.de>
         <CAMuHMdU_ECQxxD1HK5bq5QY7QnxzaBKSJsZFw+284oSnJfSFAA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdU_ECQxxD1HK5bq5QY7QnxzaBKSJsZFw+284oSnJfSFAA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2018-10-08 at 15:12 +0200, Geert Uytterhoeven wrote:
> Hi Philipp,
> 
> On Mon, Oct 8, 2018 at 2:56 PM Philipp Zabel <p.zabel@pengutronix.de> wrote:
> > On Mon, 2018-10-08 at 13:14 +0200, Geert Uytterhoeven wrote:
> > > Calling of_node_put() decreases the reference count of a device tree
> > > object, and may free some data.
> > > 
> > > However, the of_phandle_args structure embedding it is passed to
> > > reset_controller_dev.of_xlate() after that, so it may still be accessed.
> > > 
> > > Move the call to of_node_put() down to fix this.
> > > 
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > >  drivers/reset/core.c | 15 ++++++++-------
> > >  1 file changed, 8 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/drivers/reset/core.c b/drivers/reset/core.c
> > > index 225e34c56b94a2e3..bc9df10d31b4bae1 100644
> > > --- a/drivers/reset/core.c
> > > +++ b/drivers/reset/core.c
> > > @@ -496,27 +496,28 @@ struct reset_control *__of_reset_control_get(struct device_node *node,
[...]
> > >       /* reset_list_mutex also protects the rcdev's reset_control list */
> > >       rstc = __reset_control_get_internal(rcdev, rstc_id, shared);
> > > 
> > > +out:
> > > +     of_node_put(args.np);
> > >       mutex_unlock(&reset_list_mutex);
> > 
> > Thank you for the patch. I'd like to move of_node_put after mutex_unlock
> > for symmetry. If you agree, I can switch the two when applying.
> 
> No objection, thanks!

Applied to reset/next with that change.

regards
Philipp
