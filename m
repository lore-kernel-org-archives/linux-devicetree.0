From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] of/irq: Drop obsolete 'interrupts' vs 'interrupts-extended'
 text
Date: Sun, 02 Nov 2014 19:31:31 -0800
Message-ID: <5456F713.8090503@gmail.com>
References: <20141101233531.4958.96713.stgit@bhelgaas-glaptop2.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141101233531.4958.96713.stgit@bhelgaas-glaptop2.roam.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Le 01/11/2014 16:35, Bjorn Helgaas a =C3=A9crit :
> a9ecdc0fdc54 ("of/irq: Fix lookup to use 'interrupts-extended' proper=
ty
> first") updated the description to say that:
>
>    - Both 'interrupts' and 'interrupts-extended' may be present
>    - Software should prefer 'interrupts-extended'
>    - Software that doesn't comprehend 'interrupts-extended' may use
>      'interrupts'
>
> But there is still a paragraph at the end that prohibits having both =
and
> says 'interrupts' should be preferred.
>
> Remove the contradictory text.
>
> Fixes: a9ecdc0fdc54 ("of/irq: Fix lookup to use 'interrupts-extended'=
 property first")
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>

> CC: stable@vger.kernel.org	# v3.13+
> ---
>   .../bindings/interrupt-controller/interrupts.txt   |    4 ----
>   1 file changed, 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/i=
nterrupts.txt b/Documentation/devicetree/bindings/interrupt-controller/=
interrupts.txt
> index ce6a1a072028..8a3c40829899 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/interrup=
ts.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/interrup=
ts.txt
> @@ -30,10 +30,6 @@ should only be used when a device has multiple int=
errupt parents.
>     Example:
>   	interrupts-extended =3D <&intc1 5 1>, <&intc2 1 0>;
>
> -A device node may contain either "interrupts" or "interrupts-extende=
d", but not
> -both. If both properties are present, then the operating system shou=
ld log an
> -error and use only the data in "interrupts".
> -
>   2) Interrupt controller nodes
>   -----------------------------
>
>
