From: Peter Rosin <peda@lysator.liu.se>
Subject: Re: [PATCH] ARM: at91/dt: pullup dbgu rx instead of tx
Date: Sun, 16 Oct 2016 12:57:09 +0200
Message-ID: <6d2d5aba-cca3-93c6-0c59-3acbbd7b6169@lysator.liu.se>
References: <1443105855-15738-1-git-send-email-peda@lysator.liu.se>
 <20150924144753.GY4287@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20150924144753.GY4287@piout.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Sylvain Rochet <sylvain.rochet@finsecur.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Peter Rosin <peda@axentia.se>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi again,

I forgot about this, and it's been a year. But isn't it time to
upstream those pull-up fixes that Sylvain provided?

Cheers,
Peter


On 2015-09-24 16:47, Alexandre Belloni wrote:
> Hi Peter,
> 
> Thanks for the patch but you actually got beaten by Sylvain:
> http://lists.infradead.org/pipermail/linux-arm-kernel/2015-September/368426.html
> 
> On 24/09/2015 at 16:44:15 +0200, Peter Rosin wrote :
>> From: Peter Rosin <peda@axentia.se>
>>
>> It seems pointless to pullup the tx line, but there is value in pulling
>> up the rx line.
>>
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Peter Rosin <peda@axentia.se>
>> ---
>>  arch/arm/boot/dts/sama5d3.dtsi |    4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/sama5d3.dtsi b/arch/arm/boot/dts/sama5d3.dtsi
>> index 9e2444b07bce..304a40c5552a 100644
>> --- a/arch/arm/boot/dts/sama5d3.dtsi
>> +++ b/arch/arm/boot/dts/sama5d3.dtsi
>> @@ -545,8 +545,8 @@
>>  				dbgu {
>>  					pinctrl_dbgu: dbgu-0 {
>>  						atmel,pins =
>> -							<AT91_PIOB 30 AT91_PERIPH_A AT91_PINCTRL_NONE	/* PB30 periph A */
>> -							 AT91_PIOB 31 AT91_PERIPH_A AT91_PINCTRL_PULL_UP>;	/* PB31 periph A with pullup */
>> +							<AT91_PIOB 30 AT91_PERIPH_A AT91_PINCTRL_PULL_UP	/* PB30 periph A with pullup */
>> +							 AT91_PIOB 31 AT91_PERIPH_A AT91_PINCTRL_NONE>;	/* PB31 periph A */
>>  					};
>>  				};
>>  
>> -- 
>> 1.7.10.4
>>
> 
