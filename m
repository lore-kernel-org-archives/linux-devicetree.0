From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] drivers/of: fix missing pr_cont()s in
 of_print_phandle_args
Date: Fri, 9 Dec 2016 10:32:54 -0600
Message-ID: <20161209163254.aev5dc53edwiqyf4@rob-hp-laptop>
References: <1480579255-28446-1-git-send-email-marcin.nowakowski@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1480579255-28446-1-git-send-email-marcin.nowakowski@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Cc: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 01, 2016 at 09:00:55AM +0100, Marcin Nowakowski wrote:
> Since the KERN_CONT changes, the current debug printks have a lot of
> empty lines making the log messages very hard to read.
> 
> Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
> ---
>  drivers/of/base.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

Applied, thanks.

Rob
