From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 2/2] Embedded USB Debugger (EUD) driver
Date: Wed, 5 Sep 2018 13:18:00 +0200
Message-ID: <20180905111800.GA30003@kroah.com>
References: <1536096853-30473-1-git-send-email-pheragu@codeaurora.org>
 <1536096853-30473-3-git-send-email-pheragu@codeaurora.org>
 <c68c466a-576f-43d9-a7dd-7ee8e0ebba3f@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c68c466a-576f-43d9-a7dd-7ee8e0ebba3f@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manu Gautam <mgautam@codeaurora.org>
Cc: Prakruthi Deepak Heragu <pheragu@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, ckadabi@codeaurora.org, tsoni@codeaurora.org, rnayak@codeaurora.org, bryanh@codeaurora.org, psodagud@codeaurora.org, Satya Durga Srinivasu Prabhala <satyap@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 05, 2018 at 03:01:26PM +0530, Manu Gautam wrote:
> Hi,
> 
> 
> On 9/5/2018 3:04 AM, Prakruthi Deepak Heragu wrote:
> > Add support for control peripheral of EUD (Embedded USB Debugger) to
> > listen to events such as USB attach/detach, charger enable/disable, pet
> > EUD to indicate software is functional.
> >
> > Signed-off-by: Satya Durga Srinivasu Prabhala <satyap@codeaurora.org>
> > Signed-off-by: Prakruthi Deepak Heragu <pheragu@codeaurora.org>
> > ---
> >  drivers/soc/qcom/Kconfig  |  12 ++
> >  drivers/soc/qcom/Makefile |   1 +
> >  drivers/soc/qcom/eud.c    | 338 ++++++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 351 insertions(+)
> >  create mode 100644 drivers/soc/qcom/eud.c
> >
> > diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> [snip]
> > +
> > +#define EUD_ENABLE_CMD 1
> > +#define EUD_DISABLE_CMD 0
> 
> Why not use module param as boolean? I mean zero to disable and non-zero to enable?

Never use module parameters on new code, as it's really hard to ever
change them.  It also doesn't work for multiple devices of the same
type.

thanks,

greg k-h
