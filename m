From: vnkgutta@codeaurora.org
Subject: Re: [PATCH v2 3/4] drivers: edac: Add EDAC driver support for QCOM
 SoCs
Date: Fri, 24 Aug 2018 11:38:10 -0700
Message-ID: <ffe2184066ddc9b4be4bf1bafc3497be@codeaurora.org>
References: <1534550915-18230-1-git-send-email-vnkgutta@codeaurora.org>
 <1534550915-18230-4-git-send-email-vnkgutta@codeaurora.org>
 <CAE=gft4vheqe9Yqb3H_gMChUmQqvmBeeWvKWCf_j4sWrFceFiQ@mail.gmail.com>
 <CAE=gft6GTuk+j81J+jTNqD_6VFQym=gb6aJ==cbcg-6odVq3qg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAE=gft6GTuk+j81J+jTNqD_6VFQym=gb6aJ==cbcg-6odVq3qg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Evan Green <evgreen@chromium.org>
Cc: robh@kernel.org, mchehab@kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, tsoni@codeaurora.org, ckadabi@codeaurora.org, rishabhb@codeaurora.org, bp@alien8.de
List-Id: devicetree@vger.kernel.org

On 2018-08-23 16:07, Evan Green wrote:
> On Thu, Aug 23, 2018 at 4:04 PM Evan Green <evgreen@chromium.org> 
> wrote:
>> 
>> On Fri, Aug 17, 2018 at 5:08 PM Venkata Narendra Kumar Gutta
>> <vnkgutta@codeaurora.org> wrote:
>> >
>> > From: Channagoud Kadabi <ckadabi@codeaurora.org>
> 
> Also checkpatch.pl complains a bit about this patch:
> 
>             WARNING: Non-standard signature: Co-developed-by:
>             #14:
>             Co-developed-by: Venkata Narendra Kumar Gutta
> <vnkgutta@codeaurora.org>

This needs to be there as the original author is Channagoud Kadabi
and I'm the one who is modifying and upstreaming this driver.
It was suggested to have this kind of signature from the earlier 
patchset comments.

Can we do anything about this?

> 
>             WARNING: please write a paragraph that describes the
> config symbol fully
>             #63: FILE: drivers/edac/Kconfig:460:
>             +config EDAC_QCOM

This is also, I will check if I can get rid of this by writing more in 
the description.
I don't really understand why do we need a paragraph here.

> 
>             WARNING: DT compatible string "qcom,llcc-edac" appears
> un-documented -- check ./Documentation/devicetree/bindings/
>             #536: FILE: drivers/edac/qcom_edac.c:430:
>             + { .compatible = "qcom,llcc-edac" },

This file is not added in the dt-bindings as there are no properties 
(like reg-names or interrupts) for this driver
and anyway initialized from llcc driver.

Do we still need to have the Documentation in place?

> 
>             total: 0 errors, 3 warnings, 533 lines checked
> 
> -Evan
