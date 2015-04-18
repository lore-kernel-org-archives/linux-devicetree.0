From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [RFC PATCH 2/2] tee: add OP-TEE driver
Date: Sat, 18 Apr 2015 10:57:47 +0200
Message-ID: <20150418085747.GC29858@kroah.com>
References: <1429257057-7935-1-git-send-email-jens.wiklander@linaro.org>
 <1429257057-7935-3-git-send-email-jens.wiklander@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1429257057-7935-3-git-send-email-jens.wiklander@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, javier@javigon.com, Herbert Xu <herbert@gondor.apana.org.au>, tpmdd-devel@lists.sourceforge.net, valentin.manea@huawei.com, jean-michel.delorme@st.com, emmanuel.michel@st.com
List-Id: devicetree@vger.kernel.org

On Fri, Apr 17, 2015 at 09:50:57AM +0200, Jens Wiklander wrote:
> Adds mostly stubbed OP-TEE driver which also can be compiled as a
> loadable module.

Please provide a "real" driver, so that we can see how this is all going
to work.  Otherwise it's not really that useful to create some framework
that nothing in-kernel is going to use.

thanks,

greg k-h
