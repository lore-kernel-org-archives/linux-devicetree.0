From: Markus Mayer <markus.mayer-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/2] ARM: bcm281xx: Board specific reboot code
Date: Fri, 28 Jun 2013 14:00:26 -0700
Message-ID: <CAPdLdq=0k56kX01easzTb11AUo=Ew+DCrmMpq8=2ruEJEuMF3Q@mail.gmail.com>
References: <1372453018-5830-1-git-send-email-markus.mayer@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1372453018-5830-1-git-send-email-markus.mayer-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
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
To: ARM Kernel List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: Christian Daudt <csd-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Device Tree List <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Adding Christian who got dropped from the Cc list.

-Markus

On 28 June 2013 13:56, Markus Mayer <markus.mayer-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> This patch series adds reboot code and related device tree bindings needed
> for the bcm281xx family.
>
> Markus Mayer (2):
>   ARM: bcm281xx: Board specific reboot code
>   ARM: bcm281xx: DT changes for reboot code
>
>  .../devicetree/bindings/arm/bcm/bcm,kona-wdt.txt   |   15 ++++++
>  arch/arm/boot/dts/bcm11351.dtsi                    |    7 ++-
>  arch/arm/mach-bcm/Makefile                         |    4 +-
>  arch/arm/mach-bcm/board_bcm.c                      |   20 ++++++--
>  arch/arm/mach-bcm/kona.c                           |   54 ++++++++++++++++++++
>  arch/arm/mach-bcm/kona.h                           |   15 ++++++
>  6 files changed, 109 insertions(+), 6 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/arm/bcm/bcm,kona-wdt.txt
>  create mode 100644 arch/arm/mach-bcm/kona.c
>  create mode 100644 arch/arm/mach-bcm/kona.h
>
> --
> 1.7.9.5
>
>
