From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: Re: [PATCH RFC 1/5] drm/msm/hdmi: deprecate non standard gpio
 properties.
Date: Mon, 10 Aug 2015 15:27:54 -0700
Message-ID: <20150810222754.GM6519@usrtlx11787.corpusers.net>
References: <1439207923-30812-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1439207962-30860-1-git-send-email-srinivas.kandagatla@linaro.org>
 <20150810124510.GC1262@ulmo.nvidia.com>
 <CAL_JsqK6=bmbU-OD7L-Xzg6C+AtNFZZJq-LK3UWXE0rza7-gwA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqK6=bmbU-OD7L-Xzg6C+AtNFZZJq-LK3UWXE0rza7-gwA@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, dri-devel <dri-devel@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>, David Airlie <airlied@linux.ie>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon 10 Aug 15:07 PDT 2015, Rob Herring wrote:

[..]
> >> -- qcom,hdmi-tx-ddc-clk-gpio: ddc clk pin
> >> -- qcom,hdmi-tx-ddc-data-gpio: ddc data pin
> >> -- qcom,hdmi-tx-hpd-gpio: hpd pin
> >> +- qcom,hdmi-tx-ddc-clk-gpios: ddc clk pin
> >> +- qcom,hdmi-tx-ddc-data-gpios: ddc data pin
> 
> The driver doesn't appear to do anything other than set these gpios
> high. Presumably you would ultimately do a bit-bang i2c bus for these?
> At that point, aren't you going to want to use the i2c-gpio binding?
> 
> I think this binding has bigger issues like why is it not using the
> hdmi-connector binding which has a standard "hpd-gpios" property
> already. I can't really single out this binding though. There's a lot
> of crap when it comes to DRM related bindings.
> 

Shouldn't these pins just be muxed to the hdmi block in pinctl?

I know Rob had something wrt the detect pin (hdp), but the others should
never be gpios(?) Isn't this just a reminder of the codeaurora tree
gpio_requesting all pins "just to be safe"?

> >> +- qcom,hdmi-tx-hpd-gpios: hpd pin
> >>  - core-vdda-supply: phandle to supply regulator
> >>  - hdmi-mux-supply: phandle to mux regulator
> >>
> >> +- qcom,hdmi-tx-ddc-clk-gpio: (deprecated) use
> >> +     "qcom,hdmi-tx-ddc-clk-gpios" instead
> >> +- qcom,hdmi-tx-ddc-data-gpio: (deprecated) use
> >> +     "qcom,hdmi-tx-ddc-data-gpios" instead
> >> +- qcom,hdmi-tx-hpd-gpio: (deprecated) use
> >> +     "qcom,hdmi-tx-hpd-gpios" instead
> >> +
> >>  Optional properties:
> >> -- qcom,hdmi-tx-mux-en-gpio: hdmi mux enable pin
> >> -- qcom,hdmi-tx-mux-sel-gpio: hdmi mux select pin
> >> +- qcom,hdmi-tx-mux-en-gpios: hdmi mux enable pin
> >> +- qcom,hdmi-tx-mux-sel-gpios: hdmi mux select pin
> >> +
> >> +- qcom,hdmi-tx-mux-en-gpio: (deprecated) use "qcom,hdmi-tx-mux-en-gpios"
> >> +     instead
> >> +- qcom,hdmi-tx-mux-sel-gpio: (deprecated) use "qcom,hdmi-tx-mux-sel-gpio"
> >> +     instead
> >>  - pinctrl-names: the pin control state names; should contain "default"
> >>  - pinctrl-0: the default pinctrl state (active)
> >>  - pinctrl-1: the "sleep" pinctrl state
> >
> > I don't see much use in listing that these properties are deprecated. We
> > already have code to catch the deprecated names, so having them in the
> > binding will at best be distracting.
> >
> > Anyway, I don't know if there's been any advice on this from the device
> > tree bindings maintainers, so adding devicetree@vger.kernel.org for
> > visibility.
> 
> If they need to be maintained, then marking them deprecated is
> perfectly fine IMO. Also, if the maintainers of platforms using this
> are okay with it, you can just switch it. Given there are no in tree
> dts files using this, it can be argued that there is no ABI.
> 

Part of some dev trees floating around no-one should have used these. So
I think we should just document the proper ones and have the drivers
support Rob's old properties until he's comfortable dropping them.

That way we have a documented way forward and Rob can run his backports
of this code without forking it.

Regards,
Bjorn
