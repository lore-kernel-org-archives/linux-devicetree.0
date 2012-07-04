From: Alex Courbot <acourbot@nvidia.com>
Subject: Use of the pwm-names DT property
Date: Wed, 4 Jul 2012 15:53:22 +0900
Message-ID: <4FF3E862.8050101@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@avionic-design.de>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

Hi Thierry,

Looking at your PWM/DT integration patches for linux-next, I was 
wondering what is the rationale behind using the pwm-names property. If 
I got it correctly, its purpose is to be able to reference different 
PWMs by name, e.g. by having

	pwms = <&pwm 0 5000000>, <&pwm 1 5000000>;
	pwm-names = "backlight", "flash";

You could get the first PWM in the driver code by calling pwm_get(dev, 
"backlight") and the second through pwm_get(dev, "flash").

While I am ok with this way of doing, why not having the form that is 
already used by the regulator and gpio frameworks, in which the consumer 
is part of the property name?

	vdd-supply = <&vdd_reg>;
	core-supply = <&core_reg>;

Both regulators are then accessed using regulator_get(dev, "vdd") and 
regulator_get(dev, "core").

Wouldn't it make more sense to follow the same scheme that has been 
popularized by other frameworks? It also has the advantage that you do 
not need to maintain two different properties which must be the same size.

Thanks,
Alex.
