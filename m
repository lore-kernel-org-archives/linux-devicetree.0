From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 00/10] Support TI Light Management Unit devices
Date: Fri, 14 Feb 2014 10:14:39 +0000
Message-ID: <20140214101439.GA9462@lee--X1>
References: <1392359410-6852-1-git-send-email-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1392359410-6852-1-git-send-email-milo.kim@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Milo Kim <milo.kim@ti.com>
Cc: Jingoo Han <jg1.han@samsung.com>, Bryan Wu <cooloney@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>
List-Id: devicetree@vger.kernel.org

> Milo Kim (10):
>   mfd: Add TI LMU driver
>   backlight: Add TI LMU backlight common driver
>   backlight: ti-lmu-backlight: Add LM3532 driver
>   backlight: ti-lmu-backlight: Add LM3631 driver
>   backlight: ti-lmu-backlight: Add LM3633 driver
>   backlight: ti-lmu-backlight: Add LM3695 driver
>   backlight: ti-lmu-backlight: Add LM3697 driver
>   leds: Add LM3633 driver
>   regulator: Add LM3631 driver
>   Documentation: Add device tree bindings for TI LMU devices

It makes it much easier to track if you send your patch set (shallow)
threaded i.e. all patches attached to [PATCH 0/x]. Having all of the
patches sent individually they will get split up and spread out all
over the reviewers INBOX, which becomes unwieldy very quickly.

Please see git send-email options:
  `--[no-]thread` and `--[no-]chain-reply-to`

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
