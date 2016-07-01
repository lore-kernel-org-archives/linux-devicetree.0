From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 21/22] sh: Renesas RTS7751R2Dplus (a,k.a R2Dplus)
 IRQCHIP Driver
Date: Thu, 30 Jun 2016 20:53:13 -0500
Message-ID: <20160701015313.GA31508@rob-hp-laptop>
References: <1467207667-15768-1-git-send-email-ysato@users.sourceforge.jp>
 <1467207667-15768-22-git-send-email-ysato@users.sourceforge.jp>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1467207667-15768-22-git-send-email-ysato@users.sourceforge.jp>
Sender: linux-kernel-owner@vger.kernel.org
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: devicetree@vger.kernel.org, linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 29, 2016 at 10:41:06PM +0900, Yoshinori Sato wrote:
> Changes v4
> - split patch.
> - remove unneeded #address

Actually, I think #address-cells is supposed to be set for 
interrupt-map. It defines the size of the first field.

Rob
