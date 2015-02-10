From: zhangfei <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 4/5] usb: phy: load usb phy earlier
Date: Tue, 10 Feb 2015 23:20:23 +0800
Message-ID: <54DA21B7.6090306@linaro.org>
References: <20150210070424.GC32709@shlinux2> <20150210144925.GD16711@saruman.tx.rr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150210144925.GD16711-HgARHv6XitJaoMGHk7MhZQC/G2K4zDHf@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: john.youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, Mian Yousaf Kaukab <yousaf.kaukab-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "dan . zhao" <dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Wangbinghui <wangbinghui-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 02/10/2015 10:49 PM, Felipe Balbi wrote:
> On Tue, Feb 10, 2015 at 03:04:28PM +0800, Peter Chen wrote:
>> This patch does not belong to phy, so, doesn't need to
>> add phy in subject, meanwhile, please add GregKH as TO list,
>> he is the right one to queue this patch.
>>
>> Reply-To:
>> In-Reply-To: <1423554627-694-5-git-send-email-zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>
>> On Tue, Feb 10, 2015 at 03:50:26PM +0800, Zhangfei Gao wrote:
>>> Since phy is definitely used in usb controller, load the phy
>>> earlier to make boot time shorter.
>>>
>>> Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>> Acked-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>
> NAK, make sure there are no such dependencies with your controller
> driver. They should know how to defer probing if their resources aren't
> available yet.

Sorry for the confusion,
There is no dependencies at all, just for optimization.
Peter already told me this patch should not be put here, causing confusion.
And I resend in another thread.

The controller is dwc2, which use defer probe. And dwc2 controller defer 
probe every time even the phy driver in the same folder.
Since we know the calling sequence, we can simply change the sequence to 
load the phy earlier.


However, as you said the new driver will be put in drivers/phy, there 
should be no such issue in the future.
It is OK not using this patch.

Thanks

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
