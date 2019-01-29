From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v8 1/2] platform/mellanox: Add TmFifo driver for Mellanox
 BlueField Soc
Date: Wed, 30 Jan 2019 00:06:50 +0200
Message-ID: <CAHp75VeByqLAr3hakCTSO_M3xjUyt=A0bPgpWeSV62Vomcrsog@mail.gmail.com>
References: <b143b40446c1870fb8d422b364ead95d54552be9.1527264077.git.lsun@mellanox.com>
 <1548696487-8840-1-git-send-email-lsun@mellanox.com> <1548696487-8840-2-git-send-email-lsun@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548696487-8840-2-git-send-email-lsun@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Liming Sun <lsun@mellanox.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, David Woods <dwoods@mellanox.com>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Vadim Pasternak <vadimp@mellanox.com>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 28, 2019 at 7:28 PM Liming Sun <lsun@mellanox.com> wrote:
>
> This commit adds the TmFifo platform driver for Mellanox BlueField
> Soc. TmFifo is a shared FIFO which enables external host machine
> to exchange data with the SoC via USB or PCIe. The driver is based
> on virtio framework and has console and network access enabled.
>
> Reviewed-by: David Woods <dwoods@mellanox.com>
> Signed-off-by: Liming Sun <lsun@mellanox.com>


Please, go through this series taking into account review I just did
for your another patch.

On top of that, see recent (for few years I think) drivers what modern
APIs they are using, e.g. devm_.

-- 
With Best Regards,
Andy Shevchenko
