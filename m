From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCHv5 2/2] mailbox: Adding driver for Xilinx LogiCORE IP
 mailbox.
Date: Wed, 24 Jun 2015 22:36:45 +0200
Message-ID: <1435178205.4528.77.camel@tiscali.nl>
References: <1435082402-29239-1-git-send-email-moritz.fischer@ettus.com>
	 <1435082402-29239-3-git-send-email-moritz.fischer@ettus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1435082402-29239-3-git-send-email-moritz.fischer@ettus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Moritz Fischer <moritz.fischer@ettus.com>, jassisinghbrar@gmail.com
Cc: linux-kernel@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, michal.simek@xilinx.com, soren.brinkmann@xilinx.com, akpm@linux-foundation.org, gregkh@linuxfoundation.org, mchehab@osg.samsung.com, arnd@arndb.de, joe@perches.com, jingoohan1@gmail.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, 2015-06-23 at 11:00 -0700, Moritz Fischer wrote:
> +MODULE_ALIAS("platform:xilinx-mailbox");

So I think this MODULE_ALIAS() is only useful if, in short, there's a
corresponding platform_device created. Ie, a platform_device with a
name "xilinx-mailbox" that will fire of a "MODALIAS=platform:xilinx
-mailbox" when it's created.

I couldn't spot such a platform_device. Provided git grep didn't let me
down here: what breaks if this line is dropped?

Thanks,


Paul Bolle
