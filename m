From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH v5 01/44] dt-bindings: clock: Add new bindings for TI
 Davinci PLL clocks
Date: Tue, 16 Jan 2018 10:41:26 -0600
Message-ID: <0cb6058f-3f58-cb76-5769-bee36732fb2c@lechnology.com>
References: <1515377863-20358-1-git-send-email-david@lechnology.com>
 <ba7fa842-cfc5-6f6f-f9bf-09c74ab08ec2@lechnology.com>
 <5aacc350-6236-2e4f-35bb-a681fc9d47e7@ti.com>
 <CAHCN7x+ZYezmEU_0mF=6_gF14DZxKnuDp1Cx=aC2=eN_QLNdJQ@mail.gmail.com>
 <fd162516-cddc-e857-ce60-2cd89303971e@lechnology.com>
 <CAHCN7xKORFriQ2Gjx85OsCUzHO-mavCQXLOzh5D3n4kEG=i-Yg@mail.gmail.com>
 <40501635-6f5b-20c9-f8bc-d17e26b58426@lechnology.com>
 <CAHCN7xL=h_g6HK2ey82r_w5qRbXg9+68Og+84YUYuePsjYd-Vg@mail.gmail.com>
 <f20267f2-be4c-e031-1c5f-76490164c60d@lechnology.com>
 <CAHCN7x+G5pxOeD7TahqiQUePEu1Z4Hyinkjq_bcSM+Hz36xoSg@mail.gmail.com>
 <a79184c5-3e28-bbac-0783-992615d49fae@lechnology.com>
 <CAHCN7x+EtQs6NHAYbVga7vU1U+qQLqOxdf+1MW6HewaT+ZF_Xg@mail.gmail.com>
 <5832fd62-16aa-e167-7e52-2ce493e33cdc@lechnology.com>
 <CAHCN7xKV+Rwep3WiY2aS49iLu+oiZmjtUN2QK+E=hVkqdSPwhw@mail.gmail.com>
 <8184c7b5-5f82-5590-9caf-fd038e1d07ac@ti.com>
 <CAHCN7x+zowPn-c7X37=r2V96zVfFj3WGBO4cS5w-R6VGU=FUqw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHCN7x+zowPn-c7X37=r2V96zVfFj3WGBO4cS5w-R6VGU=FUqw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Adam Ford <aford173@gmail.com>, Sekhar Nori <nsekhar@ti.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@kernel.org>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 01/16/2018 06:21 AM, Adam Ford wrote:
> On Tue, Jan 16, 2018 at 5:22 AM, Sekhar Nori <nsekhar@ti.com> wrote:
>> Hi Adam, David,
>>
>> On Friday 12 January 2018 03:04 AM, Adam Ford wrote:
>>> Thanks for clarifying.  I was able to make it work with the following patch:
>>>
>>> diff --git a/drivers/clk/davinci/psc-da850.c b/drivers/clk/davinci/psc-da850.c
>>> index 3b4583d..a76b8682 100644
>>> --- a/drivers/clk/davinci/psc-da850.c
>>> +++ b/drivers/clk/davinci/psc-da850.c
>>> @@ -25,7 +25,7 @@ static const struct davinci_psc_clk_info
>>> da850_psc0_info[] __initconst = {
>>>          LPSC(9, 0, uart0, pll0_sysclk2, 0),
>>>          LPSC(13, 0, pruss, pll0_sysclk2, 0),
>>>          LPSC(14, 0, arm, pll0_sysclk6, LPSC_ALWAYS_ENABLED),
>>> -       LPSC(15, 1, dsp, pll0_sysclk1, LPSC_FORCE | LPSC_LOCAL_RESET),
>>> +       LPSC(15, 1, dsp, pll0_sysclk1, LPSC_FORCE | LPSC_LOCAL_RESET |
>>> LPSC_ALWAYS_ENABLED),
>>
>> Keeping the DSP clock always enabled was not needed earlier AFAICS, so
>> this needs to be investigated.
> 
> I was testing the DA850-evm and found it was required or the DA850
> wouldn't boot.  I don't know enough of why to explain it.  I went
> through all the clocks as suggested by David, and this one-line patch
> fixed the hanging problem I had.  Without it the AM1808 board I have
> won't boot.

That's interesting because 1) the AM1808 does not have a DSP and 2) I
am using an AM1808 based system as well that boots without having this
always enabled (AM1808BZWT4 to be exact).

I guess I will leave this change out of the next revision so that we
don't forget that this needs to be addressed. Sekhar found a bug in
the new PSC driver with the LPSC_FORCE bit, so maybe that could be
the difference.

Adam, before the changes in this series, did you have
CONFIG_DAVINCI_RESET_CLOCKS=y in your config?
