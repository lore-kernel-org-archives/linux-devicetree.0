From: "Sugaya, Taichi" <sugaya.taichi@socionext.com>
Subject: Re: [PATCH v2 03/15] dt-bindings: Add documentation for Milbeaut SoCs
Date: Tue, 19 Feb 2019 17:18:55 +0900
Message-ID: <e28fd693-8ec9-3e89-7f98-62661c80e42b@socionext.com>
References: <1549628764-30587-1-git-send-email-sugaya.taichi@socionext.com>
 <CAK7LNARTX4_phfcXRXUKGp_V0k_q_RKjL6A3Kz=Hxyqj6VXW+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK7LNARTX4_phfcXRXUKGp_V0k_q_RKjL6A3Kz=Hxyqj6VXW+Q@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: DTML <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Takao Orito <orito.takao@socionext.com>, Kazuhiro Kasai <kasai.kazuhiro@socionext.com>, Shinji Kanematsu <kanematsu.shinji@socionext.com>, Jassi Brar <jaswinder.singh@linaro.org>, Masami Hiramatsu <masami.hiramatsu@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 2019/02/19 10:25, Masahiro Yamada wrote:
> On Fri, Feb 8, 2019 at 9:26 PM Sugaya Taichi
> <sugaya.taichi@socionext.com> wrote:
>>
>> This adds a DT binding documentation for the M10V and its evaluation
>> board.
>>
>> Signed-off-by: Sugaya Taichi <sugaya.taichi@socionext.com>
>> ---
>>   Documentation/devicetree/bindings/arm/milbeaut.txt | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/arm/milbeaut.txt
>>
>> diff --git a/Documentation/devicetree/bindings/arm/milbeaut.txt b/Documentation/devicetree/bindings/arm/milbeaut.txt
> 
> 
> 
> I added uniphier SoC/board binding into
> 
> Documentation/devicetree/bindings/arm/socionext/uniphier.txt
> 
> 
> You can milbeaut.txt to the socionext directory as well.
> 

Thank you for informing. I found the directory there.
I will add the "milbeaut.txt(yaml)" there.

Thanks,
Sugaya Taichi

> 
> 
> 
>> new file mode 100644
>> index 0000000..9fd053a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/milbeaut.txt
>> @@ -0,0 +1,6 @@
>> +Milbeaut platforms device tree bindings
>> +---------------------------------------
>> +
>> +- Milbeaut M10V Evaluation Board
>> +    Required root node properties:
>> +      - compatible = "socionext,milbeaut-m10v-evb", "socionext,sc2000a";
>> --
>> 1.9.1
>>
> 
> 
