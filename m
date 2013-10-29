From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/4] mfd: as3722: add clock driver as mfd-sub device for
 the ams AS3722
Date: Tue, 29 Oct 2013 08:21:22 -0700
Message-ID: <20131029152122.GD4231@lee--X1>
References: <1383049205-29620-1-git-send-email-ldewangan@nvidia.com>
 <1383049205-29620-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1383049205-29620-2-git-send-email-ldewangan@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: sameo@linux.intel.com, mturquette@linaro.org, dwmw2@infradead.org, anton@enomsg.org, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, rob.herring@calxeda.com, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, 29 Oct 2013, Laxman Dewangan wrote:

> Device ams AS3722 supports the one 32KHz clock output. The clock cont=
rol
> support is provided through clock driver.
>=20
> Add clock driver as mfd sub device to probe the clock driver.
>=20
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> ---
>  Documentation/devicetree/bindings/mfd/as3722.txt |    9 +++++++++
>  drivers/mfd/as3722.c                             |    3 +++

You need to seperate the DT binding from the drivers/mfd changes.

The MFD changes are fine of course.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
