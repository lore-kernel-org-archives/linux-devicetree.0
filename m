From: Alexander Kochetkov <al.kochet@gmail.com>
Subject: Re: [PATCH] dt-bindings: document how to setup rockchip timers as clocksource
Date: Thu, 1 Dec 2016 00:40:22 +0300
Message-ID: <F0C2F3CA-7A29-46B5-B420-A672696236BF@gmail.com>
References: <1480025536-6837-1-git-send-email-al.kochet@gmail.com> <20161130213006.p6totahjga7546s6@rob-hp-laptop>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161130213006.p6totahjga7546s6@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: mark.rutland@arm.com, wxt@rock-chips.com, daniel.lezcano@linaro.org, huangtao@rock-chips.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


> 1 =D0=B4=D0=B5=D0=BA. 2016 =D0=B3., =D0=B2 0:30, Rob Herring =
<robh@kernel.org> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB(=D0=B0):
>=20
> 1st and 2nd are ambiguous. Plus this is an OS implementation detail =
that=20
> doesn't belong in the binding.
>=20
>> +If you want to bind specific timer as clockevent (i.e. one from =
alive subsystem)
>> +and specific timer as clocksource, you can number the timers in =
"aliases" node.
>=20
> No.=20
>=20
> Use and/or describe what are the features of a timer to make the=20
> decision. There has to be some reason you care which one. One has an=20=

> interrupt and the other doesn't. One is always on. Etc.

Thank you, Rob.

Eventually I abandoned this decision.
I left only one patch, which you confirmed recently.

And sorry for making noise with duplicate patches.

Alexander.
