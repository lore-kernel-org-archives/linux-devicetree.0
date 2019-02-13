From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH RESEND] of: add dtc annotations functionality to dtx_diff
Date: Wed, 13 Feb 2019 13:06:09 -0600
Message-ID: <20190213190609.GA26659@bogus>
References: <1547762474-7832-1-git-send-email-frowand.list@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1547762474-7832-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: frowand.list@gmail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 17, 2019 at 02:01:14PM -0800, frowand.list@gmail.com wrote:
> From: Frank Rowand <frank.rowand@sony.com>
> 
> Add -T and --annotations command line arguments to dtx_diff.  These
> arguments will be passed through to dtc.  dtc will then add source
> location annotations to its output.
> 
> Signed-off-by: Frank Rowand <frank.rowand@sony.com>
> ---
> 
> If dtx_diff is provided with a single devicetree source file then
> that source file will be compiled, with all appropriate includes
> and pre-processing, and the result will be output as source.  This
> provides a convenient mechanism to see what the devicetree looks
> like after all processing and replacements occur.  The
> --annotations argument will cause dtc to report information about
> where the source was located for each line of the output.
> 
>  scripts/dtc/dtx_diff | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)

Applied.

Rob
