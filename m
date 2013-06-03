From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC PATCH 2/3] drivers: mfd: vexpress: add timeout API to
 vexpress config interface
Date: Mon, 3 Jun 2013 12:52:19 +0100
Message-ID: <20130603115219.GA22821@e102568-lin.cambridge.arm.com>
References: <1369399986-15649-1-git-send-email-lorenzo.pieralisi@arm.com>
 <1369399986-15649-3-git-send-email-lorenzo.pieralisi@arm.com>
 <1370254532.3407.36.camel@linaro1.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1370254532.3407.36.camel-K+mpW1F5uff9zxVx7UNMDg@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: "Jon Medhurst (Tixy)" <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Amit Kucheria <amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Achin Gupta <Achin.Gupta-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 03, 2013 at 11:15:32AM +0100, Jon Medhurst (Tixy) wrote:
> On Fri, 2013-05-24 at 13:53 +0100, Lorenzo Pieralisi wrote:
> > In case some transactions to the Serial Power Controller (SPC) are lost owing
> > to multiple operations handled at once by the M3 controller the OS needs to
> > rely on a configuration API that can time out so that failures do not result
> > in an unusable system.
> > 
> > This patch adds a timeout API to the vexpress config programming interface,
> > and refactors the existing read/write functions so that they can be reused
> > seamlessly on top of the newly defined API.
> 
> Isn't one of the main purposes of the config interface to serialise
> transactions to the config bus, so why would the SPC be handling
> multiple transactions at once? And if we can in fact loose transactions
> doesn't this mean we get random failures in the system? E.g. if this
> happened at boot in vexpress_spc_populate_opps then cpufreq will fail.

It has more to do with firmware carrying out background operations like
powering up a cluster when a DVFS is requested. You are absolutely right
though:

a) the timeout interface is broken, as you mentioned (I noticed after
   posting it)
b) we should not add a timeout interface to paper over FW issues

I can prepare a v2 with timeout interface dropped and extensively test that
one, I do not think we should add the required complexity that you describe
below for something that should never happen.

> Also, I think the code implementing timeouts is broken, see below.

I will have a look asap and repost a v2 accordingly.

> > Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> > Cc: Achin Gupta <achin.gupta-5wv7dgnIgG8@public.gmane.org>
> > Cc: Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha-5wv7dgnIgG8@public.gmane.org>
> > Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> > Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > Cc: Amit Kucheria <amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > Cc: Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
> > ---
> >  drivers/mfd/vexpress-config.c | 26 +++++++---
> >  include/linux/vexpress.h      | 23 ++++++--
> >  2 files changed, 37 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/mfd/vexpress-config.c b/drivers/mfd/vexpress-config.c
> > index 1af2b0e..6f4aa5a 100644
> > --- a/drivers/mfd/vexpress-config.c
> > +++ b/drivers/mfd/vexpress-config.c
> > @@ -266,8 +266,18 @@ int vexpress_config_wait(struct vexpress_config_trans *trans)
> >  }
> >  EXPORT_SYMBOL(vexpress_config_wait);
> >  
> > -int vexpress_config_read(struct vexpress_config_func *func, int offset,
> > -		u32 *data)
> > +int vexpress_config_wait_timeout(struct vexpress_config_trans *trans,
> > +			long jiffies)
> > +{
> > +	int ret;
> > +	ret = wait_for_completion_timeout(&trans->completion, jiffies);
> 
> If the request times out, don't we need to call vexpress_config_complete
> to dequeue the timed out request and trigger the next one? Though we
> will still have a problem where the timeout happens but the request
> then does in fact complete normally, in that case we would signal
> completion of the second request before it has in fact completed.
> 
> So, if transactions really can get silently dropped by thing on the end
> of the config bus, then we must have a mechanism for associating a
> particular transaction with a completion signal, otherwise we won't know
> what transaction actually got completed OK and which ones were dropped
> and should receive -ETIMEDOUT.
> 
> Finally, I don't think these issues are purely theoretical, I'm pretty
> certain that the kernel panics and spinlock bad magic errors I see with
> his patch series are due to requests completing after they have been
> timed out and then the stack based transaction object is being accessed
> after it has gone out of scope.

You are absolutely right, apologies for wasting your time in testing it.

Thanks a lot for the review,
Lorenzo
