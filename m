From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v4 4/4] ARM: dts: Specify VMMC and VQMMC on rk3288-evb
Date: Tue, 07 Apr 2015 23:37:30 +0200
Message-ID: <1457117.iiJ36z7dmV@diego>
References: <1426112117-18220-1-git-send-email-dianders@chromium.org> <1426112117-18220-4-git-send-email-dianders@chromium.org> <10565603.LCTpLmy44N@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <10565603.LCTpLmy44N@phil>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>, Seungwon Jeon <tgih.jun@samsung.com>, Mark Brown <broonie@kernel.org>, Alexandru Stan <amstan@chromium.org>, Alim Akhtar <alim.akhtar@samsung.com>, Sonny Rao <sonnyrao@chromium.org>, Andrew Bresticker <abrestic@chromium.org>, Addy Ke <addy.ke@rock-chips.com>, javier.martinez@collabora.co.uk, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 12. M=E4rz 2015, 00:30:14 schrieb Heiko Stuebner:
> Am Mittwoch, 11. M=E4rz 2015, 15:15:17 schrieb Doug Anderson:
> > Specifying these rails should eventually let us do UHS.
> >=20
> > Signed-off-by: Doug Anderson <dianders@chromium.org>
>=20
> This one looks good to me and I'll take it into my dts branch.
>=20
> But due to the deferal issue fixed in patch1, I'll wait a bit for pat=
ch1
> hopefully getting applied, so that we have a "clean" behaviour when
> everything reaches linux-next.

looks like patch1 made it into the mmc tree [0], which was the prequisi=
te for=20
this one. Therefore applied to my dts branch.


Heiko


[0]=20
https://git.linaro.org/people/ulf.hansson/mmc.git/commit/b793f658b194ed=
fe5e1d86aaeace01a7b03c68f9
