From: Rui Miguel Silva <rmfrfs@gmail.com>
Subject: Re: [PATCH v3 12/14] ARM: dts: imx7s-warp: add ov2680 sensor node
Date: Wed, 09 May 2018 12:03:56 +0100
Message-ID: <m3efil9jkz.fsf@gmail.com>
References: <20180507162152.2545-1-rui.silva@linaro.org>
 <20180507162152.2545-13-rui.silva@linaro.org>
 <CAOMZO5B+P5jyPshBe1NyyFyXCtmeQ_=pEB3CGHQuX_1Gfpa8rQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-reply-to: <CAOMZO5B+P5jyPshBe1NyyFyXCtmeQ_=pEB3CGHQuX_1Gfpa8rQ@mail.gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: devel@driverdev.osuosl.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ryan Harkin <ryan.harkin@linaro.org>, Rob Herring <robh+dt@kernel.org>, Rui Miguel Silva <rui.silva@linaro.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Steve Longerbeam <slongerbeam@gmail.com>, Fabio Estevam <fabio.estevam@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, linux-media <linux-media@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Fabio,
On Tue 08 May 2018 at 13:28, Fabio Estevam wrote:
> Hi Rui,
>
> On Mon, May 7, 2018 at 1:21 PM, Rui Miguel Silva 
> <rui.silva@linaro.org> wrote:
>
>> +       reg_peri_3p15v: regulator-peri-3p15v {
>> +               compatible = "regulator-fixed";
>> +               regulator-name = "peri_3p15v_reg";
>> +               regulator-min-microvolt = <3150000>;
>> +               regulator-max-microvolt = <3150000>;
>> +               regulator-always-on;
>
> You can remove the 'regulator-always-on' property as this 
> regulator
> will be controlled by AVDD-supply.

Yeah, will do.

---
Cheers,
	Rui
