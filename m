From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: Re: [PATCH v2] of: fix build failure
Date: Mon, 7 Dec 2015 17:22:49 +0530
Message-ID: <20151207115237.GA10567@sudip-pc>
References: <1449488256-16556-1-git-send-email-sudipm.mukherjee@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1449488256-16556-1-git-send-email-sudipm.mukherjee@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, akpm@linux-foundation.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 07, 2015 at 05:07:36PM +0530, Sudip Mukherjee wrote:
> We are having build failure with linux-next for sparc allmodconfig with
> the error messages:
> 
> undefined reference to 'of_io_request_and_map'
> 
> CONFIG_OF is defined for sparc so it is expected that we have a
> definition of of_io_request_and_map() but of/address.c is only compiled
> if it is !SPARC. In other words, CONFIG_OF_ADDRESS is not defined for
> sparc so we get the build failure. 
> 
> Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
> ---

please discard this patch. This created problem with some other arch. I
am sending v3.

regards
sudip
