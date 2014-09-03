From: Jean-Michel Hautbois <jean-michel.hautbois@vodalys.com>
Subject: PFUZE100 regulator not going off when PWRON is 0
Date: Wed, 3 Sep 2014 11:44:22 +0200
Message-ID: <CAL8zT=hNnRU3gbprVXOMt6FC9veRvQKRmS9gSeCm5-DNfGv-xg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel <linux-kernel@vger.kernel.org>
Cc: lgirdwood@gmail.com, devicetree@vger.kernel.org, robh+dt@kernel.org, grant.likely@linaro.org, broonie@kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

I have a custom i.MX6 based board, but PMIC part is exactly the same
as the Freescale SabreSD board.
I have a reset button, which makes the PWRON signal on PFUZE100 go from 1 to 0.
I thought this would reset the chip, and thus all voltages would go to
0, but this is not the case. It seems that SWxOMODE registers are
involved in this process, accorgind to the datasheet, but I don't
think this is implemented right now.

I also removed regulator-always-on for my SW2 pin in order to get it
off, but this has no effect.

Thanks for your advices,
JM
