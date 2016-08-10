From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] dt-bindings: clock: reset: Add GXBB AO Clock and
 Reset Bindings
Date: Wed, 10 Aug 2016 16:40:54 -0500
Message-ID: <20160810214054.GA14766@rob-hp-laptop>
References: <1470734008-18849-1-git-send-email-narmstrong@baylibre.com>
 <1470734008-18849-3-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1470734008-18849-3-git-send-email-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 09, 2016 at 11:13:27AM +0200, Neil Armstrong wrote:
> Add documentations and dt-bindings headers for the AO clock and reset
> controller.
> 
> Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> ---
>  .../bindings/clock/amlogic,gxbb-aoclkc.txt         | 45 +++++++++++++++
>  include/dt-bindings/clock/gxbb-aoclkc.h            | 66 ++++++++++++++++++++++
>  include/dt-bindings/reset/gxbb-aoclkc.h            | 66 ++++++++++++++++++++++
>  3 files changed, 177 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt
>  create mode 100644 include/dt-bindings/clock/gxbb-aoclkc.h
>  create mode 100644 include/dt-bindings/reset/gxbb-aoclkc.h

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
