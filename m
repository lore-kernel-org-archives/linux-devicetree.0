From: =?windows-1252?Q?Uwe_Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Subject: Re: [PATCHv1 0/6] rtc: rtc-isl12057: fixes and alarm support
Date: Wed, 26 Nov 2014 19:48:54 +0100
Message-ID: <54762096.7040200@kleine-koenig.org>
References: <cover.1416006090.git.arno@natisbad.org>
 <874mtlyflf.fsf@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <874mtlyflf.fsf@natisbad.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnaud Ebalard <arno@natisbad.org>, Mark Brown <broonie@kernel.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Morton <akpm@linux-foundation.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Alessandro Zummo <a.zummo@towertech.it>, Pawel Moll <pawel.moll@arm.com>, rtc-linux@googlegroups.com, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-doc@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Grant Likely <grant.likely@linaro.org>, Guenter Roeck <linux@roeck-us.net>, Rob Landley <rob@landley.net>, Kumar Gala <galak@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Peter Huewe <peter.huewe@infineon.com>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <treding@nvidia.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello Arnaud,

On 11/26/2014 07:35 PM, Arnaud Ebalard wrote:
> I wonder if you could take a look at this series I sent providing fixes
> (patches #1-5) and alarm support (patch #6) for ISL12057 RTC Chip. As
> all people do for RTC patches - due to lack of feedback from maintainer
> - I am looking for someone to review the patches (Mark, patch 6 has a
> sticker w/ regmap-inside ;-)) and then push those upstream if they are
> ok (Jason, you handled that part for 70e123373c05: "rtc: Add support for
> Intersil ISL12057 I2C RTC chip" in 2013 for the same reason).
> 
> Note that I addressed previous comments and feedback received from Uwe
> and also spent time to do some soldering in order to support and test
> the last patch for both my use case (Alarm IRQ signal not routed to the
> SoC on ReadyNAS RN102, RN104 and RN2120) and the common case.
> 
> Do not hesitate to ask if you want me to resend!
akpm already applied the series, doesn't he?

I'm about to test the patches, just fighting with my NAS to boot my
custom kernel.

Apart from that patches 1 - 5 can have my Ack. Didn't look deep enough
into patch 6 yet. @akpm: No need to hurry adding them, I hope to be
able to also provide Tested-by:-tags later today.

Best regards
Uwe
