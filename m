From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] docs: fix some broken references
Date: Wed, 02 Oct 2019 09:19:29 -0500
Message-ID: <5d94b1f4.1c69fb81.6f9ad.2586@mx.google.com>
References: <b87385b2ac6ce6c75df82062fce2976149bbaa6b.1569330078.git.mchehab+samsung@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b87385b2ac6ce6c75df82062fce2976149bbaa6b.1569330078.git.mchehab+samsung@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, corbet@lwn.net, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Shannon Nelson <snelson@pensando.io>, Pensando Drivers <drivers@pensando.io>, Steve French <sfrench@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-mips@vger.kernel.org, netdev@vger.kernel.org, linux-rdma@vger.kernel.org, linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, linux-riscv@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, 24 Sep 2019 10:01:28 -0300, Mauro Carvalho Chehab wrote:
> There are a number of documentation files that got moved or
> renamed. update their references.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
>  Documentation/devicetree/bindings/cpu/cpu-topology.txt    | 2 +-
>  Documentation/devicetree/bindings/timer/ingenic,tcu.txt   | 2 +-
>  Documentation/driver-api/gpio/driver.rst                  | 2 +-
>  Documentation/hwmon/inspur-ipsps1.rst                     | 2 +-
>  Documentation/mips/ingenic-tcu.rst                        | 2 +-
>  Documentation/networking/device_drivers/mellanox/mlx5.rst | 2 +-
>  MAINTAINERS                                               | 2 +-
>  drivers/net/ethernet/faraday/ftgmac100.c                  | 2 +-
>  drivers/net/ethernet/pensando/ionic/ionic_if.h            | 4 ++--
>  fs/cifs/cifsfs.c                                          | 2 +-
>  10 files changed, 11 insertions(+), 11 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
