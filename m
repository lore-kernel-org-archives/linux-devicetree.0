From: Thierry Escande <thierry.escande@linaro.org>
Subject: Re: [RFC PATCH 6/6] char: fastrpc: Add support for compat ioctls
Date: Fri, 30 Nov 2018 14:20:56 +0100
Message-ID: <2dbd06c5-d094-6d16-2983-131d3ae24c8d@linaro.org>
References: <20181130104657.14875-1-srinivas.kandagatla@linaro.org>
 <20181130104657.14875-7-srinivas.kandagatla@linaro.org>
 <CAK8P3a1XaGHu3NrAeLn0OEg0nL1uae_MyrP7EgadJpfeeXtR2Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a1XaGHu3NrAeLn0OEg0nL1uae_MyrP7EgadJpfeeXtR2Q@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, gregkh <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm@vger.kernel.org, bkumar@qti.qualcomm.com
List-Id: devicetree@vger.kernel.org

Hi Arnd,

On 30/11/2018 13:58, Arnd Bergmann wrote:
> On Fri, Nov 30, 2018 at 11:48 AM Srinivas Kandagatla
> <srinivas.kandagatla@linaro.org> wrote:
>>
>> From: Thierry Escande <thierry.escande@linaro.org>
>>
>> This patch adds support for compat ioctl from 32 bits userland to
>> Qualcomm fastrpc driver.
>>
>> Supported ioctls in this change are INIT, INVOKE, and ALLOC/FREE_DMA.
>>
>> Most of the work is derived from various downstream Qualcomm kernels.
>> Credits to various Qualcomm authors who have contributed to this code.
>> Specially Tharun Kumar Merugu <mtharu@codeaurora.org>
>>
>> Signed-off-by: Thierry Escande <thierry.escande@linaro.org>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> Can't you just define the native ioctls so that you don't need this.

There are long time defined structures that are passed as argument to 
these ioctls and their sizes vary between 32 and 64 bits userlands, so 
the ioctl command values.

Unless I'm missing something here this also has the advantage not to be 
compiled if CONFIG_COMPAT is not set.

Regards,
Thierry
