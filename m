From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] of/platform: fix of_platform_device_destroy comment
Date: Thu, 10 Nov 2016 14:56:28 -0600
Message-ID: <20161110205628.jmjzptaxe7fgsaqc@rob-hp-laptop>
References: <1477997602-29652-1-git-send-email-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1477997602-29652-1-git-send-email-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 01, 2016 at 11:53:21AM +0100, Johan Hovold wrote:
> Update the comment to of_platform_device_destroy() to reflect that it no
> longer returns a status value.
> 
> Fixes: 75f353b61342 ("of/platform: Fix of_platform_device_destroy...")
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/of/platform.c | 3 ---
>  1 file changed, 3 deletions(-)

Both patches applied.

Rob
