From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] of: unittest: clean up changeset test
Date: Mon, 5 Mar 2018 15:39:10 -0600
Message-ID: <20180305213910.olvnsprxw4rpjkzv@rob-hp-laptop>
References: <1519682483-19828-1-git-send-email-frowand.list@gmail.com>
 <1519682483-19828-2-git-send-email-frowand.list@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1519682483-19828-2-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: frowand.list@gmail.com
Cc: pantelis.antoniou@konsulko.com, Pantelis Antoniou <panto@antoniou-consulting.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, geert@linux-m68k.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 26, 2018 at 02:01:22PM -0800, frowand.list@gmail.com wrote:
> From: Frank Rowand <frank.rowand@sony.com>
> 
> In preparation for fixing __of_node_dup(), clean up the unittest
> function that calls it.
> 
> Devicetree nodes created from a flattened device tree have a name
> property.  Follow this convention for nodes added by a changeset.

I'd like to get rid of that property as it should be redundant, but 
that's somewhat orthogonal to this.

It also shouldn't be up to the caller to have to do this either, but 
that's already broken in the current API.

So I've applied these.

> 
> For node added by changeset, remove incorrect initialization of
> child node pointer.
> 
> Add an additional node pointer 'changeset' to more naturally reflect
> where in the tree the changeset is added.
> 
> Make changeset add property error messages unique.
> 
> Add whitespace to break apart logic blocks.
> 
> Signed-off-by: Frank Rowand <frank.rowand@sony.com>
> ---
