From: Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>
Subject: Re: [PATCH 1/7] ARM: dts: qcom: msm8974-honami: Define pinctrl state
 for blsp_uart2
Date: Mon, 30 Nov 2015 12:19:13 -0800
Message-ID: <CAJAp7OjWj2ZGwypXdWbkDVadJePT7PrPSDJ3-89q+oxGdhDHWw@mail.gmail.com>
References: <1445403470-17434-1-git-send-email-bjorn.andersson@sonymobile.com>
	<CAMAWPa9fHWY3diCfZG2s0ZaNqza+SnK+4QZzkAwW8xb9zjOqHg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMAWPa9fHWY3diCfZG2s0ZaNqza+SnK+4QZzkAwW8xb9zjOqHg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 30, 2015 at 11:23 AM, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Tue, Oct 20, 2015 at 9:57 PM, Bjorn Andersson
> <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org> wrote:
>> Make sure the blsp1_uart2 pins are in the correct state for the uart.
>>
>> Signed-off-by: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
>
> kernelci.org has been detecting boot failures on my z1 since
> next-20151120[1] and I finally got around to bisecting, which pointed
> to this patch which is in next in the for of commit 14cd83b824aa ARM:
> dts: qcom: msm8974-honami: Define pinctrl state for blsp_uart2
>
> That commit doesn't revert cleanly on top of next-20151130, but
> manually removing the stuff added in this patch, next-20151130 boots
> fine on the z1.
>
> Kevin
>
> [1] http://kernelci.org/boot/qcom-msm8974-sony-xperia-honami/job/next/kernel/next-20151127/defconfig/multi_v7_defconfig/lab/lab-khilman/?_id=5658061359b5140196b5fd2f

Thanks Kevin,

I did see these too. But at the same time, as far as I can see, the
qcom_defconfig boots just fine - indicating that this particular
commit would not be the cause.

I'll fire up some builds to figure out what's going on.


PS. I believe earlycon would be more helpful than earlyprintk on the
multi platform build command line...

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
