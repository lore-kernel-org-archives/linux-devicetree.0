From: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a77965: Add CAN FD controller
 node
Date: Mon, 19 Nov 2018 00:29:37 +0100
Message-ID: <647080c6-5b96-a39e-db6e-4426cabc5939@gmail.com>
References: <20181118173327.4704-1-marek.vasut+renesas@gmail.com>
 <20181118173327.4704-2-marek.vasut+renesas@gmail.com>
 <20181118231053.GC2553@kunai>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181118231053.GC2553@kunai>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: devicetree@vger.kernel.org, Takeshi Kihara <takeshi.kihara.df@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, linux-renesas-soc@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, Marc Kleine-Budde <mkl@pengutronix.de>, Simon Horman <horms+renesas@verge.net.au>, linux-arm-kernel@lists.infradead.org, Marek Vasut <marek.vasut+renesas@gmail.com>
List-Id: devicetree@vger.kernel.org

On 11/19/2018 12:10 AM, Wolfram Sang wrote:
> On Sun, Nov 18, 2018 at 06:33:27PM +0100, Marek Vasut wrote:
>> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>>
>> This patch adds CAN FD controller nodes for the R8A77965 SoC.
>>
>> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>> Cc: Marc Kleine-Budde <mkl@pengutronix.de>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Simon Horman <horms+renesas@verge.net.au>
>> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> Cc: linux-renesas-soc@vger.kernel.org
>> Cc: linux-arm-kernel@lists.infradead.org
> 
> Why seperate patches for CAN and CANFD here while they are merged for
> r8a77990 into one patch?

Because they are two different IP blocks, but I can merge the patches
together if that's what you want.

-- 
Best regards,
Marek Vasut
