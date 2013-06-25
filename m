From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/1] of/documentation: Update s5m8767-regulator bindings document
Date: Tue, 25 Jun 2013 11:56:12 +0530
Message-ID: <CAK9yfHzBPO1Yr7_qLtw3oZKVVtqDBK_Yj7_r=HrU+94pod+XVA@mail.gmail.com>
References: <1372066617-23518-1-git-send-email-sachin.kamat@linaro.org>
	<20130624152553.GT27646@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20130624152553.GT27646@sirena.org.uk>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, grant.likely@linaro.org, rob@landley.net, patches@linaro.org
List-Id: devicetree@vger.kernel.org

On 24 June 2013 20:55, Mark Brown <broonie@kernel.org> wrote:
> On Mon, Jun 24, 2013 at 03:06:57PM +0530, Sachin Kamat wrote:
>> s5m8767 regulator is used on Exynos platforms which use pin controller
>> to configure GPIOs. Update the example accordingly.
>
> This smells bad, why does a driver using GPIOs through the GPIO API see
> a change in the binding?

There is no change in the bindings, but just a correction in the
documentation to reflect the
implementation. Earlier when Samsung platforms did not have pinctrl
driver, legacy GPIO driver
was used which took those 5 parameters. Now since we are using
pinctrl, we need only 3 parameters.
The document was somehow not updated to reflect this change.

-- 
With warm regards,
Sachin
