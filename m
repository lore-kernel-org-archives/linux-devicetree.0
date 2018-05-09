From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Subject: Re: [PATCH 3/4] rtc: ds1307: add calibration of_ for mt41txx chips.
Date: Wed, 9 May 2018 20:31:39 +0200
Message-ID: <4d1b1ead-9439-210e-f246-cb49219390f5@micronovasrl.com>
References: <20180508145611.49072-1-giulio.benetti@micronovasrl.com>
 <20180508145611.49072-3-giulio.benetti@micronovasrl.com>
 <20180508191956.GP10960@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180508191956.GP10960@piout.net>
Content-Language: it
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: a.zummo@towertech.it, robh+dt@kernel.org, mark.rutland@arm.com, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Alexandre,

Il 08/05/2018 21:19, Alexandre Belloni ha scritto:
> Hi,
> 
> There is a sysfs interface for calibration, please use it. this is
> especially useful since the calibration value probably depend on
> temperature so it has to be updated dynamically to be really useful.
> 
> See https://elixir.bootlin.com/linux/v4.16.7/source/Documentation/ABI/testing/sysfs-class-rtc#L68
> and https://elixir.bootlin.com/linux/v4.16.7/source/drivers/rtc/interface.c#L999
> 

Used sysfs now and just submitted V2 patchset.
Thanks for pointing me those links.

-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ¤ 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642
