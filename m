From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH v3] ARC: [plat-hsdk]: Add reset controller node to manage
 ethernet reset
Date: Thu, 5 Oct 2017 06:04:44 -0700
Message-ID: <64d3fb1d-8d6e-3c5f-f143-c3e6a205a95b@synopsys.com>
References: <20170922164911.1125-1-Eugeniy.Paltsev@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170922164911.1125-1-Eugeniy.Paltsev@synopsys.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Alexey Brodkin <Alexey.Brodkin@synopsys.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Eugeniy,

On 09/22/2017 09:49 AM, Eugeniy Paltsev wrote:
> DW ethernet controller on HSDK hangs sometimes after SW reset, so
> add reset node to make possible to reset DW ethernet controller HW.
> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> ---
> Changes v2 -> v3:
>    * Remove v1 suffix as we finaly got rid of v1 suffix in reset
>      driver and docs.
>    * Rename reset node to "reset-controller" for consistency with
>      the other bindings.
> 
> Changes v1 -> v2:
>    * Enable HSDK reset driver in hsdk_defconfig

Revisiting this given that changes to driver have been merged upstream: we 
currently carry a reset workaround for axs+ethernet, i.e. your patch

     ARC: [plat-axs103] Add temporary quirk to reset ethernet IP

But there's nothing similar for HSDK. IOW, we don't need to revert anything foro 
hsdk, after this gets applied ?

-Vineet
