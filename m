From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] Doc: mfd: as3722: Add details of optional missing
 property
Date: Wed, 9 Jul 2014 16:34:10 +0100
Message-ID: <20140709153410.GK2635@lee--X1>
References: <1402297417-9338-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1402297417-9338-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: robh+dt@kernel.org, swarren@nvidia.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com
List-Id: devicetree@vger.kernel.org

On Mon, 09 Jun 2014, Laxman Dewangan wrote:

> Add details of following properties which are used on driver but
> not documented on DT binding document.
> - ams,enable-internal-int-pullup
> - ams,enable-internal-i2c-pullup
>=20
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Reported-by: Lee Jones <lee.jones@linaro.org>
> ---
>  Documentation/devicetree/bindings/mfd/as3722.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)

Applied with Linus' Ack, thanks.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
