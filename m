From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4] of: Fix issue where code would fall through to error
 case.
Date: Fri, 9 Dec 2016 10:33:24 -0600
Message-ID: <20161209163324.rnnxi5bcvi6wk2po@rob-hp-laptop>
References: <1480659025-18836-1-git-send-email-moritz.fischer@ettus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1480659025-18836-1-git-send-email-moritz.fischer@ettus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Moritz Fischer <moritz.fischer@ettus.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, frowand.list@gmail.com, pantelis.antoniou@konsulko.com, Moritz Fischer <mdf@kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 01, 2016 at 10:10:25PM -0800, Moritz Fischer wrote:
> From: Moritz Fischer <mdf@kernel.org>
> 
> No longer fall through into the error case that prints out
> an error if no error (err = 0) occurred.
> 
> Fixes d9181b20a83(of: Add back an error message, restructured)
> Signed-off-by: Moritz Fischer <mdf@kernel.org>
> Reviewed-by: Frank Rowand <frank.rowand@am.sony.com>
> ---

Applied, thanks.

Rob
