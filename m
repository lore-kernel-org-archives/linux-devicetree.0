From: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] usb: dwc2: add support of hi6220
Date: Fri, 20 Nov 2015 04:58:03 +0000
Message-ID: <2B3535C5ECE8B5419E3ECBE30077290901DC3D9462@US01WEMBX2.internal.synopsys.com>
References: <1447832387-27549-1-git-send-email-zhangfei.gao@linaro.org>
 <87ziy9erpi.fsf@saruman.tx.rr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "john.youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org" <john.youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/19/2015 11:04 AM, Felipe Balbi wrote:
> 
> Hi,
> 
> Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> writes:
>> Support hisilicon,hi6220-usb for HiKey board
>>
>> Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> doesn't apply:
> 
> Applying: usb: dwc2: add support of hi6220
> error: drivers/usb/dwc2/platform.c: does not match index
> Patch failed at 0001 usb: dwc2: add support of hi6220
> The copy of the patch that failed is found in: workspace/linux/.git/rebase-apply/patch
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
> 
> Care to rebase on my testing/next and also collect John's and Rob's ack ?
> 


That's weird. I just sync'd to your testing/next and it seems to
apply fine.

Same with the series from Gregory Herrero.

Any chance it's something to do with your local repo?

Regards,
John

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
