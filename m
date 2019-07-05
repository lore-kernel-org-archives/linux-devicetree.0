From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v9 2/6] usb:gadget Separated decoding functions from dwc3
 driver.
Date: Fri, 5 Jul 2019 13:49:11 +0200
Message-ID: <20190705114911.GA31190@kroah.com>
References: <1562324238-16655-1-git-send-email-pawell@cadence.com>
 <1562324238-16655-3-git-send-email-pawell@cadence.com>
 <20190705112724.GA4294@kroah.com>
 <BYAPR07MB4709AAF54E7C58B51FC26D20DDF50@BYAPR07MB4709.namprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BYAPR07MB4709AAF54E7C58B51FC26D20DDF50@BYAPR07MB4709.namprd07.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pawel Laszczak <pawell@cadence.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "felipe.balbi@linux.intel.com" <felipe.balbi@linux.intel.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "rogerq@ti.com" <rogerq@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Jayshri Dajiram Pawar <jpawar@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 05, 2019 at 11:39:57AM +0000, Pawel Laszczak wrote:
> 
> >On Fri, Jul 05, 2019 at 11:57:14AM +0100, Pawel Laszczak wrote:
> >> Patch moves some decoding functions from driver/usb/dwc3/debug.h driver
> >> to driver/usb/gadget/debug.c file. These moved functions include:
> >>     dwc3_decode_get_status
> >>     dwc3_decode_set_clear_feature
> >>     dwc3_decode_set_address
> >>     dwc3_decode_get_set_descriptor
> >>     dwc3_decode_get_configuration
> >>     dwc3_decode_set_configuration
> >>     dwc3_decode_get_intf
> >>     dwc3_decode_set_intf
> >>     dwc3_decode_synch_frame
> >>     dwc3_decode_set_sel
> >>     dwc3_decode_set_isoch_delay
> >>     dwc3_decode_ctrl
> >>
> >> These functions are used also in inroduced cdns3 driver.
> >>
> >> All functions prefixes were changed from dwc3 to usb.
> >> Also, function's parameters has been extended according to the name
> >> of fields in standard SETUP packet.
> >> Additionally, patch adds usb_decode_ctrl function to
> >> include/linux/usb/gadget.h file.
> >
> >No it does not :(
> 
> I've forgot about this :( 
> 
> It should be include/linux/usb/ch.9.h
> 
> >
> >> Signed-off-by: Pawel Laszczak <pawell@cadence.com>
> >> ---
> >>  drivers/usb/common/Makefile |   5 +
> >>  drivers/usb/common/debug.c  | 268 ++++++++++++++++++++++++++++++++++++
> >>  drivers/usb/dwc3/debug.h    | 252 ---------------------------------
> >>  drivers/usb/dwc3/trace.h    |   2 +-
> >>  include/linux/usb/ch9.h     |  25 ++++
> >>  5 files changed, 299 insertions(+), 253 deletions(-)
> >>  create mode 100644 drivers/usb/common/debug.c
> >>
> >> diff --git a/drivers/usb/common/Makefile b/drivers/usb/common/Makefile
> >> index 0a7c45e85481..cdc66b59a6f0 100644
> >> --- a/drivers/usb/common/Makefile
> >> +++ b/drivers/usb/common/Makefile
> >> @@ -5,6 +5,11 @@
> >>
> >>  obj-$(CONFIG_USB_COMMON)	  += usb-common.o
> >>  usb-common-y			  += common.o
> >> +
> >> +ifneq ($(CONFIG_TRACING),)
> >> +	usb-common-y		  += debug.o
> >> +endif
> >
> >So only enable this if tracing is not emabled?  Or if enabled?  I'm
> >confused, isn't there an easier way to write this?
> 
> It's checks if CONFIG_TRACING is enable. 
> It's a common way checking if option is enabled in usb subsystem. 

Why not just write this as:
	usb-common-$(CONFIG_TRACING)	+= debug.o
?

thanks,

greg k-h
