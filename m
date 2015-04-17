From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Subject: Re: [tpmdd-devel] [RFC PATCH 1/2] tee: generic TEE subsystem
Date: Fri, 17 Apr 2015 10:30:54 -0600
Message-ID: <20150417163054.GA28241@obsidianresearch.com>
References: <1429257057-7935-1-git-send-email-jens.wiklander@linaro.org>
 <1429257057-7935-2-git-send-email-jens.wiklander@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1429257057-7935-2-git-send-email-jens.wiklander@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, javier@javigon.com, valentin.manea@huawei.com, emmanuel.michel@st.com, Herbert Xu <herbert@gondor.apana.org.au>, jean-michel.delorme@st.com, tpmdd-devel@lists.sourceforge.net
List-Id: devicetree@vger.kernel.org

On Fri, Apr 17, 2015 at 09:50:56AM +0200, Jens Wiklander wrote:
> +	teedev = devm_kzalloc(dev, sizeof(*teedev), GFP_KERNEL);
[..]
> +	rc = misc_register(&teedev->miscdev);
[..]
> +void tee_unregister(struct tee_device *teedev)
> +{
[..]
> +	misc_deregister(&teedev->miscdev);
> +}
[..]
>+static int optee_remove(struct platform_device *pdev)
>+{
>+       tee_unregister(optee->teedev);

Isn't that a potential use after free? AFAIK misc_deregister does not
guarentee the miscdev will no longer be accessed after it returns, and
the devm will free it after optee_remove returns.

Memory backing a stuct device needs to be freed via the release
function.

We have been going through this for a while with TPM - it seems like
using misc devices dynamically is not a good idea. Manage your own
struct device directly..

Jason
