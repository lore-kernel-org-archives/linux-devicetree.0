From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 3/3] watchdog: dw_wdt: add a devicetree binding
Date: Thu, 27 Jun 2013 12:01:40 +0530
Message-ID: <CAK9yfHzY5uPLmGVjHYGPbqR3_YKdMXCwkcOgowURRdf+8uPwtg@mail.gmail.com>
References: <201306262003.13256.heiko@sntech.de>
	<201306262005.05765.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201306262005.05765.heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Wim Van Sebroeck <wim@iguana.be>, Jamie Iles <jamie@jamieiles.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 26 June 2013 23:35, Heiko St=FCbner <heiko@sntech.de> wrote:
> The dw_wdt does not use any platform-specific data, so no new propert=
ies
> need to be introduced. The dw-apb-wdt naming follows other designware
> components in the kernel and is also written like this in documentati=
on
> describing the component.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  .../devicetree/bindings/watchdog/snps-dw-apb-wdt.txt |   18 ++++++++=
++++++++++
>  drivers/watchdog/dw_wdt.c                            |   10 ++++++++=
++
>  2 files changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/snps-d=
w-apb-wdt.txt
>
> diff --git a/Documentation/devicetree/bindings/watchdog/snps-dw-apb-w=
dt.txt b/Documentation/devicetree/bindings/watchdog/snps-dw-apb-wdt.txt
> new file mode 100644
> index 0000000..c20cdd1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/snps-dw-apb-wdt.txt
> @@ -0,0 +1,18 @@
> +* Synosis DesignWare APB Watchdog

Probably should be Synopsis?


--=20
With warm regards,
Sachin
