From: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v4 03/10] dt-bindings: mailbox: Add a sunxi message box
 binding
Date: Tue, 20 Aug 2019 08:04:26 -0500
Message-ID: <8947f4d1-3bb4-11b8-b114-5016339514b8@sholland.org>
References: <20190820032311.6506-1-samuel@sholland.org>
 <20190820032311.6506-4-samuel@sholland.org>
 <20190820071456.if5lyb4t3em77svl@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190820071456.if5lyb4t3em77svl@flea>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Jassi Brar <jassisinghbrar@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Corentin Labbe <clabbe.montjoie@gmail.com>, Vasily Khoruzhick <anarsoul@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

On 8/20/19 2:14 AM, Maxime Ripard wrote:
> Hi,
> 
> On Mon, Aug 19, 2019 at 10:23:04PM -0500, Samuel Holland wrote:
>> This mailbox hardware is present in Allwinner sun8i, sun9i, and sun50i
>> SoCs. Add a device tree binding for it.
>>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> Signed-off-by: Samuel Holland <samuel@sholland.org>
>> ---
>>  .../mailbox/allwinner,sunxi-msgbox.yaml       | 79 +++++++++++++++++++
>>  1 file changed, 79 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mailbox/allwinner,sunxi-msgbox.yaml
> 
> So we merged a bunch of schemas already, with the convention that the
> name was the first compatible to use that binding.
> 
> That would be allwinner,sun6i-a31-msgbox.yaml in that case

Okay, I'll rename the binding and driver (and Kconfig symbol?).

Thanks,
Samuel
