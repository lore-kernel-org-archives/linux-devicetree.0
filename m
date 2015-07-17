From: punnaiah choudary kalluri <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 2/2] dma: Add Xilinx zynqmp dma engine driver support
Date: Fri, 17 Jul 2015 15:15:11 +0530
Message-ID: <CAGnW=BaodbKpngg_ZSYz6-esuMZK6nrc4Q3c34MfaXDMi3Bg2A@mail.gmail.com>
References: <CAHLkNH+VLccurDfxEnwSEbr9YFv8ymZuibci7TW=WPutL7qbAQ@mail.gmail.com>
	<CAGnW=BbUBOzm5V_LP_YcCfJ9X+Yw8qGp6PE2xSM13E=qUXxUsw@mail.gmail.com>
	<20150717030545.GB5086@localhost>
	<CAGnW=BYbBnngujcMuEf3=jvra6DiBmN1xhM9DBPmXoa83xLSJw@mail.gmail.com>
	<20150717090824.GF5086@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150717090824.GF5086@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Punnaiah Choudary <kpc528-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org" <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 17, 2015 at 2:38 PM, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> wrote:
> On Fri, Jul 17, 2015 at 09:54:48AM +0530, punnaiah choudary kalluri wrote:
> your MUA is wrapping lines funny, please fix it
>
>> >> I have explored using the virt-dma to reduce the common list processing, But
>> >> in this driver descriptor processing and cleaning is happening inside
>> >> the tasklet
>> >> context and virt-dma assumes it is happening in interrupt context and using the
>> >> spin locks accordingly. So, added code for the list management in side
>> >> the driver.
>> > And why would it bother you. There is a reson for that, it tries to submit
>> > next txn as soon as possible, which is the right thing
>> We have implemented hw descriptor queuing in tx_submit function, so
>> controller can process descriptors with out interruption. We want to
>> minimize disabling all the interrupts for the purpose of submitting new
>> req or cleaning the descriptors.  Also if we adopt virt-dma, need to
>> override the  tx_submit function So, decided to go with any one cleaner
>> approach.
> okay this doesnt seem right, tx_submit is supposed to submit the descriptor
> to pending queue fo the driver (sw) and then issue pending will push it.
> The is the flow as expected and documented by dmanegine API, please follow
> that

Correct and this is what implemented in the driver. Sorry for the confusion.

What I am trying to say is in tx_submit we will be linking the new
request/descriptor
to the tail descriptor of the pending list so that it becomes a single
request to the hw
and once this request is pushed to Hw in the issue_pending, driver
need not to update
this request to Hw in ISR. Since our controller supports interrupt
accounting, we will
come to know how many requests are processed by the hw in tasklet and free them.

I understand that with virt-dma, list management and descriptor clean
up will be offloaded
but for the above reason i am not using the same.

Regards,
Punnaiah

>
> And to follow you will get a tons of help from vchan
>
> --
> ~Vinod
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
