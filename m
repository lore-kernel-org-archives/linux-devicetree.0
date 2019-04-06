From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: rtc: add battery-low-hw-alarm property
Date: Sat, 06 Apr 2019 01:07:13 -0500
Message-ID: <5ca84214.1c69fb81.e3ace.21e5@mx.google.com>
References: <1554303165-24813-1-git-send-email-f.suligoi@asem.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1554303165-24813-1-git-send-email-f.suligoi@asem.it>
Sender: linux-kernel-owner@vger.kernel.org
To: Flavio Suligoi <f.suligoi@asem.it>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Mark Rutland <mark.rutland@arm.com>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 03, 2019 at 04:52:44PM +0200, Flavio Suligoi wrote:
> Some RTC devices have a battery-low automatic detection circuit.
> The battery-low event is usually reported with:
> 
> - a bit change in a RTC status register
> - a hw signaling (generally using an interrupt generation), changing
>   the hw level of a specific pin;
> 
> The new property "battery-low-hw-alarm" enable the RTC to generate the
> hw signaling in case of battery-low event.
> 
> Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
> ---
>  Documentation/devicetree/bindings/rtc/rtc.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/rtc.txt b/Documentation/devicetree/bindings/rtc/rtc.txt
> index a97fc6a..f93a44d 100644
> --- a/Documentation/devicetree/bindings/rtc/rtc.txt
> +++ b/Documentation/devicetree/bindings/rtc/rtc.txt
> @@ -31,6 +31,9 @@ below.
>                              expressed in femto Farad (fF).
>                              The default value shall be listed (if optional),
>                              and likewise all valid values.
> +- battery-low-hw-alarm :    Enable the "battery-low" output pin. This function
> +                            is available on the following devices:
> +                            - pcf2127 - pin used for alarm: INTn

Boolean? If there's cases where which pin is selectable, then we'd need 
this to take a value. Not sure how likely that is?

Rob
