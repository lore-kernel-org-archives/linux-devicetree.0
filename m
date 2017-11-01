From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2] of: platform: Create dummy routines for
 !CONFIG_OF_ADDRESS
Date: Wed, 1 Nov 2017 16:14:58 -0500
Message-ID: <20171101211458.wo4at67k7sxo5fah@rob-hp-laptop>
References: <2d798213e4fefc074a66ccb7ab2fc243ee2b1e1a.1509186356.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2d798213e4fefc074a66ccb7ab2fc243ee2b1e1a.1509186356.git.viresh.kumar@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Frank Rowand <frowand.list@gmail.com>, Vincent Guittot <vincent.guittot@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Oct 28, 2017 at 03:56:46PM +0530, Viresh Kumar wrote:
> Few routines don't have their dummy counterparts which results in build
> failures where these routines are used without CONFIG_OF_ADDRESS
> enabled.
> 
> Fix those by defining the dummy versions.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
> V2:
> - Rebased again latest rc and resolved conflicts.
> - No comments received on V1.

What's your user?

>  include/linux/of_platform.h | 39 +++++++++++++++++++++++++++++++++------
>  1 file changed, 33 insertions(+), 6 deletions(-)
