From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 1/6] drivers: bus: add a new driver for WEIM
Date: Thu, 6 Jun 2013 23:09:37 +0800
Message-ID: <20130606150935.GD28270@S2101-09.ap.freescale.net>
References: <1369722012-6915-1-git-send-email-b32955@freescale.com>
 <1369722012-6915-2-git-send-email-b32955@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1369722012-6915-2-git-send-email-b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
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
To: Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: shc_work-JGs/UdohzUI@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, May 28, 2013 at 02:20:07PM +0800, Huang Shijie wrote:
> The WEIM(Wireless External Interface Module) works like a bus.
> You can attach many different devices on it, such as NOR, onenand.
> 
> In the case of i.MX6q-sabreauto, the NOR is connected to WEIM.
> 
> This patch also adds the devicetree binding document.
> The driver only works when the devicetree is enabled.
> 
> Signed-off-by: Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/bus/imx-weim.txt |   49 +++++++
>  drivers/bus/Kconfig                                |    9 ++
>  drivers/bus/Makefile                               |    1 +
>  drivers/bus/imx-weim.c                             |  138 ++++++++++++++++++++
>  4 files changed, 197 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/bus/imx-weim.txt
>  create mode 100644 drivers/bus/imx-weim.c

Since no one is collecting drivers/bus/ patches right now, I just
applied the whole series to have the patch go via imx -> arm-soc.
Please let me know if there is any problem.

Shawn
