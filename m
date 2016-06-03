From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] of: irq: don't return 0 from of_irq_get()
Date: Fri, 3 Jun 2016 07:14:32 -0500
Message-ID: <20160603121432.GB8472@rob-hp-laptop>
References: <20938812.efaALfQEUn@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20938812.efaALfQEUn@wasted.cogentembedded.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: grant.likely@linaro.org, devicetree@vger.kernel.org, frowand.list@gmail.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, May 29, 2016 at 12:53:08AM +0300, Sergei Shtylyov wrote:
> of_irq_get() returns 0 iff irq_create_of_mapping() call fails. Returning
> both error code  and 0 on failure is a sign of a misdesigned API. Return
> -ENXIO instead like one of the callers, platform_get_irq(), does; fix up
> the kernel-doc as well...
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

So I think this is done this way because of the variation in NO_IRQ 
definition across architectures. But then again, of_irq_get is 
relatively new.

Rob
