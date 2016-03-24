From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: Re: [PATCH 10/12] ARM: dts: dragonboard-600c: Add on board leds support
Date: Thu, 24 Mar 2016 17:51:01 +0100
Message-ID: <CAP71WjzdDRqtS4oJu_m_Y9kuZ4QprYnqMHop=5a6Vc6yypakhA@mail.gmail.com>
References: <1458762366-9233-1-git-send-email-srinivas.kandagatla@linaro.org> <1458762484-9768-1-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1458762484-9768-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 23, 2016 at 8:48 PM, Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
> +                       led@1 {
> +                               label = "dragonboard-600c:green:user1";
> +                               gpios = <&tlmm_pinmux 3 GPIO_ACTIVE_HIGH>;
> +                               linux,default-trigger = "heartbeat";
> +                               default-state = "off";
> +                       };
> +
> +                       led@2 {
> +                               label = "dragonboard-600c:green:user2";
> +                               gpios = <&tlmm_pinmux 7 GPIO_ACTIVE_HIGH>;
> +                               linux,default-trigger = "mmc0";
> +                               default-state = "off";
> +                       };
> +
> +                       led@3 {
> +                               label = "dragonboard-600c:green:user3";
> +                               gpios = <&tlmm_pinmux 10 GPIO_ACTIVE_HIGH>;
> +                               linux,default-trigger = "mmc1";
> +                               default-state = "off";
> +                       };
> +
> +                       led@4 {
> +                               label = "apq8016-sbc:green:user4";

typo ^^

> +                               gpios = <&tlmm_pinmux 11 GPIO_ACTIVE_HIGH>;
> +                               linux,default-trigger = "none";
> +                               default-state = "off";
> +                       };

also, if i read the 96boards specs correctly, the LED are labeled
3-2-1-0 , if you look at the board with the LEDs on the bottom. With
this DT config, you end up with 0-1-2-3 instead.

also, they should be labeled 0 to 3, not 1 to 4.
