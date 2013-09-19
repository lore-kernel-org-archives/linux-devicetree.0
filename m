From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: git issue / [PATCH] MIPS: fix invalid symbolic link file
Date: Thu, 19 Sep 2013 15:39:20 +0200
Message-ID: <20130919133920.GA22468@linux-mips.org>
References: <1379596148-32520-1-git-send-email-maddy@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <git-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1379596148-32520-1-git-send-email-maddy@linux.vnet.ibm.com>
Sender: git-owner@vger.kernel.org
To: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, devicetree@vger.kernel.org, git@vger.kernel.org
Cc: steven.hill@imgtec.com, mmarek@suse.cz, swarren@nvidia.com, linux-mips@linux-mips.org, linux-kbuild@vger.kernel.org, james.hogan@imgtec.com
List-Id: devicetree@vger.kernel.org

On Thu, Sep 19, 2013 at 06:39:08PM +0530, Madhavan Srinivasan wrote:

(Git folks, please read on.)

>    Commit 3b29aa5ba204c created a symlink file in include/dt-bindings.
>    Even though commit diff is fine, symlink is invalid.
>    ls -lb shows a newline character at the end of the filename.
> 
> lrwxrwxrwx 1 maddy maddy 35 Sep 19 18:11 dt-bindings ->
> ../../../../../include/dt-bindings\n
> 
> Signed-off-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
> ---
>  arch/mips/boot/dts/include/dt-bindings |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/boot/dts/include/dt-bindings b/arch/mips/boot/dts/include/dt-bindings
> index 68ae388..08c00e4 120000
> --- a/arch/mips/boot/dts/include/dt-bindings
> +++ b/arch/mips/boot/dts/include/dt-bindings
> @@ -1 +1 @@
> -../../../../../include/dt-bindings
> +../../../../../include/dt-bindings
> \ No newline at end of file
> -- 
> 1.7.10.4

I applied your patch - but now git-show shows it as an empty commit and

  ls -lb arch/mips/boot/dts/include/dt-bindings

still shows the \n at the end of the link target.  Things are looking ok
now that I manually fixed the link and commited the result.  I hope
git-push and git-pull are going to handle this correct.

So, I wonder if this is a git bug.

The original patch that introduced the symlink with the \n is kernel
commit 3b29aa5ba204c62b3ec8f9f5b1ebd6e5d74f75d3 and is archived in
patchwork at http://patchwork.linux-mips.org/patch/5745/  The patch
file contains a \n at the end - but one would expect that from a
patch file that has been transfered via email, so I'm not sure how this
is supposed to work with emailed patches?!?

Anyway, I'm not too fond of sylinks in the tree or in patches and I'm
wondering if we could get rid of them for something more bullet proof.

  Ralf
