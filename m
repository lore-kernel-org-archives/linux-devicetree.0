From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH 09/11] ARM: dts: omap3-igep0020-rev-f: Support IGEPv2 Rev. F
Date: Sun, 9 Nov 2014 11:16:16 +0100
Message-ID: <CABxcv=knJ3f6di62MVz+xuWn64aM_wc3Cb7=O8o6zjb+HJaV1Q@mail.gmail.com>
References: <1415275311-6857-1-git-send-email-eballetbo@iseebcn.com>
	<1415275311-6857-10-git-send-email-eballetbo@iseebcn.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1415275311-6857-10-git-send-email-eballetbo@iseebcn.com>
Sender: linux-omap-owner@vger.kernel.org
To: Enric Balletbo i Serra <eballetbo@iseebcn.com>
Cc: "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, Tony Lindgren <tony@atomide.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hello Enric,

On Thu, Nov 6, 2014 at 1:01 PM, Enric Balletbo i Serra
<eballetbo@iseebcn.com> wrote:
> Add support for the new hardware revision of the IGEPv2. Basically, the new
> revision F replaces the old Wifi module for a Wilink8 based module.
>
> Signed-off-by: Enric Balletbo i Serra <eballetbo@iseebcn.com>

I wonder if now that you added the omap3-igep00{2,3}0-common.dtsi
files, it could make sense to add support for all the different
variations of IGEPv2 and IGEP COM Modules using both NAND and OneNAND
flash memories.

But that is a question unrelated to this patch so for $subject:

Acked-by: Javier Martinez Canillas <javier@dowhile0.org>

Best regards,
Javier
