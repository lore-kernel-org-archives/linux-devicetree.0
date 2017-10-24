From: Chen Yu <chenyu56-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC 2/3] USB: dwc3: Modify dwc3 code for support usb of Hikey960
Date: Tue, 24 Oct 2017 18:41:02 +0800
Message-ID: <3afa825f-f851-e7df-bfa0-db5daa5d31fd@huawei.com>
References: <20171024060610.10712-1-chenyu56@huawei.com>
 <20171024060610.10712-3-chenyu56@huawei.com> <87a80hgdgf.fsf@linux.intel.com>
 <bbf80ebf-13c6-b589-6b38-6b09ce4119bb@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bbf80ebf-13c6-b589-6b38-6b09ce4119bb-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: wangbinghui 00388012 <wangbinghui-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org


Hi, Felipe


 On 2017/10/24 16:25, Felipe Balbi wrote:
> Hi,
>
> Yu Chen <chenyu56-hv44wF8Li93QT0dZR+AlfA@public.gmane.org> writes:
>> > The usb controller of Kirin960 is DesignWare Cores SuperSpeed USB 3.0 Controller.
>> > The patch modifies dwc3 for support Kirin960 and adds codes for a USB Hub on board Hikey960.
>> >
>> > Signed-off-by: Yu Chen 
> <chenyu56-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> > Signed-off-by: Ning Fan <fanning4-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
> > Signed-off-by: Di Yang <yangdi10-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
> > Signed-off-by: Rui Li <lirui39-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
> I think Linaro, recently, added support for chargers to mainline. You
> should use what they did.
>
> I'm gonna stop here. There's no way I'm going through this much code in
> a single patch. Specially since 90% of it is either completely
> unnecessary or should be done using already-existing generic APIs.
>
> Sorry, no cookie today.

 Thanks a lot for your comments!
 These codes have been tested on Hikey960 board and work well. But indeed the codes can be simplified and
 made comply with already-existing architecture.
 We will work on these codes according to your reviews and make parted patch next time.

 Thanks,
 Yu Chen

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
