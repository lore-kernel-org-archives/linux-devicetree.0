From: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/4] soc: qcom: Introduce APCS IPC driver
Date: Wed, 3 May 2017 15:25:20 +0530
Message-ID: <CABb+yY03NHBEui+OtagpTD4bm2yxoahEiciBG99gG2jrVGjpKQ@mail.gmail.com>
References: <20170503052929.17422-1-bjorn.andersson@linaro.org>
 <20170503052929.17422-2-bjorn.andersson@linaro.org> <c9b86ecfa6b84ae994da6c30d2840bbf@SFHDAG7NODE2.st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c9b86ecfa6b84ae994da6c30d2840bbf-GGltqRL9kSEdIAuSVraBWEEOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loic PALLARDY <loic.pallardy-qxv4g6HH51o@public.gmane.org>
Cc: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ohad Ben-Cohen <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Loic, thanks for adding me.

On Wed, May 3, 2017 at 2:58 PM, Loic PALLARDY <loic.pallardy-qxv4g6HH51o@public.gmane.org> wrote:
>
>
>> -----Original Message-----
>> From: linux-remoteproc-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org [mailto:linux-remoteproc-
>> owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org] On Behalf Of Bjorn Andersson
>> Sent: Wednesday, May 03, 2017 7:29 AM
>> To: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>; Rob Herring
>> <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>; Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>; Ohad Ben-
>> Cohen <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>
>> Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
>> devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-
>> remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Subject: [PATCH v3 2/4] soc: qcom: Introduce APCS IPC driver
>>
>> This implements a driver that exposes the IPC bits found in the APCS Global
>> block in various Qualcomm platforms. The bits are used to signal inter-
>> processor communication signals from the application CPU to other masters.
>>
>> The driver implements the "doorbell" binding and could be used as basis for a
>> new Linux framework, if found useful outside Qualcomm.
>>
> Hi Bjorn,
>
> Even if Qualcom APCS IPC is limited, why don't you rely on existing mailbox framework.
> It is there to gather all IPC management under the same interface.
> No need to create a new one from my pov.
> If you don't provide message data, mailbox framework behaves as doorbell.
>
QCOM RPM reinvented the wheel for what mailbox framework already did,
despite my pointing it out =>
http://lkml.iu.edu/hypermail//linux/kernel/1406.2/03918.html

The driver bypassed mailbox framework and was pushed via another tree.
Same is being attempted now, only now it is more expensive to switch
to generic mailbox framework having spent so much time on QCOM
specific implementation of controller and protocol drivers inside
drivers/soc/qcom/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
