From: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH] riscv: dts: sifive: Add missing "clock-frequency" to
 cpu0/cpu1 nodes
Date: Tue, 13 Aug 2019 09:06:14 +0800
Message-ID: <CAEUhbmVo9vNsKBD9oA3XtA07jr24PqKFYsEmGeKwLH6WaQdgsQ@mail.gmail.com>
References: <1565158960-12240-1-git-send-email-bmeng.cn@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1565158960-12240-1-git-send-email-bmeng.cn@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 7, 2019 at 2:22 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Add the missing "clock-frequency" property to the cpu0/cpu1 nodes
> for consistency with other cpu nodes.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
>
>  arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>

ping
