From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 1/7] ARM: shmobile: genmai dts: Replace status value "ok"
 by "okay"
Date: Wed, 10 Dec 2014 09:30:52 +0900
Message-ID: <20141210003051.GG9690@verge.net.au>
References: <1418124305-7445-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1418124305-7445-1-git-send-email-geert+renesas@glider.be>
Sender: linux-sh-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 09, 2014 at 12:24:59PM +0100, Geert Uytterhoeven wrote:
> While the DT parsing code recognizes "ok" as a valid value for the
> "status" property, ePAPR v1.1 doesn't mention it in the list of valid
> values.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, I have queued up this and the other 6 patches.
