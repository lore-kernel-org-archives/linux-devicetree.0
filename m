From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] kbuild: create an "include chroot" for DT bindings
Date: Thu, 21 Feb 2013 23:26:51 +0100
Message-ID: <51269F2B.3090803@suse.cz>
References: <1361394356-19385-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Return-path: <linux-kbuild-owner@vger.kernel.org>
In-Reply-To: <1361394356-19385-1-git-send-email-swarren@wwwdotorg.org>
Sender: linux-kbuild-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, devicetree-discuss@lists.ozlabs.org, linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Stephen Warren <swarren@nvidia.com>, Shawn Guo <shawn.guo@linaro.org>, Hiroshi Doyu <hdoyu@nvidia.com>
List-Id: devicetree@vger.kernel.org

On 20.2.2013 22:05, Stephen Warren wrote:
> From: Stephen Warren <swarren@nvidia.com>
> 
> The recent dtc+cpp support allows header files and C pre-processor
> defines/macros to be used when compiling device tree files. These
> headers will typically define various constants that are part of the
> device tree bindings.
> 
> The original patch which set up the dtc+cpp include path only considered
> using those headers from device tree files. However, they are also
> useful for kernel code which needs to interpret the device tree.
> 
> In both the DT files and the kernel, I'd like to include the DT-related
> headers in the same way, for example, <dt-bindings/gpio/tegra-gpio.h>.
> That will simplify any text which discusses the DT header locations.
> 
> Creating a <dt-bindings/> for kernel source to use is as simple as
> placing files into include/dt-bindings/.
> 
> However, when compiling DT files, the include path should be restricted
> so that only the dt-bindings path is available; arbitrary kernel headers
> shouldn't be exposed. For this reason, create a specific include
> directory for use by dtc+cpp, and symlink dt-bindings from there to the
> actual location of include/dt-bindings/. For want of a better location,
> place this "include chroot" into the existing dts/ directory.

Nice trick. dts+cpp only sees the bindings and LINUXINCLUDE is not
polluted either. You can add

Acked-by: Michal Marek <mmarek@suse.cz>

if you like.

Michal
