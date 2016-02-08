From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 01/15] dt-bindings: ascii-lcd: Document a binding for
 simple ASCII LCDs
Date: Mon, 8 Feb 2016 11:29:57 -0600
Message-ID: <20160208172957.GA31126@rob-hp-laptop>
References: <1454499045-5020-1-git-send-email-paul.burton@imgtec.com>
 <1454499045-5020-2-git-send-email-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1454499045-5020-2-git-send-email-paul.burton@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, Joe Perches <joe@perches.com>, Kalle Valo <kvalo@codeaurora.org>, Jiri Slaby <jslaby@suse.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, linux-kernel@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, "David S. Miller" <davem@davemloft.net>, Ian Campbell <ijc+devicetree@hellion.org.uk>, devicetree@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Pawel Moll <pawel.moll@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 03, 2016 at 11:30:31AM +0000, Paul Burton wrote:
> Add documentation for a devicetree binding for simple memory-mapped
> ASCII LCD displays, such as those found on the Imagination Technologies
> Boston & Malta development boards.
> 
> Signed-off-by: Paul Burton <paul.burton@imgtec.com>
> ---
> 
> Changes in v2: None
> 
>  Documentation/devicetree/bindings/ascii-lcd.txt | 10 ++++++++++

Given this is specific to some IT block, then it should not have a 
generic name. Otherwise, the binding looks fine.

Rob
