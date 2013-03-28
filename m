From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH REPOST 2/7] kbuild: fixdep: support concatenated dep files
Date: Thu, 28 Mar 2013 12:00:57 -0600
Message-ID: <51548559.6030605@wwwdotorg.org>
References: <1363890194-31538-1-git-send-email-swarren@wwwdotorg.org> <1363890194-31538-2-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kbuild-owner@vger.kernel.org>
In-Reply-To: <1363890194-31538-2-git-send-email-swarren@wwwdotorg.org>
Sender: linux-kbuild-owner@vger.kernel.org
To: Michal Marek <mmarek@suse.cz>, Grant Likely <glikely@secretlab.ca>, Rob Herring <robherring2@gmail.com>
Cc: arm@kernel.org, Shawn Guo <shawn.guo@linaro.org>, Hiroshi Doyu <hdoyu@nvidia.com>, linux-kbuild@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Stephen Warren <swarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

On 03/21/2013 12:23 PM, Stephen Warren wrote:
> From: Stephen Warren <swarren@nvidia.com>
> 
> The current use-case for fixdep is: a source file is run through a single
> processing step, which creates a single dependency file as a side-effect,
> which fixdep transforms into the file used by the kernel build process.
> 
> In order to transparently run the C pre-processor on device-tree files,
> we wish to run both gcc -E and dtc on a source file in a single rule.
> This generates two dependency files, which must be transformed together
> into the file used by the kernel build process. This change modifies
> fixdep so it can process the concatenation of multiple separate input
> dependency files, and produce a correct unified output.
> 
> The code changes have the slight benefit of transforming the loop in
> parse_dep_file() into more of a lexer/tokenizer, with the loop body being
> more of a parser. Previously, some of this logic was mixed together
> before the loop. I also added some comments, which I hope are useful.
> 
> Benchmarking shows that on a cross-compiled ARM tegra_defconfig build,
> there is less than 0.5 seconds speed decrease with this change, on top
> of a build time of ~2m24s. This is probably within the noise.

Marek, do patches 2, 3, and 4 in this series look good to you from a
kbuild perspective?

I'm hoping that you can review/ack those 3 patches for kbuild, and that
Grant will review/ack the whole series, and then the series can be
merged via arm-soc for 3.10.

Let me know if you need me to repost the series again in case it's
fallen out of your inbox.

Thanks.
