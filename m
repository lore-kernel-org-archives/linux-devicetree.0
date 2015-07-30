From: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH v2 1/2] powerpc/mpc85xx: Create dts components for the
 FSL QorIQ DPAA FMan
Date: Thu, 30 Jul 2015 14:59:49 -0500
Message-ID: <1438286389.2993.365.camel@freescale.com>
References: <1438230764-10951-1-git-send-email-igal.liberman@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438230764-10951-1-git-send-email-igal.liberman@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: igal.liberman@freescale.com
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, madalin.bucur@freescale.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 2015-07-30 at 07:32 +0300, Igal.Liberman wrote:
> +fman0:  fman@400000{
> +     #address-cells = <1>;
> +     #size-cells = <1>;
> +     cell-index = <0>;
> +     compatible = "fsl,fman";
> +     ranges = <0 0x400000 0x100000>;
> +     reg = <0x400000 0x100000>;
> +     interrupts = <96 2 0 0>, <16 2 1 1>;
> +     clocks = <&clockgen 3 0>;
> +     clock-names = "fm0clk";

clock-names should be "fmanclk" as per the binding.  And why would you want 
the driver to have to encode the fman index into the name in order to look 
the clock up by name?

-Scott
