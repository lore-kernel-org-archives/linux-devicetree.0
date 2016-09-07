From: Jens Wiklander <jens.wiklander@linaro.org>
Subject: Re: [PATCH v11 3/4] tee: add OP-TEE driver
Date: Wed, 7 Sep 2016 11:18:19 +0200
Message-ID: <20160907091818.GA15580@ermac>
References: <1471870856-18684-1-git-send-email-jens.wiklander@linaro.org>
 <1471870856-18684-4-git-send-email-jens.wiklander@linaro.org>
 <49a564fc-0d45-9981-b357-a1046a135d33@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <49a564fc-0d45-9981-b357-a1046a135d33@hisilicon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zeng Tao <prime.zeng@hisilicon.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, valentin.manea@huawei.com, Mark Rutland <mark.rutland@arm.com>, javier@javigon.com, emmanuel.michel@st.com, Arnd Bergmann <arnd@arndb.de>, Nishanth Menon <nm@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Will Deacon <will.deacon@arm.com>, Michal Simek <michal.simek@xilinx.com>, jean-michel.delorme@st.com, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Rob Herring <robh+dt@kernel.org>, Al Viro <viro@ZenIV.linux.org.uk>, Andreas Dannenberg <dannenberg@ti.com>
List-Id: devicetree@vger.kernel.org

Hi Zengtao,

On Wed, Sep 07, 2016 at 03:49:38PM +0800, Zeng Tao wrote:
> Hi all:
> 
> I have gone through the patch, and i find one limit for RPC call from
> TEE to REE.  In this patch, RPC commands are fixed and it supports a
> limited set of commands.  If you want to add your own RPC command then
> you need to change the source code of the driver.

All unknown RPC of the OPTEE_SMC_RPC_FUNC_CMD type are forwarded to the
supplicant in user space. So there's the option to extend with the
supplicant if needed.

It is true that the RPCs which are dealt with in the driver are fixed.

> 
> I don't know how much work to do, but unless we are sure that the RPC
> now are enough to cover all, we 'd better make the RPC more
> extensible.

It's handle_rpc_func_cmd() that could support dynamic registration of
RPC commands. Doing so in optee_handle_rpc() also should be avoided as
it involves updates of an eventual hypervisor.

I'm trying to keep this initial patch set as small as possible to not
make it harder than it already is to review it. If possible I'd like to
wait with new features until after this patch set has been accepted.

Thanks,
Jens

> 
> BR zengtao
