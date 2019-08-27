From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: Add ast2600 compatible
Date: Tue, 27 Aug 2019 11:49:52 -0500
Message-ID: <20190827164952.GA24417@bogus>
References: <20190819051738.17370-1-joel@jms.id.au>
 <20190819051738.17370-2-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190819051738.17370-2-joel@jms.id.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Joel Stanley <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, Ryan Chen <ryan_chen@aspeedtech.com>, linux-watchdog@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, linux-arm-kernel@lists.infradead.org, Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>
List-Id: devicetree@vger.kernel.org

On Mon, 19 Aug 2019 14:47:37 +0930, Joel Stanley wrote:
> This adds a compatible for the ast2600, a new ASPEED SoC.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> ---
> v2:
>  - Add Andrew's r-b
> ---
>  Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
