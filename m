From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 00/12] of: Make drivers/of/resolver.c more readable
Date: Thu, 10 Nov 2016 14:56:02 -0600
Message-ID: <20161110205602.qy2ydmykt2pqwcjn@rob-hp-laptop>
References: <1477722392-32172-1-git-send-email-frowand.list@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1477722392-32172-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: frowand.list@gmail.com
Cc: pantelis.antoniou@konsulko.com, Pantelis Antoniou <panto@antoniou-consulting.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 28, 2016 at 11:26:20PM -0700, frowand.list@gmail.com wrote:
> From: Frank Rowand <frank.rowand@am.sony.com>
> 
> drivers/of/resolve.c is a bit difficult to read.  Clean it up so
> that review of future overlay related patches will be easier.
> 
> Most of the patches are intended to be reformatting, with no functional
> change.  Patches that are expected to have a functional change are:
> 
>   Remove excessive printks to reduce clutter.
>   Update structure of code to be clearer, also remove BUG_ON()
>     Any functional change would reflect undefined behavior on bad overlay.
>     Some error message text modified.
>     BUG_ON() removed.
>   Add back an error message, restructured
> 
> The patches are grouped into sets of changes that are intended
> to be easy to verify correctness through simple inspection.
> 
> Some of the individual patches have checkpatch warnings or errors.
> But after all patches are applied, the number of errors and
> warnings from running checkpatch against the entire file are
> reduced to two line size warnings.
> 
> These patches are only tested via the unit tests. I do not have
> expansion boards to test with real hardware.
> 
> changes from rfc to v1:
>   - Remove fewer one line comments
>   - Add more extensive header comment to of_resolve_phandles()
>     to explain the how and why of resolving phandles
>   - Update patch header comments
>   - Incorporated patch "Remove braces around single line blocks"
>     into the previous patch in the series
> 
> 
> Frank Rowand (12):
>   of: Remove comments that state the obvious, to reduce clutter
>   of: Remove excessive printks to reduce clutter.
>   of: Convert comparisons to zero or NULL to logical expressions
>   of: Rename functions to more accurately reflect what they do
>   of: Remove prefix "__of_" from local function names
>   of: Rename variables to better reflect purpose or follow convention
>   of: Update structure of code to be clearer, also remove BUG_ON()
>   of: Remove redundant size check
>   of: Update comments to reflect changes and increase clarity
>   of: Add back an error message, restructured
>   of: Move setting of pointer to beside test for non-null
>   of: Remove unused variable overlay_symbols

Series applied.

Rob
