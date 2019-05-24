From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/3] of/fdt: Remove dead code and mark functions with
 __init
Date: Fri, 24 May 2019 16:39:15 -0500
Message-ID: <20190524213915.GA11208@bogus>
References: <20190514204053.124122-1-swboyd@chromium.org>
 <20190514204053.124122-3-swboyd@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190514204053.124122-3-swboyd@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Frank Rowand <frowand.list@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Hsin-Yi Wang <hsinyi@chromium.org>
List-Id: devicetree@vger.kernel.org

On Tue, 14 May 2019 13:40:52 -0700, Stephen Boyd wrote:
> Some functions in here are never called, and others are only called
> during __init. Remove the dead code and some dead exports for functions
> that don't exist (I'm looking at you of_fdt_get_string!). Mark some
> functions with __init so we can throw them away after we boot up and
> poke at the FDT blob too.
> 
> Cc: Hsin-Yi Wang <hsinyi@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/of/fdt.c       | 37 +++++--------------------------------
>  include/linux/of_fdt.h | 11 -----------
>  2 files changed, 5 insertions(+), 43 deletions(-)
> 

Applied, thanks.

Rob
