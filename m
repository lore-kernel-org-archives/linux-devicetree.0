From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH RFC 1/5] drm/msm/hdmi: deprecate non standard gpio properties.
Date: Mon, 10 Aug 2015 17:07:57 -0500
Message-ID: <CAL_JsqK6=bmbU-OD7L-Xzg6C+AtNFZZJq-LK3UWXE0rza7-gwA@mail.gmail.com>
References: <1439207923-30812-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1439207962-30860-1-git-send-email-srinivas.kandagatla@linaro.org> <20150810124510.GC1262@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20150810124510.GC1262@ulmo.nvidia.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, dri-devel <dri-devel@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>, David Airlie <airlied@linux.ie>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 10, 2015 at 7:45 AM, Thierry Reding
<thierry.reding@gmail.com> wrote:
> On Mon, Aug 10, 2015 at 12:59:22PM +0100, Srinivas Kandagatla wrote:
>> This patch updates the bindings to discourage the usage of non standard
>> gpio properites, this will help in projects focused on upstreaming.
>
> That last part is an odd comment to make in the commit message of a
> patch submitted upstream...
>
>> These deprecated properties are still supported but will be remove over
>> the time.
>
> You can't ever remove them because you can't ever be sure that people
> won't be using an old DTB.

It is only an ABI if anyone notices...

>
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>  Documentation/devicetree/bindings/drm/msm/hdmi.txt | 22 +++++++++++++++++-----
>>  1 file changed, 17 insertions(+), 5 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/drm/msm/hdmi.txt b/Documentation/devicetree/bindings/drm/msm/hdmi.txt
>> index c43aa53..acba581 100644
>> --- a/Documentation/devicetree/bindings/drm/msm/hdmi.txt
>> +++ b/Documentation/devicetree/bindings/drm/msm/hdmi.txt
>> @@ -11,15 +11,27 @@ Required properties:
>>  - interrupts: The interrupt signal from the hdmi block.
>>  - clocks: device clocks
>>    See ../clocks/clock-bindings.txt for details.
>> -- qcom,hdmi-tx-ddc-clk-gpio: ddc clk pin
>> -- qcom,hdmi-tx-ddc-data-gpio: ddc data pin
>> -- qcom,hdmi-tx-hpd-gpio: hpd pin
>> +- qcom,hdmi-tx-ddc-clk-gpios: ddc clk pin
>> +- qcom,hdmi-tx-ddc-data-gpios: ddc data pin

The driver doesn't appear to do anything other than set these gpios
high. Presumably you would ultimately do a bit-bang i2c bus for these?
At that point, aren't you going to want to use the i2c-gpio binding?

I think this binding has bigger issues like why is it not using the
hdmi-connector binding which has a standard "hpd-gpios" property
already. I can't really single out this binding though. There's a lot
of crap when it comes to DRM related bindings.

>> +- qcom,hdmi-tx-hpd-gpios: hpd pin
>>  - core-vdda-supply: phandle to supply regulator
>>  - hdmi-mux-supply: phandle to mux regulator
>>
>> +- qcom,hdmi-tx-ddc-clk-gpio: (deprecated) use
>> +     "qcom,hdmi-tx-ddc-clk-gpios" instead
>> +- qcom,hdmi-tx-ddc-data-gpio: (deprecated) use
>> +     "qcom,hdmi-tx-ddc-data-gpios" instead
>> +- qcom,hdmi-tx-hpd-gpio: (deprecated) use
>> +     "qcom,hdmi-tx-hpd-gpios" instead
>> +
>>  Optional properties:
>> -- qcom,hdmi-tx-mux-en-gpio: hdmi mux enable pin
>> -- qcom,hdmi-tx-mux-sel-gpio: hdmi mux select pin
>> +- qcom,hdmi-tx-mux-en-gpios: hdmi mux enable pin
>> +- qcom,hdmi-tx-mux-sel-gpios: hdmi mux select pin
>> +
>> +- qcom,hdmi-tx-mux-en-gpio: (deprecated) use "qcom,hdmi-tx-mux-en-gpios"
>> +     instead
>> +- qcom,hdmi-tx-mux-sel-gpio: (deprecated) use "qcom,hdmi-tx-mux-sel-gpio"
>> +     instead
>>  - pinctrl-names: the pin control state names; should contain "default"
>>  - pinctrl-0: the default pinctrl state (active)
>>  - pinctrl-1: the "sleep" pinctrl state
>
> I don't see much use in listing that these properties are deprecated. We
> already have code to catch the deprecated names, so having them in the
> binding will at best be distracting.
>
> Anyway, I don't know if there's been any advice on this from the device
> tree bindings maintainers, so adding devicetree@vger.kernel.org for
> visibility.

If they need to be maintained, then marking them deprecated is
perfectly fine IMO. Also, if the maintainers of platforms using this
are okay with it, you can just switch it. Given there are no in tree
dts files using this, it can be argued that there is no ABI.

Rob
