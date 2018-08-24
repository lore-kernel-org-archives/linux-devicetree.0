From: vnkgutta@codeaurora.org
Subject: Re: [PATCH v2 1/4] drivers: soc: Add broadcast base for Last Level
 Cache Controller (LLCC)
Date: Fri, 24 Aug 2018 10:58:19 -0700
Message-ID: <022159d88ada0092f5c24a0881e2375d@codeaurora.org>
References: <1534550915-18230-1-git-send-email-vnkgutta@codeaurora.org>
 <1534550915-18230-2-git-send-email-vnkgutta@codeaurora.org>
 <CAE=gft64sF7APE490guRHo7PS9XsFkPn9-ZKcMB4_wPE5FXONQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAE=gft64sF7APE490guRHo7PS9XsFkPn9-ZKcMB4_wPE5FXONQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Evan Green <evgreen@chromium.org>
Cc: robh@kernel.org, mchehab@kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, tsoni@codeaurora.org, ckadabi@codeaurora.org, rishabhb@codeaurora.org, bp@alien8.de
List-Id: devicetree@vger.kernel.org

On 2018-08-23 16:01, Evan Green wrote:
> On Fri, Aug 17, 2018 at 5:08 PM Venkata Narendra Kumar Gutta
> <vnkgutta@codeaurora.org> wrote:
>> 
>> Currently, boradcast base is set to end of the LLCC banks, which may
> 
> s/boradcast/broadcast/

I'll correct this typo in the next version.

> 
>> not be correct always. As the number of banks may vary for each 
>> chipset
>> and the broadcast base could be at a different address as well. This 
>> info
>> depends on the chipset, so get the broadcast base info from the device
>> tree (DT). Add broadcast base in LLCC driver and use this for 
>> broadcast
>> writes.
>> 
>> Signed-off-by: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
>> ---
>>  drivers/soc/qcom/llcc-slice.c      | 55 
>> +++++++++++++++++++++++---------------
>>  include/linux/soc/qcom/llcc-qcom.h |  4 +--
>>  2 files changed, 35 insertions(+), 24 deletions(-)
>> 
> 
> Reviewed-by: Evan Green <evgreen@chromium.org>
