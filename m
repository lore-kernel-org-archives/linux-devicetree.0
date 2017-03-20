From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH] ARM: dts: sun7i: lamobo-r1: Fix CPU port RGMII settings
Date: Mon, 20 Mar 2017 16:32:45 +0800
Message-ID: <CAGb2v65m8JszJWjJs+ja66RVXeHpytSKNX61D2vf1Yp=kWCWFA@mail.gmail.com>
References: <20170319045321.6454-1-f.fainelli@gmail.com>
 <20170320082956.sa2bwsoapp23srto@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170320082956.sa2bwsoapp23srto@lukather>
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
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, mo.ucina@gmail.com, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, Mar 20, 2017 at 4:29 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> Hi Florian,
>
> On Sat, Mar 18, 2017 at 09:53:20PM -0700, Florian Fainelli wrote:
>> The CPU port of the BCM53125 is configured with RGMII (no delays) but
>> this should actually be RGMII with transmit delay (rgmii-txid) because
>> STMMAC takes care of inserting the transmitter delay. This fixes
>> occasional packet loss encountered.
>>
>> Fixes: d7b9eaff5f0c ("ARM: dts: sun7i: Add BCM53125 switch nodes to the lamobo-r1 board")
>> Reported-by: Hartmut Knaack <knaack.h@gmx.de>
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>
> Applied, thanks!
> Maxime

I'm not sure dwmac-sunxi supports "rgmii-txid" though.
At least I don't remember implementing it.

ChenYu
