From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] kbuild: limit dtc+cpp include path
Date: Tue, 12 Feb 2013 23:09:55 +0000
Message-ID: <20130212230955.5E5B93E240D@localhost>
References: <1360706617-20276-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-kbuild-owner@vger.kernel.org>
In-Reply-To: <1360706617-20276-1-git-send-email-swarren@wwwdotorg.org>
Sender: linux-kbuild-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <rob.herring@calxeda.com>
Cc: devicetree-discuss@lists.ozlabs.org, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

On Tue, 12 Feb 2013 15:03:37 -0700, Stephen Warren <swarren@wwwdotorg.org> wrote:
> From: Stephen Warren <swarren@nvidia.com>
> 
> Device tree source files may now include header files. The intent is
> that those header files define/name constants used as part of the DT
> bindings. Currently this feature is open to abuse, since any kernel
> header file at all can be included, This could allow device tree files
> to become dependant on kernel headers files, and thus make them no
> longer OS-independent. This would also prevent separating the device
> tree source files from the kernel repository.
> 
> Solve this by limiting the cpp include path for device tree files to
> separate directories.
> 
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> ---
> Here, I allow header files in the .dts source directory, or in a per-arch
> include directory. Perhaps rather than:
> 
> -I$(srctree)/arch/$(SRCARCH)/include/dts

That seems reasonable for now.

Applied, thanks.
g.

