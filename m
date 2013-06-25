From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] Make non-linear GPIO ranges accesible from gpiolib
Date: Tue, 25 Jun 2013 16:32:52 +0200
Message-ID: <CACRpkdaPJaZb7z+ua91MJ_krDRXGSaZS_5_3vHc7VcAFjUfdfQ@mail.gmail.com>
References: <CACRpkdY9F0cUaRfGJnHJW=2dYf_yKkr3M8Kh+_e6XQhh1WBoUA@mail.gmail.com>
	<1371128132-18266-2-git-send-email-christian.ruppert@abilis.com>
	<51BA3BC1.3090109@wwwdotorg.org>
	<20130614091241.GA23745@ab42.lan>
	<51C1F42E.5090107@wwwdotorg.org>
	<51C1F82C.4020502@wwwdotorg.org>
	<20130620115710.GB942@ab42.lan>
	<51C4C2ED.5090505@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <51C4C2ED.5090505@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Christian Ruppert <christian.ruppert@abilis.com>, Patrice CHOTARD <patrice.chotard@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Sascha Leuenberger <sascha.leuenberger@abilis.com>, Pierrick Hascoet <pierrick.hascoet@abilis.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 21, 2013 at 11:17 PM, Stephen Warren <swarren@wwwdotorg.org> wrote:
> On 06/20/2013 05:57 AM, Christian Ruppert wrote:

> The Linux pinctrl subsystem specifically doesn't provide mutual
> exclusion between "mux function" and GPIO usage within a pin group,
> although perhaps a driver could internally.

It used to block this at one point. But it doesn't make sense
when the hardware looks like so:

>>                                                      +- SPI
>>                  Physical pins --- GPIO --- pinctrl -+- I2C
>>                                                      +- mmc

As in this case it is perfectly legal to enable the GPIO as
input while the I2C bus is running and "spy" on the signals.

The driver should probably not allow the GPIO output to be
driven while some peripheral is muxed in though, that could be
disastrous...

Yours,
Linus Walleij
