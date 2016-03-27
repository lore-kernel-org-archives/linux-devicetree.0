From: okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Subject: Re: [PATCH V15 0/4] dma: add Qualcomm Technologies HIDMA driver
Date: Sun, 27 Mar 2016 09:11:52 -0400
Message-ID: <5ecd8c6d2c59ca7e7eb8a5740a3c35c8@codeaurora.org>
References: <1457732994-11175-1-git-send-email-okaya@codeaurora.org>
 <20160320093926.GM2490@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160320093926.GM2490@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, shankerd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, vikrams-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, eric.auger-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2016-03-20 05:39, Vinod Koul wrote:
> On Fri, Mar 11, 2016 at 04:49:50PM -0500, Sinan Kaya wrote:
>> 
>> Sinan Kaya (4):
>>   dma: qcom_hidma: implement lower level hardware interface
>>   dma: qcom_hidma: add debugfs hooks
>>   dma: qcom_hidma: add support for object hierarchy
>>   dma: qcom_hidma: read the channel id from HW
> 
> Any reason why you insist on using subsystem name as dma even when 
> asked to
> change..


Anything else, I should address?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
