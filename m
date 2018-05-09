From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] MAINTAINERS: add keyword for devicetree overlay
 notifiers
Date: Wed, 9 May 2018 13:31:40 -0500
Message-ID: <20180509183140.GA11580@rob-hp-laptop>
References: <1524879080-27111-1-git-send-email-frowand.list@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1524879080-27111-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: frowand.list@gmail.com
Cc: pantelis.antoniou@konsulko.com, Pantelis Antoniou <panto@antoniou-consulting.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jan Kiszka <jan.kiszka@siemens.com>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 27, 2018 at 06:31:20PM -0700, frowand.list@gmail.com wrote:
> From: Frank Rowand <frank.rowand@sony.com>
> 
> Devicetree overlay notifiers have a chance to potentially get
> pointers into the overlay unflattened devicetree and overlay FDT.
> The only protection against these pointers being accessed after
> the underlying data has been released by kfree() is by source
> code review of patches.  Add a keyword line to the devicetree
> overlay maintainers entry to try to catch overlay notifier
> related patches.
> 
> The keyword line is added to the devicetree overlay entry instead
> of the devicetree entry so that not all maintainers will receive
> the additional review traffic.  Add Frank Rowand (already a
> maintainer in the devicetree entry) so that he will receive
> the additional review traffic.
> 
> Signed-off-by: Frank Rowand <frank.rowand@sony.com>
> ---
> 
> changes from version 1:
>    - removed extraneous "From:" tags at top of patch description

Applied, sorry it fell thru the cracks.

Rob
