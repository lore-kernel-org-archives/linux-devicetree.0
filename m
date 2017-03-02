From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: net: generalize moxart-mac to support
 all faraday based ftmac IP
Date: Thu, 2 Mar 2017 09:10:22 -0600
Message-ID: <20170302151022.bb3facfy2hxjcrzz@rob-hp-laptop>
References: <20170223025338.GA5982@app09>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170223025338.GA5982@app09>
Sender: linux-kernel-owner@vger.kernel.org
To: Greentime Hu <green.hu@gmail.com>
Cc: arnd@arndb.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linus.walleij@linaro.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 23, 2017 at 10:53:47AM +0800, Greentime Hu wrote:
> Andestech and moxa use the same faraday mac IP, so we use faraday,ftmac.txt to
> describe it.
> 
> Signed-off-by: Greentime Hu <green.hu@gmail.com>
> ---
> Changes in v2:
>  - Wrap the commit messages and remove the hunk that are already applied.
> ---
>  .../net/{moxa,moxart-mac.txt => faraday,ftmac.txt} |    7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>  rename Documentation/devicetree/bindings/net/{moxa,moxart-mac.txt => faraday,ftmac.txt} (68%)

Applied, thanks.

Rob
