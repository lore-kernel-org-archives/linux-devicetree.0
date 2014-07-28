From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH 1/2] Adding Lenovo - Lenovo Group Ltd. to the
 vendor-prefixes list.
Date: Mon, 28 Jul 2014 09:43:47 -0400
Message-ID: <20140728134347.GP23220@titan.lakedaemon.net>
References: <1406154923-13612-1-git-send-email-yahoo@perenite.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1406154923-13612-1-git-send-email-yahoo@perenite.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Benoit Masson <yahoo@perenite.com>
Cc: benoitm@perenite.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, andrew@lunn.ch, gregory.clement@free-electrons.com, sebastian.hesselbarth@googlemail.com
List-Id: devicetree@vger.kernel.org

Benoit,

On Wed, Jul 23, 2014 at 03:35:22PM -0700, Benoit Masson wrote:
> Lenovo Group Ltd. (stylized as lenovo) is a Chinese multinational
> computer technology company with headquarters in Beijing, China, and
> Morrisville, North Carolina, United States.
> 
> http://www.lenovo.com/
> Signed-off-by: Benoit Masson <yahoo@perenite.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)

Applied to mvebu/dt with a few minor style changes to the commit log.

  - Added a blank line between the URL and the S-o-B.
  - Reflowed the paragraph to wrap at >80 chars
  - Changed subject to match other changes to vendor-prefixes.txt

The Subject line now reads:

  of: Add Lenovo Group Ltd. to the vendor-prefixes list.

You can view the patch here:

  http://git.infradead.org/linux-mvebu.git/commitdiff/74e025501bb834000b3c7eceab69383806520a36

Next, it'll go to arm-soc.  Then, Linus' tree.

thx,

Jason.
