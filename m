From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [PATCH v2 2/3] gpio: Add Spreadtrum EIC driver support
Date: Fri, 2 Mar 2018 18:48:45 +0800
Message-ID: <CAMz4kuJe=joBCzF=SnGEKZhWZANT5uDycb7OtJ+zy=LM+8PLVw@mail.gmail.com>
References: <334505d3a13a73ad347427b408ed581832434289.1519468782.git.baolin.wang@linaro.org>
 <2e9852f21fcc6213bdb1cef0c473b9d002ad5670.1519468782.git.baolin.wang@linaro.org>
 <CACRpkdY8hcNYASBFJewVfpiukT+AAR-5WZb0uaJws0B025+GJw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdY8hcNYASBFJewVfpiukT+AAR-5WZb0uaJws0B025+GJw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Linus,

On 2 March 2018 at 17:53, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Sat, Feb 24, 2018 at 11:44 AM, Baolin Wang <baolin.wang@linaro.org> wrote:
>
>> The Spreadtrum digital-chip EIC controller has 4 sub-modules: debounce EIC,
>> latch EIC, async EIC and sync EIC, and each sub-module can has multiple
>> banks and each bank contains 8 EICs.
>>
>> Each EIC can only be used as input mode, and has the capability to trigger
>> interrupts when detecting input signals.
>>
>> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
>> ---
>> Changes since v1:
>>  - Add OF_GPIO dependency.
>>  - Fix some typos and grammar issues.
>>  - Simplify the sprd_eic_update() and sprd_eic_read().
>>  - Rename 'sprd_eic_data' to 'sprd_eic_variant_data'.
>>  - Rename sprd_eic_group_base() to sprd_eic_offset_base().
>>  - Split the PMIC EIC support into one separate driver.
>>  - Return -EIO for sprd_eic_direction_input().
>>  - Other optimization.
>
> This is looking nice!
>
> I guess we agreed with the input maintainer that what
> needs to happen is to implement edge trigger emulation
> for all variants in the driver, test it with the keys and
> then we should be done.

I want to send one separate patch to implement edge trigger emulation
for EIC drivers, since we can have some talks for the implementation.
If there are no other issues for this patch set, I will send out the
V3 after fixing the issues in patch 3 pointed by Andy. Is it OK?

-- 
Baolin.wang
Best Regards
