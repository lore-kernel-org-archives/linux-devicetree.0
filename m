From: Igor Grinberg <grinberg@compulab.co.il>
Subject: Re: [PATCH 2/2] ARM: dts: imx6q: add support for the Utilite Pro
Date: Thu, 26 May 2016 11:28:59 +0300
Message-ID: <5746B3CB.20804@compulab.co.il>
References: <1463957258-4893-1-git-send-email-christopher.spinrath@rwth-aachen.de>
 <c4ab0387041f42ada68296141befe332@rwthex-s1-b.rwth-ad.de>
 <CAOMZO5C5goJUdHKB9a=eOv9TKDkJWxnkWWb-G7E5Kvceg6sZVg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOMZO5C5goJUdHKB9a=eOv9TKDkJWxnkWWb-G7E5Kvceg6sZVg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fabio Estevam <festevam@gmail.com>, christopher.spinrath@rwth-aachen.de
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Shawn Guo <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Fabio,

On 05/23/2016 08:49 PM, Fabio Estevam wrote:
> On Sun, May 22, 2016 at 7:47 PM,  <christopher.spinrath@rwth-aachen.de> wrote:
> 
>> diff --git a/arch/arm/boot/dts/imx6q-utilite-pro.dts b/arch/arm/boot/dts/imx6q-utilite-pro.dts
>> new file mode 100644
>> index 0000000..bcd8e0d
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/imx6q-utilite-pro.dts
>> @@ -0,0 +1,128 @@
>> +/*
>> + * Copyright 2016 Christopher Spinrath
>> + * Copyright 2013 CompuLab Ltd.
>> + *
>> + * Based on the GPLv2 licensed devicetree distributed with the vendor
>> + * kernel for the Utilite Pro:
>> + *     Copyright 2013 CompuLab Ltd.
>> + *     Author: Valentin Raevsky <valentin@compulab.co.il>
>> + *
>> + * The code contained herein is licensed under the GNU General Public
>> + * License. You may obtain a copy of the GNU General Public License
>> + * Version 2 or later at the following locations:
> 
> Can you make this dual GPL/X11 license?
> 
> For reference take a look at:
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/imx6sl-warp.dts?id=refs/tags/v4.6

Please excuse me my ignorance, what is the rationale for this change?

-- 
Regards,
Igor.
