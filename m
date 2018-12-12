From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: arm: mrvl: amend Browstone compatible string
Date: Tue, 11 Dec 2018 20:39:38 -0600
Message-ID: <20181212023938.GA15888@bogus>
References: <20181202114008.2861-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181202114008.2861-1-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Lubomir Rintel <lkundrak@v3.sk>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, Dec 02, 2018 at 12:40:08PM +0100, Lubomir Rintel wrote:
> The Brownstone board is compatible with "mrvl,mmp2". The actual DTS
> already contains the string -- add it to the binding doc as well.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---
>  Documentation/devicetree/bindings/arm/mrvl/mrvl.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied.

Rob
