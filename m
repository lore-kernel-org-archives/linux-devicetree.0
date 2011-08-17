From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC PATCH 0/2] WIP: generic OF pinmux binding
Date: Wed, 17 Aug 2011 15:49:24 +0200
Message-ID: <CACRpkdYyu9-6MMpnF5g6WPb8oXk9fuJxxqv6yTzc7Y5FsgbAyA@mail.gmail.com>
References: <1313581648-22303-1-git-send-email-jamie@jamieiles.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1313581648-22303-1-git-send-email-jamie@jamieiles.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jamie Iles <jamie@jamieiles.com>
Cc: linux@arm.linux.org.uk, sshtylyov@mvista.com, konkers@android.com, marek.belisko@gmail.com, devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca, linux-arm-kernel@lists.infradead.org, ccross@android.com, swarren@nvidia.com, shawn.guo@freescale.com
List-Id: devicetree@vger.kernel.org

On Wed, Aug 17, 2011 at 1:47 PM, Jamie Iles <jamie@jamieiles.com> wrote:

> To avoid going too far in the wrong direction I thought I'd post what I
> have so far for a generic pinmux binding.

It looks like a large part of the binding is about pulling, biasing,
input props like schmitt-triggering and so on, so since I use the
concept of "pincontrol" for all those things in my devised subsystem
can we call them "pincontrol bindings" rather than pinmux,
because pinmux is really just one part of it?

Thanks,
Linus Walleij
