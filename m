From: Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 3/4] dt-binding: remoteproc: venus rproc dt binding
 document
Date: Wed, 24 Aug 2016 18:36:35 +0300
Message-ID: <fbf25a9e-348b-9047-37ef-1b96808dea31@mm-sol.com>
References: <1471622000-1906-1-git-send-email-stanimir.varbanov@linaro.org>
 <1471622000-1906-4-git-send-email-stanimir.varbanov@linaro.org>
 <20160823173259.GA13327@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160823173259.GA13327@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ohad Ben-Cohen <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 08/23/2016 08:32 PM, Rob Herring wrote:
> On Fri, Aug 19, 2016 at 06:53:19PM +0300, Stanimir Varbanov wrote:
>> Add devicetree binding document for Venus remote processor.
>>
>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>>  .../devicetree/bindings/remoteproc/qcom,venus.txt  | 33 ++++++++++++++++++++++
>>  1 file changed, 33 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,venus.txt
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,venus.txt b/Documentation/devicetree/bindings/remoteproc/qcom,venus.txt
>> new file mode 100644
>> index 000000000000..06a2db60fa38
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,venus.txt
>> @@ -0,0 +1,33 @@
>> +Qualcomm Venus Peripheral Image Loader
>> +
>> +This document defines the binding for a component that loads and boots firmware
>> +on the Qualcomm Venus remote processor core.
> 
> This does not make sense to me. Venus is the video encoder/decoder h/w, 
> right? Why is the firmware loader separate from the codec block? Why 
> rproc is used? Are there multiple clients? Naming it rproc_venus implies 
> there aren't. And why does the firmware loading need 8MB of memory at a 
> fixed address?
> 

The firmware for Venus case is 5MB. And here is 8MB because of
dma_alloc_from_coherent size restriction.

The address is not really fixed, cause the firmware could support
relocation. In this example I just picked up the next free memory region
in memory-reserved from msm8916.dtsi.

regards,
Stan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
