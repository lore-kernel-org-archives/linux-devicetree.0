From: Sricharan R <sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v4 5/6] remoteproc: qcom: Add support for q6v5-wcss pil
Date: Tue, 14 Nov 2017 15:21:09 +0530
Message-ID: <ee5d49fb-f60c-1840-5bd1-80f41e8dcc16@codeaurora.org>
References: <1510238775-14883-1-git-send-email-sricharan@codeaurora.org>
 <1510238775-14883-6-git-send-email-sricharan@codeaurora.org>
 <20171110210808.6sms52m4rrgqnf2r@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171110210808.6sms52m4rrgqnf2r@rob-hp-laptop>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 11/11/2017 2:38 AM, Rob Herring wrote:
> On Thu, Nov 09, 2017 at 08:16:14PM +0530, Sricharan R wrote:
>> IPQ8074 has an integrated Hexagon dsp core q6v5 and a wireless lan
>> (Lithium) IP. An mdt type single image format is used for the
>> firmware. So the mdt_load function can be directly used to load
>> the firmware. Also add the relevant resets required for this core.
>>
>> Signed-off-by: Sricharan R <sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> ---
>>  .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |  7 ++-
> 
> Please add acks when posting new versions.

oops.Really sorry, missed it. will update.

Regards,
 Sricharan

-- 
"QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

---
This email has been checked for viruses by Avast antivirus software.
https://www.avast.com/antivirus

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
