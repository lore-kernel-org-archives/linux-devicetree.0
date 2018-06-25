From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] drivers: base: initcall_debug logs for driver probe
 times
Date: Mon, 25 Jun 2018 09:20:55 -0600
Message-ID: <20180625152055.GA23270@rob-hp-laptop>
References: <20180621003556.65578-1-toddpoynor@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180621003556.65578-1-toddpoynor@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Todd Poynor <toddpoynor@gmail.com>
Cc: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-team@android.com, Todd Poynor <toddpoynor@google.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 20, 2018 at 05:35:56PM -0700, Todd Poynor wrote:
> From: Todd Poynor <toddpoynor@google.com>
> 
> Add initcall_debug logs for each driver device probe call, for example:
> 
>    probe of a3800000.ramoops returned 1 after 3007 usecs
> 
> This replaces the previous code added to report times for deferred
> probes.  It also reports OF platform bus device creates that were
> formerly lumped together in a single entry for function
> of_platform_default_populate_init, as well as helping to annotate other
> initcalls that involve device probing.
> 
> Remove restriction on printing probe times only during initcalls, since
> initcall_debug now continues to show driver timing info past the boot
> phase.
> 
> Signed-off-by: Todd Poynor <toddpoynor@google.com>
> ---
>  drivers/base/dd.c | 50 +++++++++++++++++++++--------------------------
>  1 file changed, 22 insertions(+), 28 deletions(-)
> 
> Changes from v1:
> * unsigned long long -> s64
> * use ktime_to_us() instead of ktime_to_ns with shift
> * print probe return value
> * drop code that stopped output on end of initcall processing

Reviewed-by: Rob Herring <robh@kernel.org>
