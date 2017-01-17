From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: gpu: Add Mali Utgard bindings
Date: Tue, 17 Jan 2017 13:31:19 +0200
Message-ID: <CAJKOXPdbbzoqNLg=iRGC8ijVPdpLD5+CFyqysfM49vkx6o3rRQ@mail.gmail.com>
References: <20170116132424.7038-1-maxime.ripard@free-electrons.com>
 <20170116184906.r62di7xiil5lae33@kozik-lap>
 <20170117093813.mxp2hgoxbgske6ru@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170117093813.mxp2hgoxbgske6ru@lukather>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Javier Martinez Canillas <javier@osg.samsung.com>, Kevin Hilman <khilman@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Boris Brezillon <boris.brezillon@free-electrons.com>, Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Kukjin Kim <kgene@kernel.org>, =?UTF-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart@free-electrons.com>, Carlo Caione <carlo@caione.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 17, 2017 at 11:38 AM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> Hi,
>
> On Mon, Jan 16, 2017 at 08:49:06PM +0200, Krzysztof Kozlowski wrote:
>> On Mon, Jan 16, 2017 at 02:24:23PM +0100, Maxime Ripard wrote:
>> > The ARM Mali Utgard GPU family is embedded into a number of SoCs from
>> > Allwinner, Amlogic, Mediatek or Rockchip.
>> >
>> > Add a binding for the GPU of that family.
>> >
>> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
>> > ---
>> >  .../devicetree/bindings/gpu/arm,mali-utgard.txt    | 76 ++++++++++++++++++++++
>> >  1 file changed, 76 insertions(+)
>> >  create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt
>>
>> Do you have a driver in kernel which will implement these bindings?
>
> No, but we have bindings for out-of-tree drivers already.
>
>> Defining them for out-of-tree driver does not bring any benefits
>> (3rd party driver will not respect them anyway).
>
> You could see it the other way around too. The out-of-tree drivers
> don't respect it at the moment because there's no binding to respect.

Indeed, that's a point. However valid only when the out-of-tree driver
will respect them, for example do not break them on next release.

Best regards,
Krzysztof
