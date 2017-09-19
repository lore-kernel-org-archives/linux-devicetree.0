From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3] scripts/dtc: dtx_diff - 2nd update of include dts
 paths to match build
Date: Tue, 19 Sep 2017 13:02:01 -0500
Message-ID: <20170919180201.nyeomtzzvbiwfeca@rob-hp-laptop>
References: <1505780324-12922-1-git-send-email-frowand.list@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1505780324-12922-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: frowand.list@gmail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 18, 2017 at 05:18:44PM -0700, frowand.list@gmail.com wrote:
> From: Frank Rowand <frank.rowand@sony.com>
> 
> Update dtx_diff include paths in the same manner as:
> commit b12869a8d519 ("of: remove drivers/of/testcase-data from
> include search path for CPP"), commit 5ffa2aed389c ("of: remove
> arch/$(SRCARCH)/boot/dts from include search path for CPP"), and
> commit 50f9ddaf64e1 ("of: search scripts/dtc/include-prefixes path
> for both CPP and DTC").
> 
> Remove proposed include path kernel/dts/, which was never implemented
> for the dtb build.
> 
> For the diff case, each source file is compiled separately.  For
> each of those compiles, provide the location of the source file
> as an include path, not the location of both source files.
> 
> Signed-off-by: Frank Rowand <frank.rowand@sony.com>
> ---
> 
> changes from v2:
>    - fix mangled email subject line
> 
> changes from v1:
>    - update summary commit message, since there is a very similar message
>      for b4b201d88b7c: dtx_diff - update include dts paths to match build
>    - move signed-off-by to above "---"
> 
> The referenced commits b12869a8d519, 5ffa2aed389c, 50f9ddaf64e1
> are in v4.14-rc1.  No stable kernels need this patch.
> 
>  scripts/dtc/dtx_diff | 22 +++++++++-------------
>  1 file changed, 9 insertions(+), 13 deletions(-)

Applied.

Rob
