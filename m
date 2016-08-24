From: Vinay Simha <simhavcs@gmail.com>
Subject: Re: [RESEND] [PATCH v2 2/4] dt-bindings: Add jdi lt070me05000 panel bindings
Date: Wed, 24 Aug 2016 17:53:00 +0530
Message-ID: <CAGWqDJ6HuoHP5ygEG-SWUhaUqOjnzTCZb=xyO_pu8xXXHnq5Aw@mail.gmail.com>
References: <1469978126-925-1-git-send-email-simhavcs@gmail.com>
 <1469978126-925-2-git-send-email-simhavcs@gmail.com> <20160824115639.GC3169@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160824115639.GC3169@ulmo.ba.sec>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Archit Taneja <archit.taneja@gmail.com>, John Stultz <john.stultz@linaro.org>, Sumit Semwal <sumit.semwal@linaro.org>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

if we do not set the polarity to 8mA, panel will have gibberish display.
(information to set 8mA is available only in
nexus7-msm-flo-3.4-lollipop-release_dsi kernel nx7 release)

i will add this
reset-gpios = <&tlmm_pinmux 54 GPIO_ACTIVE_LOW>;

On Wed, Aug 24, 2016 at 5:26 PM, Thierry Reding
<thierry.reding@gmail.com> wrote:
> On Sun, Jul 31, 2016 at 08:45:21PM +0530, Vinay Simha BN wrote:
> [...]
>> diff --git a/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt b/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt
> [...]
>> +- reset-gpios: phandle of gpio for reset line
>> +  This should be 8mA, gpio can be configured using mux, pinctrl, pinctrl-names
>> +  XRES, Reset, Low active
>> +- enable-gpios: phandle of gpio for enable line
>> +  LED_EN, LED backlight enable, High active
>
> This is a little confusing. Shouldn't we rather completely omit any
> mention of the polarity of these and let the board design handle this?
>
> If the reset is low active, then I'd expect that to be reflected in the
> GPIO specifier of the reset-gpios property, like so:
>
>         panel@0 {
>                 ...
>                 reset-gpios = <&tlmm_pinmux 54 GPIO_ACTIVE_LOW>;
>                 ...
>         };
>
> With that a driver can simply deal with a high active reset, which it
> currently doesn't. The problem with the current description is that it
> is unclear who's to deal with the polarity. In order for this to work
> properly with the current driver you'll have to specify the GPIO as
> GPIO_ACTIVE_HIGH, which is not what the binding says it should be.
>
> Thierry



-- 
regards,
vinaysimha
