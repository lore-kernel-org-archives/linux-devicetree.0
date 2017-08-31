From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [RESEND PATCH v5 1/3] pinctrl: Add sleep related state to
 indicate sleep related configs
Date: Thu, 31 Aug 2017 16:07:01 +0800
Message-ID: <CAMz4kuJqbL3Mao9UCGCvhbZeAnubLNrddz699ywVfZm2scbr3w@mail.gmail.com>
References: <eb7925c9642efb8a1ee5804a9b06f06d9f082089.1500018536.git.baolin.wang@spreadtrum.com>
 <CACRpkdZPeRpBSWFe88NA0NkV_Thiq7FSrwiCSyado7xBhEAhgg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZPeRpBSWFe88NA0NkV_Thiq7FSrwiCSyado7xBhEAhgg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Baolin Wang <baolin.wang@spreadtrum.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 31 August 2017 at 15:16, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Thu, Aug 17, 2017 at 8:50 AM, Baolin Wang <baolin.wang@spreadtrum.com> wrote:
>
>> In some scenarios, we should set some pins as input/output/pullup/pulldown
>> when the specified system goes into deep sleep mode, then when the system
>> goes into deep sleep mode, these pins will be set automatically by hardware.
>>
>> That means some pins are not controlled by any specific driver in the OS, but
>> need to be controlled when entering sleep mode. Thus we introduce one sleep
>> state config into pinconf-generic for users to configure.
>>
>> Signed-off-by: Baolin Wang <baolin.wang@spreadtrum.com>
>> ---
>> Changes since v4:
>>  - Add sleep-hardware-state config to indicate sleep related configs.
>
> No reactions and I can certainly not think of anything better (I even
> suggested this) so patch applied.
>
> Sorry for taking so long to look at this, I've been choked :/

I can understand you are so busy :), thanks for your help.

-- 
Baolin.wang
Best Regards
