From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] of: base: add support to get machine model name
Date: Fri, 18 Nov 2016 08:46:51 -0600
Message-ID: <20161118144651.275xz4gu6jaefhp7@rob-hp-laptop>
References: <1479396775-32033-1-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1479396775-32033-1-git-send-email-sudeep.holla@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 17, 2016 at 03:32:54PM +0000, Sudeep Holla wrote:
> Currently platforms/drivers needing to get the machine model name are
> replicating the same snippet of code. In some case, the OF reference
> counting is either missing or incorrect.
> 
> This patch adds support to read the machine model name either using
> the "model" or the "compatible" property in the device tree root node
> to the core OF/DT code.
> 
> This can be used to remove all the duplicate code snippets doing exactly
> same thing later.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  drivers/of/base.c  | 32 ++++++++++++++++++++++++++++++++
>  include/linux/of.h |  6 ++++++
>  2 files changed, 38 insertions(+)
> 
> Hi Rob,
> 
> It would be good if we can target this for v4.10, so that we have no
> dependencies to push PATCH 2/2 in v4.11

Applied.

Rob
