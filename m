From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH v6 1/6] clocksource: Add support for the Mediatek SoCs
Date: Wed, 4 Jun 2014 08:52:42 -0500
Message-ID: <CAL_JsqJGMDNKwJ7M5-mtbbKTa434=pXUTfYZH39Tja0LwJO7_A@mail.gmail.com>
References: <1401468964-5307-1-git-send-email-matthias.bgg@gmail.com>
 <1401468964-5307-2-git-send-email-matthias.bgg@gmail.com>
 <CAL_JsqKCTZjh7o2zf_WsVi=iAR1ivTPQpvpNJ6W87jPXakMnZg@mail.gmail.com>
 <538F0230.7090800@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <538F0230.7090800@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko.stuebner@bq.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Florian Vaussard <florian.vaussard@epfl.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Soren Brinkmann <soren.b>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 4, 2014 at 6:25 AM, Gregory CLEMENT
<gregory.clement@free-electrons.com> wrote:
> Hi Rob,
>
> On 04/06/2014 13:18, Rob Herring wrote:
>
> [...]
>
>>> +
>>> +       if (of_address_to_resource(node, 0, &res))
>>> +               panic("Failed to parse resource\n");
>>
>> panics are a bit pointless at this stage since your console is
>> typically not up yet. Warning and continuing on with boot gives you a
>> better shot at actually seeing the message.
>>
>>> +
>>> +       if (!request_mem_region(res.start, resource_size(&res), "mtk-timer"))
>>> +               panic("Registers are a busy IO resource");
>>> +
>>> +       evt->gpt_base = ioremap(res.start, resource_size(&res));
>>
>> of_iomap instead of these 3 calls.
>
> Actually of_iomap doesn't request_mem_region, that's why for
> mvebu we are trying now to replace of_iomap by request_mem_region/ioremap.

Then perhaps we should add of_iomap_resource which does both. It could
possibly be added into of_iomap, but we'd have to ignore any failures
due to overlapping regions.

Rob
