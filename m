From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v2 00/10] Reuse davinci-nand driver for Keystone arch
Date: Tue, 26 Nov 2013 17:33:09 -0800
Message-ID: <20131127013309.GT9468@ld-irv-0074.broadcom.com>
References: <1385033305-13179-1-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1385033305-13179-1-git-send-email-ivan.khoronzhuk@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
Cc: Santosh Shilimkar <santosh.shilimkar@ti.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, grygorii.strashko@ti.com, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@kernel.crashing.org>, Rob Herring <rob.herring@calxeda.com>, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Ivan,

On Thu, Nov 21, 2013 at 01:28:15PM +0200, Ivan Khoronzhuk wrote:
> This series contains fixes and updates of Davinci nand driver in
> order to reuse it for Keystone platform.
> 
> The series is combination of two following series:
> - Davinci nand driver fixes and updates:
>   https://lkml.org/lkml/2013/11/20/271
> - Reuse davinci-nand driver for Keystone arch
>   https://lkml.org/lkml/2013/11/20/315

Can you make sure to consistently change the email $subject for your
patch series? For each of the above, it looks like they are actually
version 2, yet they still just say "[PATCH X/Y]" (not "[PATCH v2 X/Y]").
This makes it harder to parse the history of each series. (And the
combining of two un-versioned patch series adds to the confusion.)

Now, this combined series has a good v2 marking (although at this point,
is it really v3? ...whatever, it doesn't matter). Please continue to
write appropriate $subjects for this and future patch series.

Thanks,
Brian
