From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v3] of: unittest: unflatten device tree on UML when
 testing
Date: Tue, 19 Feb 2019 17:49:10 -0800
Message-ID: <3ebcb18e-ffe3-95e5-07b4-950271e3c076@gmail.com>
References: <20190219235422.256847-1-brendanhiggins@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190219235422.256847-1-brendanhiggins@google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Brendan Higgins <brendanhiggins@google.com>, robh+dt@kernel.org, mcgrof@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2/19/19 3:54 PM, Brendan Higgins wrote:
> UML supports enabling OF, and is useful for running the device tree
> tests, so add support for unflattening device tree blobs so we can
> actually use it.
> 
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> ---
>  drivers/of/unittest.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
> index 84427384654d5..98f0dfc91c2a3 100644
> --- a/drivers/of/unittest.c
> +++ b/drivers/of/unittest.c
> @@ -2514,6 +2514,10 @@ static int __init of_unittest(void)
>  	int res;
>  
>  	/* adding data for unittest */
> +
> +	if (IS_ENABLED(CONFIG_UML))
> +		unittest_unflatten_overlay_base();
> +
>  	res = unittest_data_add();
>  	if (res)
>  		return res;
> 


Reviewed-by: Frank Rowand <frank.rowand@sony.com>
