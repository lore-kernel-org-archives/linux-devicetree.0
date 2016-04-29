From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH] scripts/dtc: dt_to_config - report kernel config options
 for a devicetree
Date: Fri, 29 Apr 2016 08:54:12 -0700
Message-ID: <572383A4.2030808@gmail.com>
References: <572284AB.102@gmail.com> <CAL_JsqKGcc_wXV2_-3ZVS7gzfo2ao9z+eATdnKVsyRnW2O5e4A@mail.gmail.com> <CA+rpMbJkWM+bsvXT77eyLGewtKHjX1inc0vjsWxYQTCgzmpDGg@mail.gmail.com> <CAMuHMdUBq7XUTDrWenNy7tsnvLQdp9H5hUmzqUZ2F6wVUQn21g@mail.gmail.com>
Reply-To: frowand.list@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdUBq7XUTDrWenNy7tsnvLQdp9H5hUmzqUZ2F6wVUQn21g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Gaurav Minocha <gaurav.minocha.os@gmail.com>, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel list <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Pavel Machek <pavel@ucw.cz>
List-Id: devicetree@vger.kernel.org

On 4/28/2016 11:44 PM, Geert Uytterhoeven wrote:
> On Fri, Apr 29, 2016 at 8:39 AM, Gaurav Minocha
> <gaurav.minocha.os@gmail.com> wrote:
>> On Thu, Apr 28, 2016 at 3:32 PM, Rob Herring <robh+dt@kernel.org> wrote:
>>> On Thu, Apr 28, 2016 at 4:46 PM, Frank Rowand <frowand.list@gmail.com> wrote:
>>>> From: Frank Rowand <frank.rowand@am.sony.com>
>>>>
>>>> Determining which kernel config options need to be enabled for a
>>>> given devicetree can be a painful process.  Create a new tool to
>>>> find the drivers that may match a devicetree node compatible,
>>>> find the kernel config options that enable the driver, and
>>>> optionally report whether the kernel config option is enabled.
>>>
>>> I would find this more useful to output a config fragment with all the
>>> options enabled. The hard part there is enabling the options a given
>>> option is dependent on which I don't think kbuild takes care of.
>>
>> Do you mean to generate something like .config? If yes, then IMO it would
>> not be a correct configuration file.
> 
> A fragment to be appended to your current .config.
> 
> After that, an additional run of "make oldconfig" should (hopefully) bring
> everything into good shape.

$ scripts/dtc/dt_to_config                          \
     --config=$KBUILD_OUTPUT/.config                \
     arch/arm/boot/dts/qcom-apq8074-dragonboard.dts \
     | grep "^............F"                        \
     | cut -d ":" -f5                               \
     | sed -e 's| $|=y|'                            \
     | sed -e 's| ||g'
CONFIG_ARCH_U300=y
CONFIG_SOC_IMX27=y
CONFIG_SOC_IMX31=y
CONFIG_ARCH_U300=y
CONFIG_SOC_IMX27=y
CONFIG_SOC_IMX31=y
CONFIG_ARM_BIG_LITTLE_CPUIDLE=y
CONFIG_QCOM_SMP2P=y
CONFIG_QCOM_SMP2P=y
CONFIG_QCOM_SMSM=y
CONFIG_QCOM_SPMI_TEMP_ALARM=y
CONFIG_QCOM_SPMI_IADC=y
CONFIG_INPUT_PM8941_PWRKEY=y
CONFIG_QCOM_SPMI_TEMP_ALARM=y
CONFIG_QCOM_SPMI_VADC=y
CONFIG_BACKLIGHT_PM8941_WLED=y


But Gaurav is correct.  The answer is not this easy.  For example, there
may be multiple drivers that match a compatible value.  But only one of
those drivers will be the correct one.  That is just one example, some
cases become are much more complex.

I started writing code to try to score how good each compatible match is
so the best match could be picked.  At the moment, it is 255 lines and
not very functional.  I may continue experimenting with scoring in the
future.

-Frank
