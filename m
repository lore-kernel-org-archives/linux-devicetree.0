From: Stephen Boyd <stephen.boyd@linaro.org>
Subject: Re: [PATCH v2 2/3] usb: chipidea: Hook into mux framework to toggle
 usb switch
Date: Tue, 18 Jul 2017 18:47:02 -0700
Message-ID: <150042882207.23422.15172007883605080758@sboyd-linaro>
References: <20170714214005.14967-1-stephen.boyd@linaro.org>
 <20170714214005.14967-3-stephen.boyd@linaro.org>
 <20170718044111.GA13320@b29397-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170718044111.GA13320@b29397-desktop>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Peter Chen <hzpeterchen@gmail.com>
Cc: Peter Chen <Peter.Chen@nxp.com>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.infradead.org, Andy Gross <andy.gross@linaro.org>, Peter Rosin <peda@axentia.se>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Quoting Peter Chen (2017-07-17 21:41:11)
> On Fri, Jul 14, 2017 at 02:40:04PM -0700, Stephen Boyd wrote:
> >  
> > @@ -175,6 +176,10 @@ static int host_start(struct ci_hdrc *ci)
> >               if (ci_otg_is_fsm_mode(ci)) {
> >                       otg->host = &hcd->self;
> >                       hcd->self.otg_port = 1;
> > +             } else {
> > +                     ret = mux_control_select(ci->platdata->usb_switch, 1);
> 
> It is better to use MACRO for 1 and 0.
> 

Ok.

> > +                     if (ret)
> > +                             goto disable_reg;
> >               }
> >       }
> >  
> > @@ -195,6 +200,8 @@ static void host_stop(struct ci_hdrc *ci)
> >       struct usb_hcd *hcd = ci->hcd;
> >  
> >       if (hcd) {
> > +             if (!ci_otg_is_fsm_mode(ci))
> > +                     mux_control_deselect(ci->platdata->usb_switch);
> >               if (ci->platdata->notify_event)
> >                       ci->platdata->notify_event(ci,
> >                               CI_HDRC_CONTROLLER_STOPPED_EVENT);
> > diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> > index d68b125796f9..deb18099e168 100644
> > --- a/drivers/usb/chipidea/udc.c
> > +++ b/drivers/usb/chipidea/udc.c
> > @@ -22,6 +22,7 @@
> >  #include <linux/usb/gadget.h>
> >  #include <linux/usb/otg-fsm.h>
> >  #include <linux/usb/chipidea.h>
> > +#include <linux/mux/consumer.h>
> >  
> >  #include "ci.h"
> >  #include "udc.h"
> > @@ -1964,16 +1965,26 @@ void ci_hdrc_gadget_destroy(struct ci_hdrc *ci)
> >  
> >  static int udc_id_switch_for_device(struct ci_hdrc *ci)
> >  {
> > +     int ret = 0;
> > +
> >       if (ci->is_otg)
> >               /* Clear and enable BSV irq */
> >               hw_write_otgsc(ci, OTGSC_BSVIS | OTGSC_BSVIE,
> >                                       OTGSC_BSVIS | OTGSC_BSVIE);
> >  
> > -     return 0;
> > +     if (!ci_otg_is_fsm_mode(ci))
> > +             ret = mux_control_select(ci->platdata->usb_switch, 0);
> > +
> > +     if (ci->is_otg && ret)
> > +             hw_write_otgsc(ci, OTGSC_BSVIE | OTGSC_BSVIS, OTGSC_BSVIS);
> 
> Should use !ret?
> 

No? This is intended to unwind the clearing and enabling of the BSV irq
on failure (ret is non-zero) and so we clear and disable the BSV irq.
