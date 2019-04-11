From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 1/6] arch: riscv: add support for building DTB files from
 DT source data
Date: Thu, 11 Apr 2019 04:46:16 -0700
Message-ID: <20190411114616.GA10032@infradead.org>
References: <20190411084304.5072-2-paul.walmsley@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190411084304.5072-2-paul.walmsley@sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Walmsley <paul.walmsley@sifive.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, Paul Walmsley <paul@pwsan.com>, Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 11, 2019 at 01:42:59AM -0700, Paul Walmsley wrote:
> Similar to ARM64, add support for building DTB files from DT source
> data for RISC-V boards.
> 
> This patch starts with the infrastructure needed for SiFive boards.
> Boards from other vendors would add support here in a similar form.

What do we build it for?  We'd really need something like this:

http://git.infradead.org/users/hch/misc.git/commitdiff/d6242aa147baf57e05e2932199c74d8d24b9926e
http://git.infradead.org/users/hch/misc.git/commitdiff/0cd5413c8094ab57b68e0629dacfed695f4c1ef1

To actually use the DT files.
