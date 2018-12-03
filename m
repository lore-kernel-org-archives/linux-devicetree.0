From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: Kill off skeleton{64}.dtsi
Date: Mon, 3 Dec 2018 12:02:29 +0800
Message-ID: <CAGb2v644LTpJ6XpCbhpBGYT3ZBr_Yt-4OVGQwNcOD15-+PqshA@mail.gmail.com>
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
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, alexandre.belloni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-oxnas-GWfripvEmMdhl2p70BpVqQ@public.gmane.org, Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>, david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>, robert.jarzmik-GANU6spQydw@public.gmane.org, linux-stm32-XDFAJ8BFU24N7RejjzZ/Li2xQDfSxrLKVpNB7YpNyf8@public.gmane.org, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, jesper.nilsson-VrBV9hrLPhE@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, gregory.clement-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-VrBV9hrLPhE@public.gmane.org, jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, ludovic.desroches-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, arm-soc <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>Jason Cooper <j>
List-Id: devicetree@vger.kernel.org

On Sat, Dec 1, 2018 at 1:06 AM Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>
> Remove the usage of skeleton.dtsi in the remaining dts files. It was
> deprecated since commit 9c0da3cc61f1 ("ARM: dts: explicitly mark
> skeleton.dtsi as deprecated"). This will make adding a unit-address to
> memory nodes easier.
>
> The main tricky part to removing skeleton.dtsi is we could end up with
> no /memory node at all when a bootloader depends on one being present. I
> hacked up dtc to check for this condition.
>
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
> Yes, I'm being lazy and not splitting this up into dozens of sub-arch
> patches. I don't think this should conflict nor should we be getting new
> dependencies on skeleton.dtsi. So please apply directly to arm-soc.
>
> Rob
>

[...]

>  arch/arm/boot/dts/sun5i-a10s.dtsi              |  4 ++--
>  arch/arm/boot/dts/sun5i-a13.dtsi               |  4 ++--
>  arch/arm/boot/dts/sun5i.dtsi                   |  9 +++++++--
>  arch/arm/boot/dts/sun6i-a31.dtsi               |  5 +++--
>  arch/arm/boot/dts/sun7i-a20.dtsi               |  5 +++--
>  arch/arm/boot/dts/sun8i-a23-a33.dtsi           |  4 ++--
>  arch/arm/boot/dts/sun8i-a23.dtsi               |  1 +
>  arch/arm/boot/dts/sun8i-a33.dtsi               |  1 +

Maxime recently took care of this for Allwinner/sunxi. It should already
be in linux-next now.

ChenYu
