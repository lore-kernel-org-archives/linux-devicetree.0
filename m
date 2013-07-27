From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 2/2] pinctrl: palmas: add pincontrol driver
Date: Sat, 27 Jul 2013 15:53:27 +0530
Message-ID: <51F39F9F.5020607@nvidia.com>
References: <1374833754-19659-1-git-send-email-ldewangan@nvidia.com> <1374833754-19659-3-git-send-email-ldewangan@nvidia.com> <20130726164122.GT9858@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20130726164122.GT9858@sirena.org.uk>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: "grant.likely@linaro.org" <grant.likely@linaro.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "rob@landley.net" <rob@landley.net>, "sameo@linux.intel.com" <sameo@linux.intel.com>, "lee.jones@linaro.org" <lee.jones@linaro.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "gg@slimlogic.co.uk" <gg@slimlogic.co.uk>, "kishon@ti.com" <kishon@ti.com>, Stephen Warren <swarren@nvidia.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Friday 26 July 2013 10:11 PM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Fri, Jul 26, 2013 at 03:45:54PM +0530, Laxman Dewangan wrote:
>
>> +pins: gpio0_id, gpio1_vbus_det_led1_pwm1, gpio2_regen_led2_pwm2, gpio3_chrg_det,
>> +	gpio4_sysen1, gpio5_clk32kgaudio_usb_psel, gpio6_sysen2,
>> +	gpio7_msecure_pwrhold, gpio8_sim1rsti, gpio9_low_vbat,
>> +	gpio10_wireless_chrg1, gpio11_rcm, gpio12_sim2rsto, gpio13, gpio14,
>> +	gpio15_sim2rsti, vac, powergood_usb_psel, nreswarm, pwrdown,
>> +	gpadc_start, reset_in, nsleep, enable1, enable2, int.
> Would it not be easier to just name the GPIOs gpioN rather than using
> the full names with the possible functions?
>

I took the name approach as what we have on Tegra.
But I think I can put the name of the pins same as what we have in 
datasheet. So pin name will be exact same as what we have in datasheet. 
That will be easy to interpret.

