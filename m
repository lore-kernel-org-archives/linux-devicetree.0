From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 7/9] ARM: sunxi: Remove useless allwinner,drive property
Date: Tue, 4 Oct 2016 10:34:39 +0800
Message-ID: <CAGb2v65SmZqR-MJgNxa0RGUYyWgeLHQcQfa0b8U0XiEtp+RfBg@mail.gmail.com>
References: <cover.26c6f76b361d146fb079d744251f020ef6d2db7d.1475489558.git-series.maxime.ripard@free-electrons.com>
 <01cd77ccced851276fcb3625b3d7805f5260fb59.1475489558.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <01cd77ccced851276fcb3625b3d7805f5260fb59.1475489558.git-series.maxime.ripard@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 3, 2016 at 6:21 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> The allwinner,drive property set to 10mA was really considered as our
> default. Remove all those properties entirely to make that obvious.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Did you use sed or some other scripting tool to do this patch?
Including the command should make it easier to verify the result,
instead of having to go through the 93 files here.

ChenYu
