From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: bus: imx-weim: document multiple
 address ranges per child node
Date: Mon, 10 Dec 2018 17:18:03 -0600
Message-ID: <20181210231803.GA1466@bogus>
References: <20181206192633.25319-1-TheSven73@googlemail.com>
 <20181206192633.25319-3-TheSven73@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181206192633.25319-3-TheSven73@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sven Van Asbroeck <thesven73@gmail.com>
Cc: TheSven73@googlemail.com, Shawn Guo <shawnguo@kernel.org>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu,  6 Dec 2018 14:26:32 -0500, Sven Van Asbroeck wrote:
> The imx-weim driver was patched to allow correct WEIM configuration
> when multiple address ranges are used in a child node.
> Update the dt-bindings to reflect this.
> 
> Signed-off-by: Sven Van Asbroeck <TheSven73@googlemail.com>
> ---
>  .../devicetree/bindings/bus/imx-weim.txt      | 32 +++++++++++++++++--
>  1 file changed, 29 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
