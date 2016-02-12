From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH V2] regulator: max8973: add support for junction thermal warning
Date: Fri, 12 Feb 2016 08:04:17 -0600
Message-ID: <CAL_JsqJZM1CMCUOABiYo7CgL_uagjsFc+wOfv9Je5WsDyTX9GA@mail.gmail.com>
References: <1452096440-6476-1-git-send-email-ldewangan@nvidia.com>
 <CAL_JsqL1=WjdsXHNyKWxfAoe+8_4GjNzuKMKHpArR_ypppJ0Tw@mail.gmail.com> <56BDDEBB.8060105@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56BDDEBB.8060105@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Mark Brown <broonie@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 12, 2016 at 7:31 AM, Laxman Dewangan <ldewangan@nvidia.com> wrote:
>
> On Friday 12 February 2016 07:06 PM, Rob Herring wrote:
>>
>> On Wed, Jan 6, 2016 at 10:07 AM, Laxman Dewangan <ldewangan@nvidia.com>
>> wrote:
>>
>>   Enhanced transient response (ETR) will affect the configuration of
>> CKADV.
>> +-maxim,junction-temp-warning: Junction temp warning on which device
>> generates
>> +               warning interrupts. This is in millicelcius.
>> Please append units: maxim,junction-temp-warning-millicelsius or
>> perhaps maxim,junction-warn-millicelsius to shorten it a bit.
>
> This is very generic which is there on most of PMIC devices from Maxim,  TI
> etc.
> So can we make it generic i.e. do not prefix with vendor name like
> "junction-warn-millicelsius"?

I've got no problem with that.

Rob
