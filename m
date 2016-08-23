From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: sunxi: fix uart1 CTS/RTS pins at PG on
 A23/A33
Date: Tue, 23 Aug 2016 11:27:10 +0200
Message-ID: <CACRpkdaHY=TFE3H=CM2fu3etHcWq569MDOE2cJY=PGZauHwO2g@mail.gmail.com>
References: <20160823055826.20591-1-icenowy@aosc.xyz>
 <20160823064755.GA2598@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160823064755.GA2598@lukather>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Icenowy Zheng <icenowy@aosc.xyz>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 23, 2016 at 8:47 AM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> On Tue, Aug 23, 2016 at 01:58:25PM +0800, Icenowy Zheng wrote:
>> PG8, PG9 is said to be the CTS/RTS pins for UART1 according to the A23/33
>> datasheets. However, the function is wrongly named "uart2" in the pinctrl
>> driver. This patch fixes this by modifying them to be named "uart1".
>>
>> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
>
> This looks good, but could you send it to stable?

If that is an ACK I can tag it for stable when applying.

Yours,
Linus Walleij
