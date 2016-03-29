From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 10/12] ARM: dts: dragonboard-600c: Add on board leds
 support
Date: Tue, 29 Mar 2016 14:30:03 +0100
Message-ID: <56FA835B.3080909@linaro.org>
References: <1458762366-9233-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1458762484-9768-1-git-send-email-srinivas.kandagatla@linaro.org>
 <CAP71WjzdDRqtS4oJu_m_Y9kuZ4QprYnqMHop=5a6Vc6yypakhA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <CAP71WjzdDRqtS4oJu_m_Y9kuZ4QprYnqMHop=5a6Vc6yypakhA@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Thanks Nico,

On 24/03/16 16:51, Nicolas Dechesne wrote:
> On Wed, Mar 23, 2016 at 8:48 PM, Srinivas Kandagatla
> <srinivas.kandagatla@linaro.org> wrote:
>> +                       led@1 {
>> +                               label = "dragonboard-600c:green:user1";
>> +                               gpios = <&tlmm_pinmux 3 GPIO_ACTIVE_HIGH>;
>> +                               linux,default-trigger = "heartbeat";
>> +                               default-state = "off";
>> +                       };
>> +
>> +                       led@2 {
>> +                               label = "dragonboard-600c:green:user2";
>> +                               gpios = <&tlmm_pinmux 7 GPIO_ACTIVE_HIGH>;
>> +                               linux,default-trigger = "mmc0";
>> +                               default-state = "off";
>> +                       };
>> +
>> +                       led@3 {
>> +                               label = "dragonboard-600c:green:user3";
>> +                               gpios = <&tlmm_pinmux 10 GPIO_ACTIVE_HIGH>;
>> +                               linux,default-trigger = "mmc1";
>> +                               default-state = "off";
>> +                       };
>> +
>> +                       led@4 {
>> +                               label = "apq8016-sbc:green:user4";
>
> typo ^^
>
Yep, Will fix this.
>> +                               gpios = <&tlmm_pinmux 11 GPIO_ACTIVE_HIGH>;
>> +                               linux,default-trigger = "none";
>> +                               default-state = "off";
>> +                       };
>
> also, if i read the 96boards specs correctly, the LED are labeled
> 3-2-1-0 , if you look at the board with the LEDs on the bottom. With
> this DT config, you end up with 0-1-2-3 instead.
>
> also, they should be labeled 0 to 3, not 1 to 4.

I agree Will fix it. The structure was copied from the 8016.

Its strange that DB410c LEDS labels on the board are from 1 to 4 rather 
than 0 to 3, on the other hand DB600c does not have any labels as such.

For Now I can change DB600c to start with 0 rather than 1.


>
