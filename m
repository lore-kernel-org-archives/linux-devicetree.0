From: Alex Elder <elder@ieee.org>
Subject: Re: [PATCH v2 02/17] dt-bindings: soc: qcom: add IPA bindings
Date: Mon, 10 Jun 2019 21:11:38 -0500
Message-ID: <bcb7f599-3c22-da27-c92b-4c1903a5ea06@ieee.org>
References: <20190531035348.7194-1-elder@linaro.org>
 <20190531035348.7194-3-elder@linaro.org>
 <CAL_JsqLFk3=YN+V=RVxq9xWQTrPA9_0zW+eFrdXkGkCnM_sBkA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqLFk3=YN+V=RVxq9xWQTrPA9_0zW+eFrdXkGkCnM_sBkA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Alex Elder <elder@linaro.org>
Cc: David Miller <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <bjorn.andersson@linaro.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Evan Green <evgreen@chromium.org>, Ben Chan <benchan@google.com>, Eric Caruso <ejcaruso@google.com>, cpratapa@codeaurora.org, syadagir@codeaurora.org, subashab@codeaurora.org, abhishek.esse@gmail.com, netdev <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 6/10/19 5:08 PM, Rob Herring wrote:
> On Thu, May 30, 2019 at 9:53 PM Alex Elder <elder@linaro.org> wrote:
>>
>> Add the binding definitions for the "qcom,ipa" device tree node.
>>
>> Signed-off-by: Alex Elder <elder@linaro.org>
>> ---
>>  .../devicetree/bindings/net/qcom,ipa.yaml     | 180 ++++++++++++++++++
>>  1 file changed, 180 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/net/qcom,ipa.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
>> new file mode 100644
>> index 000000000000..0037fc278a61
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
>> @@ -0,0 +1,180 @@
>> +# SPDX-License-Identifier: GPL-2.0
> 
> New bindings are preferred to be dual GPL-2.0 and BSD-2-Clause. But
> that's really a decision for the submitter.

Thanks Rob.  I'll ask Qualcomm if there's any problem
with doing that; I presume not.  If I re-submit this
with dual copyright, I will include your Reviewed-by
despite the change, OK?

					-Alex

> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
