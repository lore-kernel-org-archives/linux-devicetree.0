From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH v8 2/3] mtd: spi-nor: add rockchip serial flash controller driver
Date: Tue, 10 Apr 2018 15:34:57 -0300
Message-ID: <CAAEAJfCYm4Z20x8PdU3uHh_0BExTCAoOy5Aq=ZXWLJKaB1C9kQ@mail.gmail.com>
References: <1518091958-3672-1-git-send-email-andy.yan@rock-chips.com> <1518092327-3827-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1518092327-3827-1-git-send-email-andy.yan@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Yan <andy.yan@rock-chips.com>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, shawn.lin@rock-chips.com, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Boris Brezillon <boris.brezillon@free-electrons.com>
List-Id: devicetree@vger.kernel.org

Hi Andy,

Just a very minor nit.

On 8 February 2018 at 09:18, Andy Yan <andy.yan@rock-chips.com> wrote:
[..]
> +
> +static int get_if_type(struct rockchip_sfc *sfc, enum spi_nor_protocol proto)
> +{

I understand that this got copy-pasted from some other driver,
but please change this function name to something like
rockchip_sfc_get_if_type().

Thanks,
Eze
