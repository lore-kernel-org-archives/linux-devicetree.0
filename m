From: Jon Loeliger <jdl@jdl.com>
Subject: Re: [PATCH] dtc: import latest upstream dtc
Date: Sat, 29 Sep 2012 16:06:19 -0500
Message-ID: <E1TI4Et-0004d5-Ql@jdl.com>
References: <1348867559-2495-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1348867559-2495-1-git-send-email-swarren@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Michal Marek <mmarek@suse.cz>, David Gibson <david@gibson.dropbear.id.au>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

> From: Stephen Warren <swarren@nvidia.com>
> 
> This updates scripts/dtc to commit 317a5d9 "dtc: zero out new label
> objects" from git://git.jdl.com/software/dtc.git.
> 
> This adds features such as:
> * /bits/ syntax for cell data.
> * Math expressions within cell data.
> * The ability to delete properties or nodes.
> * Support for #line directives in the input file, which allows the use of
>   cpp on *.dts.
> * -i command-line option (/include/ path)
> * -W/-E command-line options for error/warning control.
> * Removal of spew to STDOUT containing the filename being compiled.
> * Many additions to the libfdt API.
> 
> Signed-off-by: Stephen Warren <swarren@nvidia.com>

For what it might be worth:

Acked-by: Jon Loeliger <jdl@jdl.com>

jdl
