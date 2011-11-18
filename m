From: Pawel Moll <pawel.moll@arm.com>
Subject: Re: [PATCH 3/5] ARM: vexpress: Add DT support in v2m
Date: Fri, 18 Nov 2011 12:20:49 +0000
Message-ID: <1321618849.24216.323.camel@hornet.cambridge.arm.com>
References: <1321036026-23411-1-git-send-email-pawel.moll@arm.com>
 <1321036026-23411-4-git-send-email-pawel.moll@arm.com>
 <20111116154402.GE2073@localhost.localdomain> <4EC3E446.4030608@gmail.com>
 <1321461458.3137.374.camel@hornet.cambridge.arm.com>
 <4EC3EBEC.3020601@gmail.com>
 <1321463271.3137.380.camel@hornet.cambridge.arm.com>
 <20111117155334.GT9581@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20111117155334.GT9581@n2100.arm.linux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Dave Martin <dave.martin@linaro.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2011-11-17 at 15:53 +0000, Russell King - ARM Linux wrote:
> You're totally failing to understand the point.

That's your opinion, I think otherwise, won't try to convince you.

> The point is that when Versatile Express first came out, it had a memory
> map.  At this point in time, there was nothing 'legacy' about it, it was
> the latest and greatest thing.

That's right. And then when the new variant was created *hardware
designers* decided to call the previous one "legacy". I couldn't care
less what word was it, could be even "bublebee" from my point of view.

> Again, this is _not_ how DT is supposed to work.  DT is about describing
> the hardware, not describing the state of something.  

And that's exactly what I was trying to do. Describe the hardware, using
terminology *used by the hardware designers* - fact that you have chosen
to ignore, fair enough.

> So, get rid of that 'legacy' crap in DT naming.  It doesn't belong.  Or
> we'll start talling the Cortex-A5 stuff 'legacy' right now as well.

As the compatible values will be limited to the tile name and the
information about the motherboard "mode" will be passed through private
node property, I will follow Dave's suggestion of using "empty value"
for legacy/original/whatever variant. Hopefully this will end this topic
which is already too long.

Thanks for all comments!

Pawel
