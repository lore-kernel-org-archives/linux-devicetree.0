From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] arm64: dts: rockchip: Add support for Khadas Edge/Edge-V/Captain boards
Date: Fri, 14 Jun 2019 13:31:28 +0200
Message-ID: <4121108.4RU3k1uWxS@phil>
References: <1559035267-1884-1-git-send-email-xieqinick@gmail.com> <2074921.iWOsiWxYGh@phil> <CAP4nuTU1BjmpXk5zqWTjBVyO=1ks-Rn65ryaxdQ=GiGa+VK6-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAP4nuTU1BjmpXk5zqWTjBVyO=1ks-Rn65ryaxdQ=GiGa+VK6-A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nick Xie <xieqinick@gmail.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, robh@kernel.org, nick@khadas.com
List-Id: devicetree@vger.kernel.org

Am Montag, 10. Juni 2019, 09:19:52 CEST schrieb Nick Xie:
> Hello Heiko,
> 
> Thanks for your review.
> 
> > Both Captain and Edge-V seem to be identical from a component point
> > of view, so should likely share the same dts, or is there some major
> > difference coming later?
> 
> This is the first patch to support Khadas Edge/Edge-V/Captain board, so I
> just add basic dts nodes.
> 
> For Captain has more peripherals then Edge-V, so the dts will be different
> in the future, but it is the same now.

Sounds reasonable, thanks for the clarification.


Heiko
