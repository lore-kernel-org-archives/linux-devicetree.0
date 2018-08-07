From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 2/4] dt: bindings: Document ZynqMP DDRC in Synopsys
 documentation
Date: Tue, 7 Aug 2018 08:56:53 -0600
Message-ID: <20180807145652.GA4106@rob-hp-laptop>
References: <1533374735-16662-1-git-send-email-manish.narani@xilinx.com>
 <1533374735-16662-3-git-send-email-manish.narani@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1533374735-16662-3-git-send-email-manish.narani@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Manish Narani <manish.narani@xilinx.com>
Cc: mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, michal.simek@xilinx.com, bp@alien8.de, mchehab@kernel.org, mdf@kernel.org, edgar.iglesias@xilinx.com, shubhrajyoti.datta@xilinx.com, naga.sureshkumar.relli@xilinx.com, bharat.kumar.gogada@xilinx.com, stefan.krsmanovic@aggios.com, sgoud@xilinx.com, anirudh@xilinx.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Aug 04, 2018 at 02:55:33PM +0530, Manish Narani wrote:
> This patch adds information of ZynqMP DDRC which reports the single bit
> errors that are corrected and the double bit errors that are detected.
> 
> Signed-off-by: Manish Narani <manish.narani@xilinx.com>
> ---
>  .../bindings/memory-controllers/synopsys.txt       | 27 ++++++++++++++++++----
>  1 file changed, 22 insertions(+), 5 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
