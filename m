From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/4] clock: aspeed: Add VIDEO reset index definition
Date: Tue, 04 Sep 2018 08:36:33 -0500
Message-ID: <5b8e8a62.1c69fb81.6801.2c0d@mx.google.com>
References: <1535576973-8067-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1535576973-8067-2-git-send-email-eajames@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1535576973-8067-2-git-send-email-eajames@linux.vnet.ibm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, andrew@aj.id.au, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Eddie James <eajames@linux.vnet.ibm.com>, mturquette@baylibre.com, robh+dt@kernel.org, sboyd@kernel.org, joel@jms.id.au, mchehab@kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 29 Aug 2018 16:09:30 -0500, Eddie James wrote:
> Add an index into the array of resets kept in the Aspeed clock driver.
> This isn't a HW bit definition.
> 
> Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
> ---
>  include/dt-bindings/clock/aspeed-clock.h | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
