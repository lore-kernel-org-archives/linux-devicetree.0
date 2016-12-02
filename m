From: zhangfei <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [resend v2: PATCH 1/2] dt-bindings: Document the hi3660 reset
 bindings
Date: Fri, 2 Dec 2016 08:21:33 +0800
Message-ID: <e15e76e2-b32d-a4d0-eb8b-850626a3946a@linaro.org>
References: <1480553321-17400-1-git-send-email-zhangfei.gao@linaro.org>
 <1480553321-17400-2-git-send-email-zhangfei.gao@linaro.org>
 <3900806.3NUubBDb0Q@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3900806.3NUubBDb0Q@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi, Arnd

On 2016年12月01日 20:05, Arnd Bergmann wrote:
> On Thursday, December 1, 2016 8:48:40 AM CET Zhangfei Gao wrote:
>> +               hisi,reset-bits = <0x20 0x8             /* 0: i2c0 */
>> +                                  0x20 0x10            /* 1: i2c1 */
>> +                                  0x20 0x20            /* 2: i2c2 */
>> +                                  0x20 0x8000000>;     /* 3: i2c6 */
>> +       };
>> +
>> +Specifying reset lines connected to IP modules
>> +==============================================
>> +example:
>> +
>> +        i2c0: i2c@..... {
>> +                ...
>> +               resets = <&iomcu_rst 0>;
>> +                ...
>> +        };
> I don't really like this approach, since now the information is
> in two places. Why not put the data into the reset specifier
> directly when it is used?
Any example, still not understand.
They are consumer and provider.
>
> Also the format seems a little too close to the actual register
> layout and could be a little more abstract, using bit numbers instead
> of a bitmask and register numbers instead of offsets.
We use bit numbers first.
But in the developing process, we found several bits may be required for 
one driver.
And they may not be continuous as the bits may already be occupied.
Directly using offset, we can set several bits together for simple, to 
give more flexibility.
So after discussion, we directly use offset.

Thanks
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
