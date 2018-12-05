From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: Kill off skeleton{64}.dtsi
Date: Wed, 5 Dec 2018 23:21:06 +0100
Message-ID: <CAFBinCCyiOurskMNYeJaC3YHZF0CCVJg7q61Gs=wdZYAH83NCw@mail.gmail.com>
References: <20181130170634.9467-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20181130170634.9467-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: andrew-g2DYL2Zd6BY@public.gmane.org, alexandre.belloni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org, david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, linux-stm32-XDFAJ8BFU24N7RejjzZ/Li2xQDfSxrLKVpNB7YpNyf8@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, jesper.nilsson-VrBV9hrLPhE@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, gregory.clement-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ludovic.desroches-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, linux-arm-kernel-VrBV9hrLPhE@public.gmane.org, antoine.tenart-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, slemieux.tyco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, lars.persson@ax
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Fri, Nov 30, 2018 at 6:07 PM Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>
> Remove the usage of skeleton.dtsi in the remaining dts files. It was
> deprecated since commit 9c0da3cc61f1 ("ARM: dts: explicitly mark
> skeleton.dtsi as deprecated"). This will make adding a unit-address to
> memory nodes easier.
thank you for cleaning this up!

> The main tricky part to removing skeleton.dtsi is we could end up with
> no /memory node at all when a bootloader depends on one being present. I
> hacked up dtc to check for this condition.
>
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
on Meson8b Odroid-C1:
Tested-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>

>  arch/arm/boot/dts/meson.dtsi                   |  3 ++-
>  arch/arm/boot/dts/meson6-atv1200.dts           |  1 +
>  arch/arm/boot/dts/meson8-minix-neo-x8.dts      |  1 +
>  arch/arm/boot/dts/meson8b-ec100.dts            |  1 +
>  arch/arm/boot/dts/meson8b-mxq.dts              |  1 +
>  arch/arm/boot/dts/meson8b-odroidc1.dts         |  1 +
>  arch/arm/boot/dts/meson8m2-mxiii-plus.dts      |  1 +
for the Meson changes:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>


Regards
Martin
