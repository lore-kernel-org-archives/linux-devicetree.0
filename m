From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] of: overlay: update phandle cache on overlay apply and
 remove
Date: Fri, 20 Jul 2018 09:06:50 -0600
Message-ID: <20180720150650.GA32296@rob-hp-laptop>
References: <1531429207-3245-1-git-send-email-frowand.list@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1531429207-3245-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: frowand.list@gmail.com
Cc: Alan Tull <atull@kernel.org>, pantelis.antoniou@konsulko.com, Pantelis Antoniou <panto@antoniou-consulting.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, geert@linux-m68k.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 12, 2018 at 02:00:07PM -0700, frowand.list@gmail.com wrote:
> From: Frank Rowand <frank.rowand@sony.com>
> 
> A comment in the review of the patch adding the phandle cache said that
> the cache would have to be updated when modules are applied and removed.
> This patch implements the cache updates.
> 
> Fixes: 0b3ce78e90fc ("of: cache phandle nodes to reduce cost of of_find_node_by_phandle()")
> Reported-by: Alan Tull <atull@kernel.org>
> Suggested-by: Alan Tull <atull@kernel.org>
> Signed-off-by: Frank Rowand <frank.rowand@sony.com>
> ---
> 
> Changes since RFC:
>   - update code comment to mention race condition avoidance
> 
> For the RFC version of this patch, the 0day test reported a general
> protection fault from the KASAN runtime memory debugger on x86_64
> in qemu.  The GPF was in a devicetree unittest.
> 
> 0day tested the patch on v4.17-rc1, with some other patches applied.
> I was unable to replicate the GPF on v4.18-rc1 with just this patch
> applied.  I was also unable to replicate the GPF on a clone of the
> v4.17-rc1 0day repository, using the 0day kernel config.  I will
> reply to this email with the 0day GPF report.

Didn't see any 0-day issues, so I've applied and it is in Linus' tree 
now.

Rob
