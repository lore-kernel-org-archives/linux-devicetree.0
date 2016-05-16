From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] of/unittest: Remove unnecessary module.h header inclusion
Date: Mon, 16 May 2016 09:21:08 -0500
Message-ID: <20160516142108.GA9327@rob-hp-laptop>
References: <1462998379-25819-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1462998379-25819-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, May 11, 2016 at 04:26:18PM -0400, Javier Martinez Canillas wrote:
> The OF_UNITTEST Kconfig symbol is bool so this unittest can only be
> built-in and not build as a module. Also, nothing defined in this
> header file used so is not necessary to include it.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> ---
> 
>  drivers/of/unittest.c | 1 -
>  1 file changed, 1 deletion(-)

Applied, thanks.

Rob
