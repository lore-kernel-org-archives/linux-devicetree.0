From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 2/2] Embedded USB Debugger (EUD) driver
Date: Wed, 12 Sep 2018 08:29:05 +0200
Message-ID: <20180912062905.GD10268@kroah.com>
References: <1536096853-30473-1-git-send-email-pheragu@codeaurora.org>
 <1536096853-30473-3-git-send-email-pheragu@codeaurora.org>
 <c68c466a-576f-43d9-a7dd-7ee8e0ebba3f@codeaurora.org>
 <20180905111800.GA30003@kroah.com>
 <aade97184ee5027ac6e32fd742cfbc5a@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <aade97184ee5027ac6e32fd742cfbc5a@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: pheragu@codeaurora.org
Cc: Manu Gautam <mgautam@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, ckadabi@codeaurora.org, tsoni@codeaurora.org, rnayak@codeaurora.org, bryanh@codeaurora.org, psodagud@codeaurora.org, Satya Durga Srinivasu Prabhala <satyap@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 11, 2018 at 01:40:19PM -0700, pheragu@codeaurora.org wrote:
> On 2018-09-05 04:18, Greg KH wrote:
> > On Wed, Sep 05, 2018 at 03:01:26PM +0530, Manu Gautam wrote:
> > > Hi,
> > > 
> > > 
> > > On 9/5/2018 3:04 AM, Prakruthi Deepak Heragu wrote:
> > > > Add support for control peripheral of EUD (Embedded USB Debugger) to
> > > > listen to events such as USB attach/detach, charger enable/disable, pet
> > > > EUD to indicate software is functional.
> > > >
> > > > Signed-off-by: Satya Durga Srinivasu Prabhala <satyap@codeaurora.org>
> > > > Signed-off-by: Prakruthi Deepak Heragu <pheragu@codeaurora.org>
> > > > ---
> > > >  drivers/soc/qcom/Kconfig  |  12 ++
> > > >  drivers/soc/qcom/Makefile |   1 +
> > > >  drivers/soc/qcom/eud.c    | 338 ++++++++++++++++++++++++++++++++++++++++++++++
> > > >  3 files changed, 351 insertions(+)
> > > >  create mode 100644 drivers/soc/qcom/eud.c
> > > >
> > > > diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> > > [snip]
> > > > +
> > > > +#define EUD_ENABLE_CMD 1
> > > > +#define EUD_DISABLE_CMD 0
> > > 
> > > Why not use module param as boolean? I mean zero to disable and
> > > non-zero to enable?
> > 
> > Never use module parameters on new code, as it's really hard to ever
> > change them.  It also doesn't work for multiple devices of the same
> > type.
> > 
> If not for module_param, do you suggest we use sysfs?

It depends on what you want to control.

> module_param also provides a facility to control these parameters
> through command line too. If we can't use module_param, do you expect
> us to use __setup(..) API?

Again, it depends on what you are wanting to handle here.  module
parameters and setup variables are all "global" in that they affect all
devices of the same type.  sysfs can be "per device" which is almost
always what you want to have happen.

But don't use any of those for things that should be "automatic" in that
the driver should figure out what needs to be done here and not need any
external configuration.  That's the best way of all to handle this.

thanks,

greg k-h
