From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] drivers: base: initcall_debug logs for driver probe times
Date: Wed, 20 Jun 2018 11:42:07 +0900
Message-ID: <20180620024207.GA2694@kroah.com>
References: <20180620023903.242758-1-toddpoynor@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180620023903.242758-1-toddpoynor@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Todd Poynor <toddpoynor@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@android.com, Todd Poynor <toddpoynor@google.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 19, 2018 at 07:39:03PM -0700, Todd Poynor wrote:
> From: Todd Poynor <toddpoynor@google.com>
> 
> Add initcall_debug logs for each driver device probe call, for example:
> 
>    probe of a3800000.ramoops returned after 3007 usecs
> 
> This replaces the previous code added to report times for deferred
> probes.  It also reports OF platform bus device creates that were
> formerly lumped together in a single entry for function
> of_platform_default_populate_init, as well as helping to annotate other
> initcalls that involve device probing.
> 
> Signed-off-by: Todd Poynor <toddpoynor@google.com>
> ---
>  drivers/base/dd.c | 50 +++++++++++++++++++++++------------------------
>  1 file changed, 24 insertions(+), 26 deletions(-)

New features with less lines of code, nice!

I'll queue this up soon, very good work.

greg k-h
