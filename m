From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 05/12] Document: dt: binding: imx: update pinctrl doc
 for imx6sll
Date: Wed, 18 Jan 2017 13:24:30 +0100
Message-ID: <CACRpkdaxvf6eHujfvKuOsRb69aL8+4jTE-aR3a6ywhytTEu6Hw@mail.gmail.com>
References: <1482832070-22668-1-git-send-email-ping.bai@nxp.com>
 <1482832070-22668-6-git-send-email-ping.bai@nxp.com>
 <CACRpkdYUME8K+JusA0ORRKqxyBuhDdyei8eg7UZbHidKw9=bQw@mail.gmail.com>
 <AM3PR04MB5304992095753B761E66A9A87640@AM3PR04MB530.eurprd04.prod.outlook.com>
 <CACRpkdYTpEHyzBY-mA4YUsj=xt46Pibka3-4VHwUXosfgbgp1Q@mail.gmail.com>
 <AM3PR04MB530A88C5C0E7C6AD2C59B9E87790@AM3PR04MB530.eurprd04.prod.outlook.com>
 <CACRpkda1a4+yOrzBnKs6J84PS0StwQ68gHxDub_u7i5ofU9s7w@mail.gmail.com>
 <AM3PR04MB530F532D867C08824DADDC9877C0@AM3PR04MB530.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <AM3PR04MB530F532D867C08824DADDC9877C0@AM3PR04MB530.eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jacky Bai <ping.bai@nxp.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, "jacky.baip@gmail.com" <jacky.baip@gmail.com>, Fabio Estevam <fabio.estevam@nxp.com>, Thomas Gleixner <tglx@linutronix.de>, Shawn Guo <shawnguo@kernel.org>, linux-clk <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 17, 2017 at 7:35 AM, Jacky Bai <ping.bai@nxp.com> wrote:
>> Subject: Re: [PATCH v2 05/12] Document: dt: binding: imx: update pinctrl doc
>> On Thu, Jan 12, 2017 at 3:57 AM, Jacky Bai <ping.bai@nxp.com> wrote:
>>
>> > Another thing is that we can use a pins-tool program developed by NXP
>> > to  generate the pinctrl configuration code that can be used directly
>> > in dts. This tiny program can avoid pin function conflict. As on i.MX,
>> > there are so may pins, each pin can be used for up 8  function.
>> > Configuring the pins is a time-consuming work.  This tools is very useful for
>> customer to generate the dts code.
>>
>> I understand, but every silicon vendor has such a tool, all are different,
>> proprietary and unfriendly to programmers and open source developers, who
>> need to understand how the hardware is working without magic tools and
>> secret data sheets to fix bugs.
>>
>> For the people working with maintaining the code it is paramount that DTS files
>> are self-descriptive.
>
> OK.  Thanks for your comments.  Adding generic-pinconf in imx pinctrl needs some time
> to finish and the legacy method still need be here even if generic-pinconf is added.
> Do you plan to pick this legacy binding patch for now?

As I said earlier:

> atleast I need an indication from one of the i.MX maintainers how they
> want to proceed.

Yours,
Linus Walleij
