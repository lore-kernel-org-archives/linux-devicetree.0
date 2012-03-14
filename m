From: "Turquette, Mike" <mturquette@ti.com>
Subject: Re: [PATCH 1/7] clk: fix orphan list iterator to be safe
Date: Tue, 13 Mar 2012 19:10:59 -0700
Message-ID: <CAJOA=zMRnnQmSzOf_Vtvk_1tVooXoKD0oeKeyFWRzLkneRmKiA@mail.gmail.com>
References: <1331680947-29861-1-git-send-email-robherring2@gmail.com>
 <1331680947-29861-2-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1331680947-29861-2-git-send-email-robherring2@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robherring2@gmail.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 13, 2012 at 4:22 PM, Rob Herring <robherring2@gmail.com> wrote:
> From: Rob Herring <rob.herring@calxeda.com>
>
> __clk_reparent can remove orphans, so the list iterator needs to be the
> safe from removal version.
>
> Signed-off-by: Rob Herring <rob.herring@calxeda.com>

Thanks Rob.  I've taken this in for the next series.

Regards,
Mike

> ---
> =A0drivers/clk/clk.c | =A0 =A04 ++--
> =A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index c7c3bc5..802eda4 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1172,7 +1172,7 @@ void __clk_init(struct device *dev, struct clk *clk)
> =A0{
> =A0 =A0 =A0 =A0int i;
> =A0 =A0 =A0 =A0struct clk *orphan;
> - =A0 =A0 =A0 struct hlist_node *tmp;
> + =A0 =A0 =A0 struct hlist_node *tmp, *tmp2;
>
> =A0 =A0 =A0 =A0if (!clk)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
> @@ -1246,7 +1246,7 @@ void __clk_init(struct device *dev, struct clk *clk)
> =A0 =A0 =A0 =A0 * walk the list of orphan clocks and reparent any that ar=
e children of
> =A0 =A0 =A0 =A0 * this clock
> =A0 =A0 =A0 =A0 */
> - =A0 =A0 =A0 hlist_for_each_entry(orphan, tmp, &clk_orphan_list, child_n=
ode)
> + =A0 =A0 =A0 hlist_for_each_entry_safe(orphan, tmp, tmp2, &clk_orphan_li=
st, child_node)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0__clk_reparent(orphan, __clk_init_parent(o=
rphan));
>
> =A0 =A0 =A0 =A0/*
> --
> 1.7.5.4
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
