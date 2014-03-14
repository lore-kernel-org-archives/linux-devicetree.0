From: Maxime Coquelin <maxime.coquelin@st.com>
Subject: Re: [PATCH v4 4/6] pinctrl: st: Use ARRAY_SIZE instead of raw value
 for number of delays
Date: Fri, 14 Mar 2014 10:44:39 +0100
Message-ID: <5322CF87.5000301@st.com>
References: <1394614210-15698-1-git-send-email-maxime.coquelin@st.com>	<1394614210-15698-5-git-send-email-maxime.coquelin@st.com>	<1394634313.28839.57.camel@joe-AO722> <CACRpkda0Z15zC=d8xe+KyHqgmTCHbnUjL14fBmtscpR-2kHtFQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CACRpkda0Z15zC=d8xe+KyHqgmTCHbnUjL14fBmtscpR-2kHtFQ@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Joe Perches <joe@perches.com>
Cc: Rob Landley <rob@landley.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Srinivas Kandagatla <srinivas.kandagatla@st.com>, Stuart Menefy <stuart.menefy@st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, kernel@stlinux.com, Lee Jones <lee.jones@linaro.org>
List-Id: devicetree@vger.kernel.org



On 03/14/2014 10:20 AM, Linus Walleij wrote:
> On Wed, Mar 12, 2014 at 3:25 PM, Joe Perches <joe@perches.com> wrote:
>> On Wed, 2014-03-12 at 09:50 +0100, Maxime COQUELIN wrote:
>>> This patch replaces the raw values with ARRAY_SIZE for assigning the
>>> ninput_delays and noutput_delays fields of STiH416's st_pctl_data struct.
>>
>> trivial note:
>>
>>> diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
>> []
>>> @@ -384,9 +384,9 @@ static unsigned int stih416_delays[] = {0, 300, 500, 750, 1000, 1250, 1500,
>>>   static const struct st_pctl_data  stih416_data = {
>>>        .rt_style       = st_retime_style_dedicated,
>>>        .input_delays   = stih416_delays,
>>> -     .ninput_delays  = 14,
>>> +     .ninput_delays  = ARRAY_SIZE(stih416_delays),
>>>        .output_delays  = stih416_delays,
>>> -     .noutput_delays = 14,
>>> +     .noutput_delays = ARRAY_SIZE(stih416_delays),
>>>        .alt = 0, .oe = 40, .pu = 50, .od = 60, .rt = 100,
>>>   };
>>>
>>
>> drivers/pinctrl/pinctrl-st.c-   unsigned int    *input_delays;
>> drivers/pinctrl/pinctrl-st.c-   unsigned int    *output_delays;
>>
>> It may be better to change these to const unsigned int *
>> and change
>>
>> static unsigned int stih416_delays[] = {
>>
>> to static const
>
> Good point. Patches accepted :-)

Sorry Joe, I forgot to reply.

I added this to my todo list.
I will provide the change before end of next week.

Thanks,
Maxime

>
> Yours,
> Linus Walleij
>
