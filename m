From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH RESEND net-next v2 1/8] dt-bindings: net: dwmac-sun8i:
 Clean up clock delay chain descriptions
Date: Sun, 13 May 2018 21:59:22 -0700
Message-ID: <CAGb2v66F_Ho2OZdrF3p6xe9mQ=zJZ_KjE9MnW1VmWs9jw65eEg@mail.gmail.com>
References: <20180513191425.9801-1-wens@csie.org>
 <20180513191425.9801-2-wens@csie.org>
 <20180513194919.GE12738@lunn.ch>
 <CAGb2v66nqWnioS1pwfWFtMZFZSWvf4SwXr_ExnnGvYsK9RU_LA@mail.gmail.com>
 <20180513200529.GF12738@lunn.ch>
 <CAGb2v64ACc1tQRhy4LhnvCC7VJ3nVM-wMbgUgzviGMWKPFsSuQ@mail.gmail.com>
 <20180513202938.GH12738@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180513202938.GH12738@lunn.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: devicetree <devicetree@vger.kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, netdev <netdev@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Corentin Labbe <clabbe.montjoie@gmail.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

On Sun, May 13, 2018 at 1:29 PM, Andrew Lunn <andrew@lunn.ch> wrote:
> On Sun, May 13, 2018 at 01:11:08PM -0700, Chen-Yu Tsai wrote:
>> On Sun, May 13, 2018 at 1:05 PM, Andrew Lunn <andrew@lunn.ch> wrote:
>> >> > Hi Chen-Yu
>> >> >
>> >> > Are these delays the MAC applies? Not the PHY. It would be good to
>> >> > make it clear here these are MAC imposed delays.
>> >>
>> >> Yes these are applied on the MAC side. Being described in the device
>> >> tree bindings for the MAC, I thought this was implied to be the case?
>> >> Are there known exceptions?
>> >
>> > There is frequent confusion with this. Most of the time, the PHY does
>> > the delay, not the MAC, based on the phy-mode. So the MAC doing it is
>> > an exception in itself.
>> >
>> > Do you actually need these delays for the board you adding support
>> > for? Does the PHY not support adding the needed delays? If you don't
>> > need the delays, i would not even implement them.
>>
>> Yes this is already used on the Bananapi M3. This patch merely reformats
>> the description and adds a note saying this only applies to RGMII mode.
>
> Yes, the current code is needed for the Bananapi M3. But you have
> another patch which extends the code to support a smaller range. Do
> you have a board which actually needs this? If not, i would not add
> that new code.

IIRC the delay on the PHY side is either 2ns or none. The delay on the
MAC side here is an order smaller, likely fine tuning to cope with board
design deficiencies.

Currently no other board requires this, but this is already part of the
binding. The new stuff limits the range for a specific SoC, simply because
that is the range supported by the control register. Not implementing, i.e.
supporting the whole range from the property, which might get truncated,
doesn't make much sense to me.

Regards
ChenYu
