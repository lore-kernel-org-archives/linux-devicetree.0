From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 01/15] dt-bindings: net: broadcom-bluetooth:
 Fix external clock names
Date: Mon, 12 Nov 2018 12:37:28 -0600
Message-ID: <5bea0ebe.1c69fb81.e15d7.98e1@mx.google.com>
References: <20181107101308.7626-1-wens@csie.org>
 <20181107101308.7626-2-wens@csie.org>
Reply-To: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDJIP47K7MERBQE5VDPQKGQE5GAMQ7Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20181107101308.7626-2-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Marcel Holtmann <marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org>, Johan Hedberg <johan.hedberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 07, 2018 at 06:12:54PM +0800, Chen-Yu Tsai wrote:
> The Broadcom Bluetooth controllers can take up to two external clocks:
> an external frequency reference, substituting the main crystal, and a
> LPO clock at 32.768 kHz substituting the internal LPO clock.
> 
> In particular, the external LPO clock must be used when the controller
> does not have NVRAM connected, and the main reference frequency is not
> the default 20 MHz. This is described in detail in the datasheet.
> 
> The original "extclk" clock name is ambiguous as to which of these it
> refers to, and some designs might even require both.
> 
> This patch deprecates the existing name, and adds "txco" and "lpo".
> 
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/net/broadcom-bluetooth.txt | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
> index 4194ff7e6ee6..2535e54219af 100644
> --- a/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
> +++ b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
> @@ -18,7 +18,10 @@ Optional properties:
>   - shutdown-gpios: GPIO specifier, used to enable the BT module
>   - device-wakeup-gpios: GPIO specifier, used to wakeup the controller
>   - host-wakeup-gpios: GPIO specifier, used to wakeup the host processor
> - - clocks: clock specifier if external clock provided to the controller
> + - clocks and clock-names: clock specifier if external clocks are provided
> +   - "txco": external reference clock
> +   - "extclk": deprecated, replaced by "txco"
> +   - "lpo": external low power 32.768 kHz clock
>   - clock-names: should be "extclk"

This line should change?

'clocks' needs to describe how many clocks and the order of them.

'clock-names' needs to list the names. Keep them separate.

Rob
