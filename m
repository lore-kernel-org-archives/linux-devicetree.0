From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC PATCH dtc] C-based DT schema checker integrated into dtc
Date: Tue, 5 Nov 2013 20:34:00 +0100
Message-ID: <201311052034.01114.arnd@arndb.de>
References: <1382651488-9696-1-git-send-email-swarren@wwwdotorg.org>
 <201311051948.11992.arnd@arndb.de>
 <20131105191230.GA20600@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20131105191230.GA20600@obsidianresearch.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Jon Loeliger <jdl@jdl.com>, khilman@linaro.org, Stephen Warren <swarren@nvidia.com>, Benoit Cousson <bcousson@baylibre.com>, pawel.moll@arm.com, Stephen Warren <swarren@wwwdotorg.org>, Tomasz Figa <t.figa@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, rob.herring@calxeda.com, Grant Likely <grant.likely@secretlab.ca>, fparent@baylibre.com, a.hajda@samsung.com, s.nawrocki@samsung.com, galak@codeaurora.org, olof@lixom.net, Alison_Chaiken@mentor.com, linux-arm-kernel@lists.infradead.org, David Gibson <david@gibson.dropbear.id.au>
List-Id: devicetree@vger.kernel.org

On Tuesday 05 November 2013, Jason Gunthorpe wrote:
> The issue is sysfs, the TPM core attaches attributes to the driver's
> struct device, which means it has to convert from struct device * to
> its own private data. It is totally wrong, but that is the way
> it has been for ever. :(

I've just had a very brief look at that subsystem, and the first driver
I looked at (tpm_atmel) actually creates a child platform_device for
the sole purpose of registering that with the tpm subsystem, which seems
to avoid this problem. Maybe the same can be done for the other drivers
as well. Unfortunately, that will change the sysfs structure, which might
break user space relying on the current path to the device. The TPM
subsystem definely seems a bit unusual in this regard, so I hope not too
many other parts of the kernel have this particular problem.

(side note: another unusual aspect of the TPM subsystem is the use of a
 custom 'release' function override. Seems harmless, but very weird).	

	Arnd
