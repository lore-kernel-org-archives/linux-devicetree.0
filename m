From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCHv2 2/3] staging: ion: Add files for parsing the devicetree
Date: Tue, 17 Nov 2015 09:15:49 +0300
Message-ID: <20151117061549.GM18797@mwanda>
References: <1447721855-7574-1-git-send-email-laura@labbott.name>
 <1447721855-7574-3-git-send-email-laura@labbott.name>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <1447721855-7574-3-git-send-email-laura@labbott.name>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Laura Abbott <laura@labbott.name>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Feng Tang <feng.tang@intel.com>, Andrew Andrianov <andrew@ncrmnt.org>, Tom Gall <tom.gall@linaro.org>, romlem@google.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, arve@android.com, Colin Cross <ccross@google.com>, linux-kernel@vger.kernel.org, Riley Andrews <riandrews@android.com>, Rob Herring <robh+dt@kernel.org>, John Stultz <john.stultz@linaro.org>, Grant Likely <grant.likely@linaro.org>, Frank Rowand <frowand.list@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 16, 2015 at 04:57:34PM -0800, Laura Abbott wrote:
> +	for_each_available_child_of_node(dt_node, node) {
> +		struct platform_device *heap_pdev;
> +
> +		ret = ion_parse_dt_heap_common(node, &heaps[i], compatible);
> +		if (ret)
> +			return ERR_PTR(ret);
> +
> +		heap_pdev = of_platform_device_create(node, heaps[i].name,
> +							&pdev->dev);

We should free these if something fails later in the function.

> +		if (!pdev)
> +			return ERR_PTR(-ENOMEM);
> +		heap_pdev->dev.platform_data = &heaps[i];
> +
> +		heaps[i].priv = &heap_pdev->dev;
> +
> +		ret = ion_setup_heap_common(pdev, node, &heaps[i]);
> +		if (ret)
> +			return ERR_PTR(ret);


regards,
dan carpenter
