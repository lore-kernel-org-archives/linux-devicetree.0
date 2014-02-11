From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH 4/8] ARM: mvebu: make use of
 of_find_matching_node_and_match
Date: Tue, 11 Feb 2014 14:29:19 -0500
Message-ID: <20140211192919.GH27395@titan.lakedaemon.net>
References: <1392135847-30791-1-git-send-email-joshc@codeaurora.org>
 <1392135847-30791-5-git-send-email-joshc@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1392135847-30791-5-git-send-email-joshc@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Josh Cartwright <joshc@codeaurora.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 11, 2014 at 10:24:02AM -0600, Josh Cartwright wrote:
> Instead of the of_find_matching_node()/of_match_node() pair, which requires two
> iterations through the match table, make use of of_find_matching_node_and_match(),
> which only iterates through the table once.
> 
> While we're here, mark the of_system_controller table const.
> 
> Signed-off-by: Josh Cartwright <joshc@codeaurora.org>
> ---
>  arch/arm/mach-mvebu/system-controller.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)

Applied to mvebu/soc with Thomas' Reviewed-by, and Gregory's Ack.

thx,

Jason.
