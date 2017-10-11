From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] of: platform: Create dummy routines for
 !CONFIG_OF_ADDRESS
Date: Wed, 11 Oct 2017 11:45:55 +0530
Message-ID: <20171011061555.GO4031@vireshk-i7>
References: <cb52d4dd44d18371efc8c1d6d2d3795ebb29d841.1501826940.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cb52d4dd44d18371efc8c1d6d2d3795ebb29d841.1501826940.git.viresh.kumar@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 04-08-17, 11:39, Viresh Kumar wrote:
> Few routines don't have their dummy counterparts which results in build
> failures where these routines are used without CONFIG_OF_ADDRESS
> enabled.
> 
> Fix those by defining the dummy versions.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  include/linux/of_platform.h | 31 +++++++++++++++++++++++++++++--
>  1 file changed, 29 insertions(+), 2 deletions(-)

@Rob:

Its been 2 months since I posted this patch. Do you have any comments
on it ?

-- 
viresh
