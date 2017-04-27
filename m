From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/2] of: per-file dtc compiler flags
Date: Thu, 27 Apr 2017 17:25:06 -0500
Message-ID: <20170427222506.3sdsrime2fqeodgw@rob-hp-laptop>
References: <1493165394-29367-1-git-send-email-frowand.list@gmail.com>
 <1493165394-29367-2-git-send-email-frowand.list@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kbuild-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1493165394-29367-2-git-send-email-frowand.list@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
To: frowand.list@gmail.com
Cc: stephen.boyd@linaro.org, mmarek@suse.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 25, 2017 at 05:09:53PM -0700, frowand.list@gmail.com wrote:
> From: Frank Rowand <frank.rowand@sony.com>
> 
> The dtc compiler version that adds initial support was available
> in 4.11-rc1.  Add the ability to set an additional dtc compiler
> flag is needed by overlays.
> 
> Signed-off-by: Frank Rowand <frank.rowand@sony.com>
> ---
>  scripts/Makefile.lib | 2 ++
>  1 file changed, 2 insertions(+)

Applied.
