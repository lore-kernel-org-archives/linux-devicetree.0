From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 6/6] MAINTAINERS: Add linux-actions mailing list for
 Actions Semi
Date: Mon, 31 Dec 2018 11:12:18 -0800
Message-ID: <2a7f53c58896e2a9c3115a8630040b98497e5877.camel@perches.com>
References: <20181231185517.18517-1-manivannan.sadhasivam@linaro.org>
         <20181231185517.18517-7-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181231185517.18517-7-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, sboyd@kernel.org, mturquette@baylibre.com, afaerber@suse.de, robh+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 2019-01-01 at 00:25 +0530, Manivannan Sadhasivam wrote:
> Add the linux-actions mailing list for Actions Semi SoC architecture.

Unrelated to adding this L: entry

> diff --git a/MAINTAINERS b/MAINTAINERS
[]
> @@ -1240,6 +1240,7 @@ ARM/ACTIONS SEMI ARCHITECTURE
>  M:	Andreas Färber <afaerber@suse.de>
>  R:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> +L:	linux-actions@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
>  N:	owl

The N: entry matches too many non-owl entries like:

Documentation/parport-lowlevel.txt
drivers/misc/ibmasm/lowlevel.c
drivers/misc/ibmasm/lowlevel.h
fs/udf/lowle
vel.c
net/ipv6/ip6_flowlabel.c
sound/soc/samsung/lowland.c

Maybe there should be two entries

N:	/owl
N:	-owl
