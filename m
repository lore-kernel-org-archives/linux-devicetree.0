From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCH 1/2] of: add vendor prefix for Mentor Graphics
Date: Fri, 20 Dec 2013 11:26:02 -0600
Message-ID: <D53158FF-7BCF-4BA8-A589-B6365B4DA058@codeaurora.org>
References: <1387470351-4696-1-git-send-email-bigeasy@linutronix.de>
Mime-Version: 1.0 (Mac OS X Mail 7.0 \(1822\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1387470351-4696-1-git-send-email-bigeasy@linutronix.de>
Sender: linux-doc-owner@vger.kernel.org
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Felipe Balbi <balbi@ti.com>, devicetree <devicetree@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>
List-Id: devicetree@vger.kernel.org


On Dec 19, 2013, at 10:25 AM, Sebastian Andrzej Siewior <bigeasy@linutr=
onix.de> wrote:

> This prefix is currently used for the musb driver.
>=20
> Acked-by: Stephen Warren <swarren@nvidia.com>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
> Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/=
Documentation/devicetree/bindings/vendor-prefixes.txt
> index 8c75d85..cb5c438 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -43,6 +43,7 @@ linux	Linux-specific binding
> lsi	LSI Corp. (LSI Logic)
> marvell	Marvell Technology Group Ltd.
> maxim	Maxim Integrated Products
> +mentor	Mentor Graphics

file like we should use =91ment=92, but not sure if we are going away f=
rom ticker symbols or not.

> microchip	Microchip Technology Inc.
> mosaixtech	Mosaix Technologies, Inc.
> national	National Semiconductor
> --=20
> 1.8.5.1
>=20

- k

--=20
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, host=
ed by The Linux Foundation

