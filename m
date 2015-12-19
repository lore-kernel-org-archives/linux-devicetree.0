From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] devicetree: sound: add binding for WM8974 codec
Date: Fri, 18 Dec 2015 22:19:13 -0600
Message-ID: <20151219041913.GN14936@rob-hp-laptop>
References: <1450270975-17955-1-git-send-email-mans@mansr.com>
 <1450274114-20145-1-git-send-email-mans@mansr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1450274114-20145-1-git-send-email-mans@mansr.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mans Rullgard <mans@mansr.com>
Cc: broonie@kernel.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 16, 2015 at 01:55:13PM +0000, Mans Rullgard wrote:
> This adds a binding for the Wolfson WM8974 mono audio codec.
> 
> Signed-off-by: Mans Rullgard <mans@mansr.com>
> ---
> Sending this patch again, this time including Mark Brown.
> ---
>  Documentation/devicetree/bindings/sound/wlf,wm8974.txt | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8974.txt

This could go in i2c/trivial-devices.txt if this is it, but standalone 
is fine too.

Acked-by: Rob Herring <robh@kernel.org>
