From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH] riscv: dts: sifive: Add missing "clock-frequency" to
 cpu0/cpu1 nodes
Date: Tue, 13 Aug 2019 08:00:00 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.9999.1908130758550.27195@viisi.sifive.com>
References: <1565158960-12240-1-git-send-email-bmeng.cn@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1565158960-12240-1-git-send-email-bmeng.cn@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, 6 Aug 2019, Bin Meng wrote:

> Add the missing "clock-frequency" property to the cpu0/cpu1 nodes
> for consistency with other cpu nodes.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Is this being driven by a schema validator warning?  If not, and this 
property isn't required, it seems better just to drop it.  It seems 
useless?


- Paul
