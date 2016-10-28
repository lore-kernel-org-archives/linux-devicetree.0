From: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: hi6220: add resets property into dwmmc nodes
Date: Fri, 28 Oct 2016 14:12:56 -0700
Message-ID: <CALAqxLX9_y8CpagsUeorOE4gpR6_i-_G+EZfXNpBxare3VnJCg@mail.gmail.com>
References: <CALAqxLXfb48h8hMQmAaJ+YjA5=pekkQ8Dg8ReL6VTTfmuFRPDw@mail.gmail.com>
 <CAKfTPtAXdkKcfpHmUmQNwuJxO0PORcCf49noST_CCkZPigPwgw@mail.gmail.com>
 <CGME20161028072654epcas4p13cbf983b3e22dd96039ed33a4ac792d5@epcas4p1.samsung.com>
 <20161028072640.GB17266@leoy-linaro> <d7993c1a-5e50-9a33-0900-5c1a79884d3c@samsung.com>
 <20161028073830.GC17266@leoy-linaro> <24930ad4-313f-a4f0-c89a-770238863816@samsung.com>
 <95e22336-0465-f1e1-71b8-548d0e6ee8b7@samsung.com> <20161028101919.GA25564@leoy-linaro>
 <f5dfafbb-39df-4edb-03b8-57c0e34c912f@samsung.com> <20161028123422.GA22734@leoy-linaro>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161028123422.GA22734@leoy-linaro>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Vincent Guittot <vincent.guittot-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Xinliang Liu <xinliang.liu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Fathi Boudra <fathi.boudra-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, LAK <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 28, 2016 at 5:34 AM, Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Fri, Oct 28, 2016 at 08:52:49PM +0900, Jaehoon Chung wrote:
>
> [...]
>
>> >> Could you check the below thing..
>> >>
>> >>         /* find reset controller when exist */
>> >> -       pdata->rstc = devm_reset_control_get_optional(dev, NULL);
>> >> +       pdata->rstc = devm_reset_control_get_optional(dev, "dwmci-reset");
>> >>         if (IS_ERR(pdata->rstc)) {
>> >>                 if (PTR_ERR(pdata->rstc) == -EPROBE_DEFER)
>> >>                         return ERR_PTR(-EPROBE_DEFER);
>> >
>> > Confirmed with this fixing, the kernel can bootup successfully.
>> >
>> > Thanks for this.
>>
>> Thanks for checking this..If this approach is not bad, i will send the patch.
>> Or if there are other good approaches, let me know, plz.
>
> I'd like Guodong and John to confirm for Hikey specific. I have no
> knowledge for this so cannot answer.

No objection from me. I hadn't run into the issue, as I'm not booting
off the sd card.

The patch from Jaehoon doesn't seem to cause trouble in my testing so
far, so I think its worth generating a patch and sending it in for
4.9-rc

thanks
-john
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
