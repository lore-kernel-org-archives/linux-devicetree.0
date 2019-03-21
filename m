From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] dt-bindings: usb: dwc2: document the vbus-supply property
Date: Thu, 21 Mar 2019 20:21:14 +0100
Message-ID: <CAFBinCBtZfcRK-V3K-dBFc7SyG=cG0cunfV+AScqiGPA2-gGGg@mail.gmail.com>
References: <20190306212431.5779-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190306212431.5779-1-martin.blumenstingl@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: hminas@synopsys.com, gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, amelie.delaunay@st.com, felipe.balbi@linux.intel.com
List-Id: devicetree@vger.kernel.org

On Wed, Mar 6, 2019 at 10:24 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Various boards have an external VBUS supply regulator. This regulator
> depends on the current mode of the controller which is defined as:
> - dr_mode set to either "host" or "peripheral" (fixed value)
> - dr_mode set to "otg", based on the OTG status the dwc2 controller
>   internally switches between "host" and "peripheral" mode (selection
>   happens at runtime)
>
> Based on the current mode the regulator has to be enabled or disabled:
> - host: provide power to the connected USB device, thus the regulator
>   has to be enabled
> - peripheral: the host device to which the controller is connected
>   provides power, thus the regulator has to be disabled
>
> Add the dt-bindings documentation for this property so .dts authors know
> that this property exists and how it behaves.
>
> Fixes: 531ef5ebea9639 ("usb: dwc2: add support for host mode external vbus supply")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
gentle ping as I may have sent this when most -next and -fixes trees
were closed (right before the v5.0 release)

it's not a change which is visible at runtime (users don't care) so
it's not urgent.
however, it still adds missing documentation which is useful when
writing .dts files with a dwc2 controller.


Regards
Martin
