From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCHv0 3/3] rtc: rtc-isl12057: add alarm support to Intersil
 ISL12057 RTC driver
Date: Wed, 05 Nov 2014 21:59:47 -0800
Message-ID: <545B0E53.4020003@roeck-us.net>
References: <cover.1415222752.git.arno@natisbad.org>
 <148403c0ab1d556cbb99d9242c65f714a77843e5.1415222752.git.arno@natisbad.org>
 <20141106055017.GL8509@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20141106055017.GL8509@sirena.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Brown <broonie@kernel.org>, Arnaud Ebalard <arno@natisbad.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, rtc-linux@googlegroups.com, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Linus Walleij <linus.walleij@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-doc@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, devicetree@vger.kernel.org, =?windows-1252?Q?Uwe_Kleine-K=F6nig?= <uwe@kleine-koenig.org>, Rob Landley <rob@landley.net>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Peter Huewe <peter.huewe@infineon.com>, Thierry Reding <treding@nvidia.com>, linux-arm-kernel@lists.infradead.org, Jason Cooper <jason@lakedaemon.net>
List-Id: devicetree@vger.kernel.org

On 11/05/2014 09:50 PM, Mark Brown wrote:
> On Wed, Nov 05, 2014 at 10:42:52PM +0100, Arnaud Ebalard wrote:
>
>> +static int _isl12057_rtc_toggle_alarm(struct device *dev, int enable)
>> +{
>> +	struct isl12057_rtc_data *data = dev_get_drvdata(dev);
>
> I can't help but think that toggle is a confusing name for this.
> enable?
>
If I recall correctly we had this argument before. Problem is that the
function can also _disable_ the alarm, so to name it enable is just
as misleading or confusing. update_alarm, maybe ?

Guenter
