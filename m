From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] devicetree: mxsfb: add reset-active property
Date: Sat, 19 Dec 2015 21:38:23 -0600
Message-ID: <20151220033823.GE9883@rob-hp-laptop>
References: <1450200297-19243-1-git-send-email-mans@mansr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1450200297-19243-1-git-send-email-mans@mansr.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mans Rullgard <mans@mansr.com>
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, marex@denx.de
List-Id: devicetree@vger.kernel.org

On Tue, Dec 15, 2015 at 05:24:56PM +0000, Mans Rullgard wrote:
> Some boards connect the LCD_RESET pin to a reset input on the
> display panel.  On these boards, this pin must be set to the
> proper level for the display to function.
> 
> This adds an optional "reset-active" property to the "display"
> subnode such that devicetrees can specify the desired polarity
> of the LCD_RESET pin.
> 
> Signed-off-by: Mans Rullgard <mans@mansr.com>

Acked-by: Rob Herring <robh@kernel.org>
