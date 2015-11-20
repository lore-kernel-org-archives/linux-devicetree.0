From: Tim Bird <tim.bird@sonymobile.com>
Subject: Re: [PATCH v2 1/3] Documentation: dt-bindings: add async_irq to
 msm_hsusb
Date: Fri, 20 Nov 2015 14:50:58 -0800
Message-ID: <564FA3D2.5050907@sonymobile.com>
References: <1448059038-6179-1-git-send-email-tim.bird@sonymobile.com>
 <4290863.YBd8t0x8i6@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <4290863.YBd8t0x8i6@wuerfel>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: "Peter.Chen@freescale.com" <Peter.Chen@freescale.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "balbi@ti.com" <balbi@ti.com>, =?UTF-8?Q?Andersson=2c_Bj=c3=b6rn?= <Bjorn.Andersson@sonymobile.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "tbird20d@gmail.com" <tbird20d@gmail.com>
List-Id: devicetree@vger.kernel.org



On 11/20/2015 02:44 PM, Arnd Bergmann wrote:
> On Friday 20 November 2015 14:37:16 Tim Bird wrote:
>> +- interrupt-names: Should contain the following:
>> +  "core_irq"    USB core interrupt
>> +  "async_irq"   Asynchronous interrupt to wake up from low power mode
>> +                (optional)
>>  
>>
> 
> Sorry for the bike-shedding but how about just naming them "core" and "async"?
> 
> The redundant "_irq" postfix seems a little redundant.
OK - look for v3 RSN(tm)  (Real Soon Now)
 -- Tim

P.S. This is a cynical ploy to get me to automate my patch release process, isn't it? :-)
