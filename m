From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 4/6] rtc: pm8xxx: add support for devicetree
Date: Thu, 6 Mar 2014 17:18:30 +0800
Message-ID: <20140306091830.GB16034@lee--X1>
References: <1394047776-13827-1-git-send-email-joshc@codeaurora.org>
 <1394047776-13827-5-git-send-email-joshc@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1394047776-13827-5-git-send-email-joshc@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Josh Cartwright <joshc@codeaurora.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>, David Brown <davidb@codeaurora.org>, Daniel Walker <dwalker@fifo99.com>, Bryan Huntsman <bryanh@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, rtc-linux@googlegroups.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

> Add support for describing the PM8921/PM8058 RTC in device tree.
>=20
> Additionally:
>    - drop support for describing the RTC using platform data,
>      as there are no current in tree users who do so.
>    - make allow_set_time a device-specific flag, instead of mucking
>      with the rtc_ops
>=20
> Signed-off-by: Josh Cartwright <joshc@codeaurora.org>
> ---
>  drivers/rtc/rtc-pm8xxx.c       | 54 +++++++++++++++++++++++---------=
----------
>  include/linux/mfd/pm8xxx/rtc.h | 25 -------------------

=46or the MFD changes@:
  Acked-by: Lee Jones <lee.jones@linaro.org>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
