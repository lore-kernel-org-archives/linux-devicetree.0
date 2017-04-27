From: Jose Abreu <Jose.Abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [RESEND PATCH 1/2] arc: axs10x: Add DT bindings for I2S audio
 playback
Date: Thu, 27 Apr 2017 19:42:46 +0100
Message-ID: <f1e3621d-3dbd-116d-d9c1-3aeb9bd40c2a@synopsys.com>
References: <7ed6deaf1ae6d5819364c793835aa30316077a7e.1487787376.git.joabreu@synopsys.com>
 <77599cf5-33e5-2ecd-2b2a-43630195a3b8@synopsys.com>
 <c02ea9db-db90-1b2e-1baf-f2940e64201f@synopsys.com>
 <ae3f1150-f8da-9a34-d929-6964f91c06ae@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <ae3f1150-f8da-9a34-d929-6964f91c06ae-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vineet Gupta <Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: Carlos Palminha <CARLOS.PALMINHA-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Alexey Brodkin <Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Vineet,


On 27-04-2017 00:31, Vineet Gupta wrote:
> On 04/26/2017 01:55 AM, Jose Abreu wrote:
>> Hi Vineet,
>>
>>
>> On 24-04-2017 18:36, Vineet Gupta wrote:
>>> On 04/21/2017 03:15 AM, Jose Abreu wrote:
>>>> This patch adds the necessary DT bindings to get HDMI audio
>>>> output in ARC AXS10x SDP. The bindings for I2S controller were
>>>> added as well as the bindings for simple audio card.
>>> Are these waiting on Rob or is it OK for me to pick these up for 4.12 ?
>> Yes, I was waiting for Rob ack but he has been silent. It would
>> be nice if these went for 4.12.
> Ok lets wait another couple of days before I pick those up.
> In the mean time, can you please restest the series against 4.11-rcX and report
> here that patches are still valid and do as intended !

I tested based on drm-next of today (which is based on 4.11-rc7)
and the patches work okay.

Best regards,
Jose Miguel Abreu

>
> Thx,
> -Vineet

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
