From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V2 09/12] dtb: amd: Add KCS device tree node
Date: Tue, 09 Feb 2016 15:59:17 +0100
Message-ID: <4018438.bPuTyoUuqf@wuerfel>
References: <1454954357-8395-1-git-send-email-Suravee.Suthikulpanit@amd.com> <1454954357-8395-10-git-send-email-Suravee.Suthikulpanit@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1454954357-8395-10-git-send-email-Suravee.Suthikulpanit@amd.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, arm@kernel.org, brijeshkumar.singh@amd.com, thomas.lendacky@amd.com, leo.duran@amd.com, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: devicetree@vger.kernel.org

On Monday 08 February 2016 11:59:14 Suravee Suthikulpanit wrote:
> +
> +               ipmi_kcs: kcs@e0010000 {
> +                       status = "disabled";
> +                       compatible = "ipmi-kcs";
> +                       device_type = "ipmi";
> +                       reg = <0x0 0xe0010000 0 0x8>;
> +                       interrupts = <0 389 4>;
> +                       interrupt-names = "ipmi_kcs";
> +                       reg-size = <1>;
> +                       reg-spacing = <4>;
> +               };
>         };
> 

I see we don't have a binding file for this, can you add one please?


Why the strange name for the interrupt?

	Arnd
