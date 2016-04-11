From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/2] PCI: iproc: Support DT property for ignoring aborts
 when probing
Date: Mon, 11 Apr 2016 09:57:59 +0100
Message-ID: <20160411085759.GA7088@leverpostej>
References: <1460238624-2086-1-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1460238624-2086-1-git-send-email-zajec5@gmail.com>
Sender: linux-pci-owner@vger.kernel.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, linux-pci@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org, Hauke Mehrtens <hauke@hauke-m.de>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Please Cc the device tree mailing list (devicetree@vger.kernel.org) whe=
n
sending device tree patches.

On Sat, Apr 09, 2016 at 11:50:23PM +0200, Rafa=C5=82 Mi=C5=82ecki wrote=
:
> Some devices (e.g. Northstar ones) may have bridges that forward
> harmless errors to the ARM core. In such case we need an option to
> add a handler ignoring them.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> ---
>  .../devicetree/bindings/pci/brcm,iproc-pcie.txt         |  6 ++++++
>  drivers/pci/host/pcie-iproc-platform.c                  |  2 ++
>  drivers/pci/host/pcie-iproc.c                           | 17 +++++++=
++++++++++
>  drivers/pci/host/pcie-iproc.h                           |  1 +
>  4 files changed, 26 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pci/brcm,iproc-pcie.tx=
t b/Documentation/devicetree/bindings/pci/brcm,iproc-pcie.txt
> index 01b88f4..c91b20a 100644
> --- a/Documentation/devicetree/bindings/pci/brcm,iproc-pcie.txt
> +++ b/Documentation/devicetree/bindings/pci/brcm,iproc-pcie.txt
> @@ -22,6 +22,12 @@ Optional properties:
> =20
>  - brcm,pcie-ob: Some iProc SoCs do not have the outbound address map=
ping done
>  by the ASIC after power on reset. In this case, SW needs to configur=
e it
> +- brcm,pcie-hook-abort-handler: During PCI bus probing (device enume=
ration)
> +  there can be errors that are expected and harmless. Unfortunately =
some bridges
> +  can't be configured to ignore them and they forward them to the AR=
M core
> +  triggering die().
> +  This property should be set in such case, it will make driver add =
its own
> +  handler ignoring such errors.

Rather than describing what the kernel should do, this should describe
the property of the hardware (e.g. this should be named something like
brcm,spurious-probing-abort).

Is there absolutely no mechanism to disable this, even if
board-specific?

Are the aborts synchronous or asynchronous?

When specifically do they actually occur?

Thanks,
Mark.
