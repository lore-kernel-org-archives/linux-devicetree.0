From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v6 4/4] ARM: dts: enable PCIe support for Cygnus
Date: Fri, 13 Mar 2015 09:21:15 -0700
Message-ID: <55030E7B.8080305@gmail.com>
References: <1426097169-20805-1-git-send-email-rjui@broadcom.com> <1426097169-20805-5-git-send-email-rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426097169-20805-5-git-send-email-rjui@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ray Jui <rjui@broadcom.com>, Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>, Hauke Mehrtens <hauke@hauke-m.de>, Paul Bolle <pebolle@tiscali.nl>
Cc: Dmitry Torokhov <dtor@google.com>, Anatol Pomazau <anatol@google.com>, Scott Branden <sbranden@broadcom.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 11/03/15 11:06, Ray Jui wrote:
> Add PCIe device nodes in bcm-cygnus.dtsi but keep them disabled there.
> Only enable them for bcm958300k where PCIe interfaces are populated
> 
> Signed-off-by: Ray Jui <rjui@broadcom.com>
> Reviewed-by: Scott Branden <sbranden@broadcom.com>

Applied to devicetree/next with Arnd's acked-by, thanks!
-- 
Florian
