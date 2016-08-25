From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH V5] clk: bcm: Add driver for BCM53573 ILP clock
Date: Thu, 25 Aug 2016 16:11:40 +0200
Message-ID: <CACna6rzUc2Gz2JJdTC_S3+Fo24X4rTisxRz7-THvnyCt5rk4Xw@mail.gmail.com>
References: <20160823061745.8162-1-zajec5@gmail.com> <20160823062613.13865-1-zajec5@gmail.com>
 <20160824084738.GB6502@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160824084738.GB6502@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Eric Anholt <eric@anholt.net>, Jon Mason <jonmason@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 24 August 2016 at 10:47, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 08/23, Rafa=C5=82 Mi=C5=82ecki wrote:
>> +static int bcm53573_ilp_enable(struct clk_hw *hw)
>> +{
>> +     struct bcm53573_ilp *ilp =3D container_of(hw, struct bcm53573_ilp,=
 hw);
>> +
>> +     writel(0x10199, ilp->pmu + PMU_SLOW_CLK_PERIOD);
>> +     writel(0x10000, ilp->pmu + 0x674);
>
> Is there a name for 0x674?

No in any sources published by Broadcom. I was experimenting with bit
0x10000 in PMU_SLOW_CLK_PERIOD and 0x10000 in 0x674. Both have to be
set. I was suspecting that maybe one of them is just some trigger and
it can be switched back to 0, but it's not the case. I definitely need
to set both of them to get clock working.
