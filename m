From: "Sugaya, Taichi" <sugaya.taichi@socionext.com>
Subject: Re: [PATCH v2 01/15] dt-bindings: sram: milbeaut: Add binding for
 Milbeaut smp-sram
Date: Tue, 19 Feb 2019 16:38:51 +0900
Message-ID: <0885ddd4-158b-cad9-8aa5-4029676db036@socionext.com>
References: <1549628733-30171-1-git-send-email-sugaya.taichi@socionext.com>
 <20190218194909.GA9552@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190218194909.GA9552@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Takao Orito <orito.takao@socionext.com>, Kazuhiro Kasai <kasai.kazuhiro@socionext.com>, Shinji Kanematsu <kanematsu.shinji@socionext.com>, Jassi Brar <jaswinder.singh@linaro.org>, Masami Hiramatsu <masami.hiramatsu@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 2019/02/19 4:49, Rob Herring wrote:
> On Fri,  8 Feb 2019 21:25:33 +0900, Sugaya Taichi wrote:
>> The Milbeaut M10V SoC needs a part of sram for smp, so this adds the
>> M10V sram compatible and binding.
>>
>> Signed-off-by: Sugaya Taichi <sugaya.taichi@socionext.com>
>> ---
>>   .../devicetree/bindings/sram/milbeaut-smp-sram.txt | 24 ++++++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/sram/milbeaut-smp-sram.txt
>>
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
Thank you!
