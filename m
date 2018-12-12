From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 3/6] misc: fastrpc: Add support for context Invoke
 method
Date: Wed, 12 Dec 2018 12:02:34 +0100
Message-ID: <20181212110234.GB1990@kroah.com>
References: <20181207163513.16412-1-srinivas.kandagatla@linaro.org>
 <20181207163513.16412-4-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181207163513.16412-4-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: robh+dt@kernel.org, arnd@arndb.de, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, bkumar@qti.qualcomm.com, thierry.escande@linaro.org
List-Id: devicetree@vger.kernel.org

On Fri, Dec 07, 2018 at 04:35:10PM +0000, Srinivas Kandagatla wrote:
> +#define FASTRPC_BUILD_SCALARS(attr, method, in, out, oin, oout) \
> +		((((uint32_t)  (attr) & 0x07) << 29) | \
> +		(((uint32_t) (method) & 0x1f) << 24) | \

Why all of the uint32_t and uint64_t types in this patch, but not the
previous one?

Please just stick with u32 and u64, those are the correct kernel types
to be using everywhere.  uint32_t and friends are userspace things that
make no sense in kernel space.

Yes, I know people use them, but we should not be adding to the problem
by creating new instances of them for no good reason.

thanks,

greg k-h
