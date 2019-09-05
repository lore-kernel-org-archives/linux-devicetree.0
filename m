From: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH] riscv: dts: sifive: Add missing "clock-frequency" to
 cpu0/cpu1 nodes
Date: Thu, 5 Sep 2019 20:01:41 +0800
Message-ID: <CAEUhbmV8v2rjhAZfOMauJC15eZpxYUZ=9YS-YN2dhNRv4H8bEg@mail.gmail.com>
References: <1565158960-12240-1-git-send-email-bmeng.cn@gmail.com> <alpine.DEB.2.21.9999.1908130758550.27195@viisi.sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.21.9999.1908130758550.27195@viisi.sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 13, 2019 at 11:00 PM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
> On Tue, 6 Aug 2019, Bin Meng wrote:
>
> > Add the missing "clock-frequency" property to the cpu0/cpu1 nodes
> > for consistency with other cpu nodes.
> >
> > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>
> Is this being driven by a schema validator warning?  If not, and this
> property isn't required, it seems better just to drop it.  It seems
> useless?
>

Yes, I think we can drop it. I will send v2.

Regards,
Bin
