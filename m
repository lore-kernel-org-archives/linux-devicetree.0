From: Stephen Boyd <stephen.boyd@linaro.org>
Subject: Re: [PATCH v5 23/23] phy: Add support for Qualcomm's USB HS phy
Date: Fri, 21 Oct 2016 12:33:43 -0700
Message-ID: <147707842313.25848.12479294741874867656@sboyd-linaro>
References: <20161018015636.11701-1-stephen.boyd@linaro.org>
 <20161018015636.11701-24-stephen.boyd@linaro.org>
 <147700563857.2550.16732518381302920183@sboyd-linaro>
 <20161021022030.GB16461@b29397-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161021022030.GB16461@b29397-desktop>
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
Cc: Felipe Balbi <balbi@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Neil Armstrong <narmstrong@baylibre.com>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Peter Chen <peter.chen@nxp.com>, Andy Gross <andy.gross@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Quoting Peter Chen (2016-10-20 19:20:30)
> On Thu, Oct 20, 2016 at 04:20:38PM -0700, Stephen Boyd wrote:
> > Quoting Stephen Boyd (2016-10-17 18:56:36)
> > > +
> > > +static int
> > > +qcom_usb_hs_phy_vbus_notifier(struct notifier_block *nb, unsigned long event,
> > > +                             void *ptr)
> > > +{
> > > +       struct qcom_usb_hs_phy *uphy;
> > > +       int is_host;
> > > +       u8 addr;
> > > +
> > > +       uphy = container_of(nb, struct qcom_usb_hs_phy, vbus_notify);
> > > +       is_host = extcon_get_cable_state_(uphy->id_edev, EXTCON_USB_HOST);
> > 
> > Please don't apply this patch. This call now deadlocks on v4.9-rc1
> > because of how extcon_get_cable_state_() now grabs a lock that is
> > already held here when we're inside the notifier. It's not really
> > required that we grab the lock in extcon there, but this has exposed a
> > flaw in the logic anyway. We don't know if the id pin is going to toggle
> > before or after this function is called, so we should really keep track
> > of both vbus and id state in this driver and then do the same ulpi
> > writes from two different notifiers for both vbus and id pin. We would
> > be duplicating work sometimes, but that's pretty much the best solution
> > I can come up with. Otherwise it's racy.
> > 
> 
> Why you need to care id status? If EXTCON_USB event has happened, and
> event is true, you can set, otherwise, it is clear operation, that's
> to say you may not need have id extcon phandle, do you think so?
> 

I need to add a comment to the code here because I forgot what was going
on.

Either way, this code is pulling D+ up when we're in device mode. We
don't want to do the pullup if we're a host, and vbus extcon only tells
us if the cable is attached so we can't just rely on that one bit of
information.

I suppose that's not really appropriate to do via extcon though in the
phy driver though, so I'm thinking that it should be rewritten to use
the phy_set_mode() feature of the phy framework. Basically,
ci_udc_pullup() will call phy_set_mode() with PHY_MODE_USB_DEVICE or
PHY_MODE_USB_HOST and then we can set or clear these bits in the ulpi
register space. I think that will make things simpler here and things
like soft-connect will work better. Sound good?
