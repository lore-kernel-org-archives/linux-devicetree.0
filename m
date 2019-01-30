From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: Kill off skeleton{64}.dtsi
Date: Wed, 30 Jan 2019 17:31:31 +0100
Message-ID: <CAK8P3a04uO2Nz-M4NVgMsGy2BPRx9pM1cCuUeS54Jf8N18-9NQ@mail.gmail.com>
References: <20190109162614.30855-1-robh@kernel.org> <87h8ehpwm2.fsf@FE-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <87h8ehpwm2.fsf@FE-laptop>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Gregory CLEMENT <gregory.clement-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Alexandre Belloni <alexandre.belloni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-oxnas-GWfripvEmMdhl2p70BpVqQ@public.gmane.org, Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, linux-stm32-XDFAJ8BFU24N7RejjzZ/Li2xQDfSxrLKVpNB7YpNyf8@public.gmane.org, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jesper Nilsson <jesper.nilsson-VrBV9hrLPhE@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-VrBV9hrLPhE@public.gmane.org, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ludovic Desroches <ludovic.desroches-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, arm-soc <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Hauke
List-Id: devicetree@vger.kernel.org

On Wed, Jan 9, 2019 at 6:30 PM Gregory CLEMENT
<gregory.clement-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
>
> Hi Rob,
>
>  On mer., janv. 09 2019, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>
> > Remove the usage of skeleton.dtsi in the remaining dts files. It was
> > deprecated since commit 9c0da3cc61f1 ("ARM: dts: explicitly mark
> > skeleton.dtsi as deprecated"). This will make adding a unit-address to
> > memory nodes easier.
> >
> > The main tricky part to removing skeleton.dtsi is we could end up with
> > no /memory node at all when a bootloader depends on one being present. I
> > hacked up dtc to check for this condition.
>
>
> Reviewed-by: Gregory CLEMENT <gregory.clement-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
> and for Armada 38x:
> Tested-by: Gregory CLEMENT <gregory.clement-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
>

Applied to arm/dt now, thanks!

     Arnd
