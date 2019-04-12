From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 1/6] arch: riscv: add support for building DTB files from
 DT source data
Date: Thu, 11 Apr 2019 22:49:52 -0700
Message-ID: <20190412054952.GA26672@infradead.org>
References: <20190411084304.5072-2-paul.walmsley@sifive.com>
 <20190411114616.GA10032@infradead.org>
 <alpine.DEB.2.21.9999.1904111405470.19990@viisi.sifive.com>
 <3cf7f2d8-3039-7dd7-e243-77433b1f23a6@wdc.com>
 <alpine.DEB.2.21.9999.1904111618460.21321@viisi.sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.9999.1904111618460.21321@viisi.sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Atish Patra <atish.patra@wdc.com>, Christoph Hellwig <hch@infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Paul Walmsley <paul@pwsan.com>, Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 11, 2019 at 05:08:11PM -0700, Paul Walmsley wrote:
> However: the vast majority of users -- even embedded users -- will not use 
> a kernel with a bundled DTB.  This is because it irrevocably ties that 
> kernel binary to one specific board type.  I hope it is obvious why this 
> would be a non-starter for Linux distributions, and, more generally, 
> anyone who wants their kernels to be usable on multiple boards.  Those 
> distributors would need to ship one kernel binary per board, or bloat 
> their kernels with DTBs and come up with some new mechanism to select one.

Yes, that is the point why the DTB usually comes with the firmware.
In my case I need it because by nommu M-mode Linux port targeted to
the Kendrye _is_ the firmware and there is nothing else running on that
tiny system.

But why are you submitting the DTB files if there is not ways use them
from the kernel?  That is what I was wondering about.
