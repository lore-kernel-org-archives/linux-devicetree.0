From: Florian Vaussard <florian.vaussard@epfl.ch>
Subject: Re: [PATCHv6 1/3] Input: twl4030-pwrbutton - add device tree support
Date: Fri, 25 Oct 2013 14:40:32 +0200
Message-ID: <526A66C0.1040402@epfl.ch>
References: <1382626126-12565-1-git-send-email-sre@debian.org> <1382626126-12565-2-git-send-email-sre@debian.org>
Reply-To: florian.vaussard@epfl.ch
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <1382626126-12565-2-git-send-email-sre@debian.org>
Sender: linux-input-owner@vger.kernel.org
To: Sebastian Reichel <sre@debian.org>, Sebastian Reichel <sre@ring0.de>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Sachin Kamat <sachin.kamat@linaro.org>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello,

On 10/24/2013 04:48 PM, Sebastian Reichel wrote:
> Add device tree support for twl4030 power button driver.
> 
> Signed-off-by: Sebastian Reichel <sre@debian.org>

I tested on my OMAP3 board, the button event works as expected. So for
the DT boot, feel free to add my:

Tested-by: Florian Vaussard <florian.vaussard@epfl.ch>

Best regards,

Florian
