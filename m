From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v6 3/3] mfd: max14577: Add device tree bindings document
Date: Wed, 04 Dec 2013 12:03:31 +0100
Message-ID: <1386155011.25938.4.camel@AMDC1943>
References: <1386153615-25456-1-git-send-email-k.kozlowski@samsung.com>
 <1386153615-25456-4-git-send-email-k.kozlowski@samsung.com>
 <529F08DD.2090005@samsung.com> <1386154579.25938.2.camel@AMDC1943>
 <529F0B75.5040004@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <529F0B75.5040004@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Anton Vorontsov <anton@enomsg.org>, David Woodhouse <dwmw2@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Lee Jones <lee.jones@linaro.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2013-12-04 at 20:01 +0900, Chanwoo Choi wrote:
> On 12/04/2013 07:56 PM, Krzysztof Kozlowski wrote:
> > On Wed, 2013-12-04 at 19:50 +0900, Chanwoo Choi wrote:
(...)
> >>
> >> I prefer to add dt data about max14577-muic on following:
> >> If extcon consumer driver need to use muic device, dts should provide following dt data.
> >>
> >> 		muic: max14577-muic {
> >> 			compatible = "maxim, max14577-muic";
> >> 		};
> >>> +	};
> >>>
> >> For example,
> >> If fuel-gauge want to use extcon subsystem, dt data of fuel-gauge add 'extcon' property as following:
> >>
> >> 	fuel-gague@ {
> >> 		compatible = "...";
> >> 		extcon = <&muic>;
> >> 	}
> >>
> > Hi,
> > 
> > The extcon driver itself does not use the binding. It is only needed for
> > consumers. Is it a common practice to add to documentation such notice
> > for consumers only?
> 
> As you comment, It is only for extcon consumer.
> But extcon provider driver always is operated with extcon consumer driver.
> If dts file don't support upper dt data about extcon provider driver,
> all of extcon consumer drivers could not use extcon subsystem.
> 
> I thinks it is common dt data for muic device.

OK, I'll add it.

Best regards,
Krzysztof
