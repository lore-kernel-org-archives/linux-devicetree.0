From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] media: dt-bindings: Fix building error for
 dt_binding_check
Date: Tue, 1 Oct 2019 07:04:27 -0500
Message-ID: <20191001120427.GA3594@bogus>
References: <1568808060-17516-1-git-send-email-pragnesh.patel@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1568808060-17516-1-git-send-email-pragnesh.patel@sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: mripard@kernel.org, Pragnesh Patel <pragnesh.patel@sifive.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 18 Sep 2019 17:31:00 +0530, Pragnesh Patel wrote:
> $id doesn't match the actual filename, so update the $id
> 
> Signed-off-by: Pragnesh Patel <pragnesh.patel@sifive.com>
> ---
>  Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
