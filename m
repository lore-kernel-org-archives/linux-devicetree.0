From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH V3] irqchip: Add TB10x interrupt controller driver
Date: Wed, 26 Jun 2013 09:47:49 +0530
Message-ID: <51CA6B6D.3080706@synopsys.com>
References: <20130530211944.05F4D3E0A90@localhost> <1370014348-21121-1-git-send-email-christian.ruppert@abilis.com> <alpine.DEB.2.02.1306251551020.4013@ionos.tec.linutronix.de> <20130625141141.GA1720@ab42.lan> <alpine.DEB.2.02.1306251636270.4013@ionos.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.02.1306251636270.4013@ionos.tec.linutronix.de>
Sender: linux-doc-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Christian Ruppert <christian.ruppert@abilis.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Pierrick Hascoet <pierrick.hascoet@abilis.com>
List-Id: devicetree@vger.kernel.org

Hi Thomas,

On 06/25/2013 08:07 PM, Thomas Gleixner wrote:
>
>>> I can pick it up, but I'm not so fond of carrying arch/arc patches
>>> which might conflict with other stuff in the arc tree. Veenet, if I
>>> should pick the whole thing up, I'd like to have an acked-by at least.
>> Would you prefer if we separated everything in arch/arc from this patch
>> and push it through Vineet's channel?
> If it can be split w/o breaking the world, this would be the most
> elegant solution.

I would have preferred it to be part of same patch, for bisectability if nothing
else. However your tree gets merged in pretty early in the cycle so I'll make sure
my pull request goes in after yours.

Anyways, thanks for merging the driver.

Chrisitian, please send over the forked out arch/arc bits for this to me
separately. The i2c DT changes seem to touch different files though so I don't see
merge issues as of now.

-Vineet
