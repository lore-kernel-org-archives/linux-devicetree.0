From: Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH v5 2/4] mwifiex: add platform specific wakeup interrupt
 support
Date: Wed, 30 Mar 2016 12:50:03 +0000
Message-ID: <9b96089aa29a4202b2ccc8110315c174@SC-EXCH04.marvell.com>
References: <1458299032-31929-1-git-send-email-akarwar@marvell.com>
	<1458299032-31929-2-git-send-email-akarwar@marvell.com>
 <87a8lg5eej.fsf@purkki.adurom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87a8lg5eej.fsf-5ukZ45wKbUHoml4zekdYB16hYfS7NtTn@public.gmane.org>
Content-Language: en-US
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Cathy Luo <cluo-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nishant Sarmukadam <nishants-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Wei-Ning Huang <wnhuang-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Kalle,

> From: Kalle Valo [mailto:kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org]
> Sent: Wednesday, March 30, 2016 6:09 PM
> To: Amitkumar Karwar
> Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Cathy Luo; Nishant Sarmukadam;
> devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Wei-Ning Huang; Xinming Hu
> Subject: Re: [PATCH v5 2/4] mwifiex: add platform specific wakeup
> interrupt support
> 
> Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org> writes:
> 
> > From: Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> >
> > On some arm-based platforms, we need to configure platform specific
> > parameters by device tree node and also define our node as a child
> > node of parent SDIO host controller.
> > This patch parses these parameters from device tree. It includes
> > calibration data dowoload to firmware, wakeup pin configured to
> > firmware, and soc specific wake up gpio, which will be set as wakeup
> interrupt pin.
> >
> > Signed-off-by: Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> > Signed-off-by: Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> 
> I only see patch 2, where are the rest three? Also it's not clear what's
> the plan with this patchset.
> 

Yes. It should have been [PATCH v5 2/2]
I am going to submit v6 shortly which address below comments from Rob Herring.
https://patchwork.kernel.org/patch/8618261/

Regards,
Amitkumar
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
