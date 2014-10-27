From: NEO-Technologies / Julien CHAUVEAU <julien.chauveau@neo-technologies.fr>
Subject: Re: [PATCH] ARM: dts: rockchip: use internal pull-up resistors on
 I2C busses
Date: Mon, 27 Oct 2014 09:02:57 +0100
Message-ID: <544DFC31.4090307@neo-technologies.fr>
References: <1413556830-27854-1-git-send-email-julien.chauveau@neo-technologies.fr>
 <8843018.dv9ckEkBvo@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <8843018.dv9ckEkBvo@diego>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?windows-1252?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, open list <linux-kernel@vger.kernel.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, "moderated list:ARM/Rockchip SoC..." <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Heiko,

Le 27/10/2014 01:27, Heiko St=FCbner a =E9crit :
> The rk3066a does not support distinguishing between up and down pulls. On=
 it
> only &pcfg_pull_default is possible that configures the pull to a pin-spe=
cific
> pull direction. For the i2c pins the direction is (of course) "up".

Thank you for the information. I will send a new patch to fix the pull =

configuration for the rk3066a.

Julien
