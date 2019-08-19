From: Ran Wang <ran.wang_1@nxp.com>
Subject: RE: [PATCH v5 1/3] PM: wakeup: Add routine to help fetch wakeup
 source object.
Date: Mon, 19 Aug 2019 08:14:32 +0000
Message-ID: <DB8PR04MB682632A586827032F8D6EA2DF1A80@DB8PR04MB6826.eurprd04.prod.outlook.com>
References: <20190724074722.12270-1-ran.wang_1@nxp.com>
 <4158639.B12JYek7R7@kreacher>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4158639.B12JYek7R7@kreacher>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Mark Rutland <mark.rutland@arm.com>, Biwen Li <biwen.li@nxp.com>, Len Brown <len.brown@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Rafael,

On Monday, August 05, 2019 17:59, Rafael J. Wysocki wrote:
> 
> On Wednesday, July 24, 2019 9:47:20 AM CEST Ran Wang wrote:
> > Some user might want to go through all registered wakeup sources and
> > doing things accordingly. For example, SoC PM driver might need to do
> > HW programming to prevent powering down specific IP which wakeup
> > source depending on. So add this API to help walk through all
> > registered wakeup source objects on that list and return them one by one.
> >
> > Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> > ---
> > Change in v5:
> > 	- Update commit message, add decription of walk through all wakeup
> > 	source objects.
> > 	- Add SCU protection in function wakeup_source_get_next().
> > 	- Rename wakeup_source member 'attached_dev' to 'dev' and move it
> up
> > 	(before wakeirq).
> >
> > Change in v4:
> > 	- None.
> >
> > Change in v3:
> > 	- Adjust indentation of *attached_dev;.
> >
> > Change in v2:
> > 	- None.
> >
> >  drivers/base/power/wakeup.c | 24 ++++++++++++++++++++++++
> >  include/linux/pm_wakeup.h   |  3 +++
> >  2 files changed, 27 insertions(+)
> >
> > diff --git a/drivers/base/power/wakeup.c b/drivers/base/power/wakeup.c
> > index ee31d4f..2fba891 100644
> > --- a/drivers/base/power/wakeup.c
> > +++ b/drivers/base/power/wakeup.c
> > @@ -14,6 +14,7 @@
> >  #include <linux/suspend.h>
> >  #include <linux/seq_file.h>
> >  #include <linux/debugfs.h>
> > +#include <linux/of_device.h>
> >  #include <linux/pm_wakeirq.h>
> >  #include <trace/events/power.h>
> >
> > @@ -226,6 +227,28 @@ void wakeup_source_unregister(struct
> wakeup_source *ws)
> >  	}
> >  }
> >  EXPORT_SYMBOL_GPL(wakeup_source_unregister);
> > +/**
> > + * wakeup_source_get_next - Get next wakeup source from the list
> > + * @ws: Previous wakeup source object, null means caller want first one.
> > + */
> > +struct wakeup_source *wakeup_source_get_next(struct wakeup_source
> > +*ws) {
> > +	struct list_head *ws_head = &wakeup_sources;
> > +	struct wakeup_source *next_ws = NULL;
> > +	int idx;
> > +
> > +	idx = srcu_read_lock(&wakeup_srcu);
> > +	if (ws)
> > +		next_ws = list_next_or_null_rcu(ws_head, &ws->entry,
> > +				struct wakeup_source, entry);
> > +	else
> > +		next_ws = list_entry_rcu(ws_head->next,
> > +				struct wakeup_source, entry);
> > +	srcu_read_unlock(&wakeup_srcu, idx);
> > +
> 
> This is incorrect.
> 
> The SRCU cannot be unlocked until the caller of this is done with the object
> returned by it, or that object can be freed while it is still being accessed.

Thanks for the comment. Looks like I was not fully understanding your point on
v4 discussion. So I will implement 3 APIs by referring wakeup_sources_stats_seq_start/next/stop()
 
> Besides, this patch conflicts with some general wakeup sources changes in the
> works, so it needs to be deferred and rebased on top of those changes.

Could you please tell me which is the right code base I should developing on?
I just tried applying v5 patch on latest git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git branch master (d1abaeb Linux 5.3-rc5)
and no conflict encountered.

Thanks & Regards,
Ran
