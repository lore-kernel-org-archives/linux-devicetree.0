From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v5 10/13] ARM: sun9i: smp: Move structures
Date: Tue, 3 Apr 2018 16:51:25 +0800
Message-ID: <CAGb2v66QTGkMC21SS-zAbToVcmOp3oO4YMbvC5SyWwA2kP8uGg@mail.gmail.com>
References: <20180403061836.3926-1-mylene.josserand@bootlin.com>
 <20180403061836.3926-11-mylene.josserand@bootlin.com> <20180403084745.zuq6o3tlxpvcynev@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180403084745.zuq6o3tlxpvcynev@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Myl=C3=A8ne_Josserand?= <mylene.josserand@bootlin.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Russell King <linux@armlinux.org.uk>, Marc Zyngier <marc.zyngier@arm.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, devicetree <devicetree@vger.kernel.org>, LABBE Corentin <clabbe.montjoie@gmail.com>, quentin.schulz@bootlin.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 3, 2018 at 4:47 PM, Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> On Tue, Apr 03, 2018 at 08:18:33AM +0200, Mylène Josserand wrote:
>> To prepare the support for sun8i-a83t, move some structures
>> at the beginning of the file.
>>
>> Signed-off-by: Mylène Josserand <mylene.josserand@bootlin.com>
>
> I'm not quite sure what would be the benefit from that, if it's was
> working before, then it would probably work in your case as welle, right?

You should only need to move struct sunxi_mc_smp_data, since you are reading
the is_sun9i field. I suppose you could also get away with adding a global
variable just for that, and not have to store an index or pointer. Then none
of this code movement would be necessary. It would be slightly harder to
understand, but it's still contained within this file, and it has a clear
purpose, so I would call that acceptable.

ChenYu
