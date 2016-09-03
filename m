From: Jorik Jonker <jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org>
Subject: Re: [PATCH v2 4/7] dts: sun8i-h3: add UART1-3 to Orange Pi Plus
Date: Sat, 3 Sep 2016 14:09:32 +0200
Message-ID: <20160903120932.GA6289@carbon.kippendief.biz>
References: <1472671858-29220-1-git-send-email-jorik@kippendief.biz>
 <1472671858-29220-5-git-send-email-jorik@kippendief.biz>
 <20160902070425.GB6313@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160902070425.GB6313@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 02, 2016 at 09:04:25AM +0200, Maxime Ripard wrote:
>Unfortunately, these pins can be used for other purposes as well, so
>we cannot make force that decision down to our users.

Yes, but since the associated peripheral is disabled, the users are free 
to configure other functions/peripherals, right? I mean something like 
this in pseudo-DT:

 /soc/pio: pinctrl@01c20800/uart1_pins:
   allwinner,pins = "PG6, PG7";
 /soc/pio: pinctrl@01c20800/foo0_pins:
   allwinner,pins = "PG6, PG7";
   ..
 /soc/uart1: serial@serial@01c28400:
   pinctrl-0 = <&uart1_pins>;
   status = "disabled";
 /soc/bar:
   pinctrl-0 = <&uart1_pins>;
   status = "disabled";

Assuming Linux/DT allows this, this would force nothing, only offer 
choice and ease of use.

Best,

Jorik
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
