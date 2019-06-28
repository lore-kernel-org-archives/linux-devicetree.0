From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 0/3] riscv: add SOC_SIFIVE config for SiFive specific
 resource
Date: Thu, 27 Jun 2019 20:10:59 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.9999.1906272006410.3867@viisi.sifive.com>
References: <1560799790-20287-1-git-send-email-lollivier@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560799790-20287-1-git-send-email-lollivier@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Loys Ollivier <lollivier@baylibre.com>
Cc: Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>
List-Id: devicetree@vger.kernel.org

Hi Loys,

On Mon, 17 Jun 2019, Loys Ollivier wrote:

> Following is a patch series that adds a SOC_SIFIVE config.
> The purpose of this config is to group all the code specific to the SiFive
> architecture such as device tree and platform drivers.
> 
> The initial thought/discussion came from [0].
> 
> [0] https://lore.kernel.org/linux-riscv/20190602080500.31700-1-paul.walmsley@sifive.com/

Thanks for giving us a good start here.  Queued for v5.3 with Palmer's 
Reviewed-by:s.


- Paul
