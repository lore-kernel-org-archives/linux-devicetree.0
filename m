From: Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 2/2] usb: gadget: Add xilinx usb2 device support
Date: Tue, 19 Aug 2014 12:08:11 +0200
Message-ID: <53F3220B.9070302@zonque.org>
References: <1406020130-20467-1-git-send-email-sbhatta@xilinx.com> <31c3ad1a-370a-4d0d-b392-8e7bb292f6aa@BN1AFFO11FD050.protection.gbl> <53F31F52.8060904@zonque.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53F31F52.8060904-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Subbaraya Sundeep Bhatta <subbaraya.sundeep.bhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, balbi-l0cyMroinI0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, svemula-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, anirudh-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, sbhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/19/2014 11:56 AM, Daniel Mack wrote:
> On 07/22/2014 11:08 AM, Subbaraya Sundeep Bhatta wrote:

>>  drivers/usb/gadget/Kconfig      |   14 +
>>  drivers/usb/gadget/Makefile     |    1 +
>>  drivers/usb/gadget/udc-xilinx.c | 2261 +++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 2276 insertions(+), 0 deletions(-)
>>  create mode 100644 drivers/usb/gadget/udc-xilinx.c
> 
> As your driver has a DT binding, you have to describe it in
> Documentation/devicetree/bindings.

Ah, sorry. I missed patch 1/2 which does that.


Thanks,
Daniel

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
