From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/5 v2] ARM: at91: dt: switch to pre-processor
Date: Fri, 17 May 2013 10:28:35 +0200
Message-ID: <5195EA33.4010400@atmel.com>
References: <20130515141906.GI22508@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130515141906.GI22508-RQcB7r2h9QmfDR2tN2SG5Ni2O/JbrIOy@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 15/05/2013 16:19, Jean-Christophe PLAGNIOL-VILLARD :
> HI,
>
> 	v2:
> 	 use common IRQ define
> 	 split patch
> 	 rebase on 3.10-rc1
>
>          The follow patch series switch the at91 to DT pre-processor
>
>          So we can use macro for AIC and Pinctrl instead of magic

Hi, this is very good for me: nice to use the common GPIO and IRQ 
defines. It increases readability a lot!

So, it seems natural to push this series through arm-soc. It would be 
integrated early in a "cleanup" branch for 3.11.
We also would like to make it a prerequisite for all AT91 material that 
are touching the changed files, targeted for 3.11.

Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

Thanks, best regards.

> The following changes since commit f722406faae2d073cc1d01063d1123c35425939e:
>
>    Linux 3.10-rc1 (2013-05-11 17:14:08 -0700)
>
> are available in the git repository at:
>
>    git://github.com/at91linux/linux-at91.git j/for-3.11-dt
>
> for you to fetch changes up to 3668ac6a70bc5af71a947ad7b531c57b8a787ea0:
>
>    ARM: at91: dt: switch to standard IRQ flag defines (2013-05-15 21:56:18 +0800)
>
> ----------------------------------------------------------------
> Jean-Christophe PLAGNIOL-VILLARD (5):
>        ARM: at91: dt: use #include for all device trees
>        ARM: at91: dt: switch to standard GPIO flag defines.
>        ARM: at91: dt: add pinctrl pre-processor define
>        ARM: at91: dt: switch to pinctrl to pre-processor
>        ARM: at91: dt: switch to standard IRQ flag defines
>
>   arch/arm/boot/dts/aks-cdu.dts               |   12 +--
>   arch/arm/boot/dts/animeo_ip.dts             |   18 ++---
>   arch/arm/boot/dts/at91-ariag25.dts          |    6 +-
>   arch/arm/boot/dts/at91rm9200.dtsi           |  207 +++++++++++++++++++++++++------------------------
>   arch/arm/boot/dts/at91rm9200ek.dts          |   10 +--
>   arch/arm/boot/dts/at91sam9260.dtsi          |  215 ++++++++++++++++++++++++++-------------------------
>   arch/arm/boot/dts/at91sam9263.dtsi          |  203 ++++++++++++++++++++++++------------------------
>   arch/arm/boot/dts/at91sam9263ek.dts         |   24 +++---
>   arch/arm/boot/dts/at91sam9g15.dtsi          |    2 +-
>   arch/arm/boot/dts/at91sam9g15ek.dts         |    4 +-
>   arch/arm/boot/dts/at91sam9g20.dtsi          |    2 +-
>   arch/arm/boot/dts/at91sam9g20ek.dts         |    6 +-
>   arch/arm/boot/dts/at91sam9g20ek_2mmc.dts    |   10 +--
>   arch/arm/boot/dts/at91sam9g20ek_common.dtsi |   28 ++++---
>   arch/arm/boot/dts/at91sam9g25.dtsi          |    2 +-
>   arch/arm/boot/dts/at91sam9g25ek.dts         |    4 +-
>   arch/arm/boot/dts/at91sam9g35.dtsi          |    2 +-
>   arch/arm/boot/dts/at91sam9g35ek.dts         |    4 +-
>   arch/arm/boot/dts/at91sam9g45.dtsi          |  213 +++++++++++++++++++++++++-------------------------
>   arch/arm/boot/dts/at91sam9m10g45ek.dts      |   38 ++++-----
>   arch/arm/boot/dts/at91sam9n12.dtsi          |  141 +++++++++++++++++-----------------
>   arch/arm/boot/dts/at91sam9n12ek.dts         |   14 ++--
>   arch/arm/boot/dts/at91sam9x25.dtsi          |   22 +++---
>   arch/arm/boot/dts/at91sam9x25ek.dts         |    4 +-
>   arch/arm/boot/dts/at91sam9x35.dtsi          |    2 +-
>   arch/arm/boot/dts/at91sam9x35ek.dts         |    4 +-
>   arch/arm/boot/dts/at91sam9x5.dtsi           |  279 +++++++++++++++++++++++++++++++++---------------------------------
>   arch/arm/boot/dts/at91sam9x5cm.dtsi         |    8 +-
>   arch/arm/boot/dts/at91sam9x5ek.dtsi         |   14 ++--
>   arch/arm/boot/dts/ethernut5.dts             |    6 +-
>   arch/arm/boot/dts/evk-pro3.dts              |    6 +-
>   arch/arm/boot/dts/ge863-pro3.dtsi           |    2 +-
>   arch/arm/boot/dts/kizbox.dts                |   16 ++--
>   arch/arm/boot/dts/mpa1600.dts               |    4 +-
>   arch/arm/boot/dts/pm9g45.dts                |   22 +++---
>   arch/arm/boot/dts/sama5d3.dtsi              |  520 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-------------------------------------------------------------
>   arch/arm/boot/dts/sama5d31ek.dts            |    6 +-
>   arch/arm/boot/dts/sama5d33ek.dts            |    4 +-
>   arch/arm/boot/dts/sama5d34ek.dts            |    6 +-
>   arch/arm/boot/dts/sama5d35ek.dts            |    4 +-
>   arch/arm/boot/dts/sama5d3xcm.dtsi           |    4 +-
>   arch/arm/boot/dts/sama5d3xdm.dtsi           |    2 +-
>   arch/arm/boot/dts/sama5d3xmb.dtsi           |   26 +++----
>   arch/arm/boot/dts/tny_a9260.dts             |    4 +-
>   arch/arm/boot/dts/tny_a9263.dts             |    4 +-
>   arch/arm/boot/dts/tny_a9g20.dts             |    4 +-
>   arch/arm/boot/dts/usb_a9260.dts             |    4 +-
>   arch/arm/boot/dts/usb_a9260_common.dtsi     |    6 +-
>   arch/arm/boot/dts/usb_a9263.dts             |    8 +-
>   arch/arm/boot/dts/usb_a9g20-dab-mmx.dtsi    |   22 +++---
>   arch/arm/boot/dts/usb_a9g20.dts             |    4 +-
>   include/dt-bindings/pinctrl/at91.h          |   35 +++++++++
>   52 files changed, 1139 insertions(+), 1078 deletions(-)
>   create mode 100644 include/dt-bindings/pinctrl/at91.h
>
> Best Regards,
> J.
>
>


-- 
Nicolas Ferre
