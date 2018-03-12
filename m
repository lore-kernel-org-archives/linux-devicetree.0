From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH] arm: dts: rk3288: Add missing #sound-dai-cells
Date: Mon, 12 Mar 2018 15:02:01 +0100
Message-ID: <18111539.xZD6rPs4DF@diego>
References: <20180301202537.30571-3-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180301202537.30571-3-robh@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, arm@kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 1. M=E4rz 2018, 21:25:35 CET schrieb Rob Herring:
> dtc now gives the following warning:
> =

> arch/arm/boot/dts/rk3288-tinker.dtb: Warning (sound_dai_property):
> /sound/simple-audio-card,codec: Missing property '#sound-dai-cells' in no=
de
> /hdmi@ff980000 or bad phandle (referred from sound-dai[0])
> =

> Add the missing #sound-dai-cells property.
> =

> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: linux-rockchip@lists.infradead.org
> Signed-off-by: Rob Herring <robh@kernel.org>

applied as fix for 4.16 (on 2018-03-05 already)

Thanks for the catch
Heiko
