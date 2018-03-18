From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] of: unittest: move misplaced function declaration
Date: Sun, 18 Mar 2018 07:49:28 -0500
Message-ID: <20180318124928.jl4w7u6uvshvacka@rob-hp-laptop>
References: <20180313131600.85356-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180313131600.85356-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 13, 2018 at 02:15:42PM +0100, Arnd Bergmann wrote:
> The overlay_data_apply() declaration is outside of the #ifdef that contains
> both the user and the definition, causing a compile-time warning in
> some configurations:
> 
> drivers/of/unittest.c:48:19: error: 'overlay_data_apply' declared 'static' but never defined [-Werror=unused-function]
>  static int __init overlay_data_apply(const char *overlay_name, int *overlay_id);
> 
> This moves the declaration into the #ifdef section.
> 
> Fixes: 39a751a4cb7e ("of: change overlay apply input data from unflattened to FDT")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/of/unittest.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied.
