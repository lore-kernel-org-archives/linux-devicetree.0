Return-Path: <robherring2@gmail.com>
Date: Tue, 22 May 2018 12:25:04 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3] of: unittest: for strings, account for trailing \0 in
 property length field
Message-ID: <20180522172504.GA31282@rob-hp-laptop>
References: <20180521232613.GA18584@sjc-ads-587.cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180521232613.GA18584@sjc-ads-587.cisco.com>
To: Stefan M Schaeckeler <sschaeck@cisco.com>
Cc: Frank Rowand <frowand.list@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Mon, May 21, 2018 at 04:26:14PM -0700, Stefan M Schaeckeler wrote:
> For strings, account for trailing \0 in property length field:
> 
> This is consistent with how dtc builds string properties.
> 
> Function __of_prop_dup() would misbehave on such properties as it duplicates
> properties based on the property length field creating new string values
> without trailing \0s.
> 
> Signed-off-by: Stefan M Schaeckeler <sschaeck@cisco.com>
> Reviewed-by: Frank Rowand <frank.rowand@sony.com>
> Tested-by: Frank Rowand <frank.rowand@sony.com>
> ---
> Changes in v3:
>  - forgot one string in v2.
> Changes in v2:
> - fixed spacing around + sign.
> 
>  drivers/of/unittest.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Applied, thanks.

Rob
