From: Angus Ainslie <angus@akkea.ca>
Subject: Re: [PATCH v15 0/3] Add support for the Purism Librem5 devkit
Date: Wed, 12 Jun 2019 09:02:41 -0600
Message-ID: <b1de3d5fd352744f2c1f4e7bae266d01@www.akkea.ca>
References: <20190528125747.1047-1-angus@akkea.ca>
 <20190605090315.GJ29853@dragon>
 <db174b0173d0bcdb9ab5ff4e2e1cc4bc@www.akkea.ca>
 <20190610135258.GA7976@xo-6d-61-c0.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190610135258.GA7976@xo-6d-61-c0.localdomain>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Abel Vesa <abel.vesa@nxp.com>, linux-kernel-owner@vger.kernel.org, Carlo Caione <ccaione@baylibre.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, angus.ainslie@puri.sm, Shawn Guo <shawnguo@kernel.org>, =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, linux-arm-kernel@lists.infradead.org, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Hi Pavel,

On 2019-06-10 07:52, Pavel Machek wrote:
> On Wed 2019-06-05 06:48:05, Angus Ainslie wrote:
>> On 2019-06-05 03:03, Shawn Guo wrote:
>> >On Tue, May 28, 2019 at 05:57:44AM -0700, Angus Ainslie (Purism) wrote:
>> >>The Librem5 devkit is based on the imx8mq from NXP. This is a default
>> >>devicetree to boot the board to a command prompt.
>> >>
>> >>Changes since v14:
>> >>
>> >>Add regulator-always-on for the SNVS regulators.
>> >>Added pgc nodes.
>> >>Fixed charger pre-current.
>> >
>> >Since Pavel was reviewing your patches, you should copy him on the new
>> >version.  Has this version addressed all his review comments?
>> >
>> 
>> Sorry I had meant to include him in the CC.
>> 
>> I believe so but don't want to speak for him so we should see if he
>> has anymore.
> 
> I did not check the code, sorry.
> 
> I still believe your shutdown voltage is too low; try that. Battery
> will go down from 3V
> to 2.8V in seconds, so you don't really gain anything by using lower
> threshold, and you
> may not even have enough time to shutdown the system if you set it too 
> low.
> 
> Normally something like 3.0V, 3.2V is reasonable shutdown voltage.
> 

I took another look at the BQ25896 datasheet and the minimum-sys-voltage 
register is limited to 3.0-3.7 V.

I'll submit a new version.

Angus

> Best regards,
> 										Pavel
