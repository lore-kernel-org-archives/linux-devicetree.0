From: Loic Poulain <loic.poulain@linaro.org>
Subject: Re: [PATCH v2] wcn36xx: Disable 5GHz for wcn3610
Date: Thu, 29 Mar 2018 09:40:33 +0200
Message-ID: <CAMZdPi8mS92ACrZOmfnni7bnCKkU5x-Z26QKcu_-J9xYuCjq1w@mail.gmail.com>
References: <20180329065818.9338-1-rfried@codeaurora.org> <874lkzmjxu.fsf@kamboji.qca.qualcomm.com>
 <2d978343-2057-8424-a249-83a0394da5a7@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2d978343-2057-8424-a249-83a0394da5a7@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ramon Fried <rfried@codeaurora.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, wcn36xx@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Ramon,

On 29 March 2018 at 09:32, Ramon Fried <rfried@codeaurora.org> wrote:

>> Should we document qcom,wcn3610 just like wcn3620 is:
>>
>> Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt:                    "qcom,wcn3620",
> IMHO the mentioned bindings is related to the PIL (peripheral image loaded) which is just the firmware part and has
> nothing to do with wifi frontend(IRIS).
>

It seems that the RF is a subnode of the PIL node:

"= SUBNODES
A required subnode of the WCNSS PIL is used to describe the attached rf module
and its resource dependencies. It is described by the following properties:"

So we should add qcom,wcn3610 to the exiting list of 'compatible' rf modules.

Regards,
Loic
