From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 2/3] dmaeninge: xilinx_dma: Fix bug in multiple frame
 stores scenario in vdma
Date: Thu, 5 Jan 2017 10:39:01 -0600
Message-ID: <CAL_JsqKFF2g7_y6kS_A33wDQE3Sw5mJdoUj8wGaX5ZbQ6pK_zQ@mail.gmail.com>
References: <1483536954-27203-1-git-send-email-appanad@xilinx.com>
 <1483536954-27203-3-git-send-email-appanad@xilinx.com> <20170104152613.hhdptwsyg73ev3dz@rob-hp-laptop>
 <C246CAC1457055469EF09E3A7AC4E11A4A660958@XAP-PVEXMBX01.xlnx.xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <C246CAC1457055469EF09E3A7AC4E11A4A660958-4lKfpRxZ5enZMOc0yg5rMog+Gb3gawCHQz34XiSyOiE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Appana Durga Kedareswara Rao <appana.durga.rao-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org" <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Soren Brinkmann <sorenb-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org" <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, "laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org" <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, "luis-HiykPkW1eAzzDCI4PIEvbQC/G2K4zDHf@public.gmane.org" <luis-HiykPkW1eAzzDCI4PIEvbQC/G2K4zDHf@public.gmane.org>, "Jose.Abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org" <Jose.Abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 4, 2017 at 11:00 AM, Appana Durga Kedareswara Rao
<appana.durga.rao-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> Hi Rob,
>
>         Thanks for the review....
>
>> On Wed, Jan 04, 2017 at 07:05:53PM +0530, Kedareswara rao Appana wrote:
>> > When VDMA is configured for more than one frame in the h/w for example
>> > h/w is configured for n number of frames and user Submits n number of
>> > frames and triggered the DMA using issue_pending API.
>> > In the current driver flow we are submitting one frame at a time but
>> > we should submit all the n number of frames at one time as the h/w Is
>> > configured for n number of frames.
>>
>> Please fix run-on sentences, capitalization, and word wrapping.
>
> Sure will fix in the next version....
>
> [Snip]
> -- a/Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt
>> > +++ b/Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt
>> > @@ -66,6 +66,8 @@ Optional child node properties:
>> >  Optional child node properties for VDMA:
>> >  - xlnx,genlock-mode: Tells Genlock synchronization is
>> >     enabled/disabled in hardware.
>> > +- xlnx,fstore-config: Tells Whether Frame Store Configuration is
>> > +   enabled/disabled in hardware.
>>
>> What's the default (when not present)? That should be the most common case.
>> Looks like the code treats this as bool, but that's not clear here. The name is not
>> clear what it is doing. Enabling or disabling the feature?
>
> Default value is zero...
> When this property is present it tells hardware is configured for frame store configuration.

So most people will not want "frame store configuration"?

> Will fix the explanation part in the next version like below.
>  xlnx,fstore-config: Tells hardware is configured for frame store configuration.
> Is the above explanation clear???

No, I mean make it obvious from the name of the property:
xlnx,fstore-config-enable or xlnx,fstore-enable

And the description needs to say it is boolean.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
