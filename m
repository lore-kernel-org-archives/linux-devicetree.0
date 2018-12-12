From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 6/6] misc: fastrpc: Add support for compat ioctls
Date: Wed, 12 Dec 2018 11:59:32 +0100
Message-ID: <20181212105932.GA1990@kroah.com>
References: <20181207163513.16412-1-srinivas.kandagatla@linaro.org>
 <20181207163513.16412-7-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181207163513.16412-7-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: robh+dt@kernel.org, arnd@arndb.de, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, bkumar@qti.qualcomm.com, thierry.escande@linaro.org
List-Id: devicetree@vger.kernel.org

On Fri, Dec 07, 2018 at 04:35:13PM +0000, Srinivas Kandagatla wrote:
> This patch adds support for compat ioctl from 32 bits userland to
> Qualcomm fastrpc driver.

Ick, why?

Why not just fix up your ioctl structures to not need that at all?  For
new code being added to the kernel, there's no excuse to have to have
compat structures anymore, just make your api sane and all should be
fine.

What prevents you from doing that and requiring compat support?

thanks,

greg k-h
