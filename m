From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 3/4] media: dt-bindings: aspeed-video: Add missing
 memory-region property
Date: Wed, 24 Apr 2019 16:17:32 -0500
Message-ID: <20190424211732.GA18914@bogus>
References: <1556119020-7609-1-git-send-email-eajames@linux.ibm.com>
 <1556119020-7609-4-git-send-email-eajames@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1556119020-7609-4-git-send-email-eajames@linux.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, linux-media@vger.kernel.org, andrew@aj.id.au, joel@jms.id.au, robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org, hverkuil@xs4all.nl, Eddie James <eajames@linux.ibm.com>
List-Id: devicetree@vger.kernel.org

On Wed, 24 Apr 2019 10:16:59 -0500, Eddie James wrote:
> Missed documenting this property in the initial commit.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
> Changes since v1:
>  - Add missing semi-colon
> 
>  Documentation/devicetree/bindings/media/aspeed-video.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.
