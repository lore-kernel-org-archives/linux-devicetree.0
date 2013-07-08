From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 4/4] ARM: reinsert ARCH_MULTI_V4 Kconfig option
Date: Tue, 9 Jul 2013 01:03:27 +0200
Message-ID: <201307090103.27296.arnd@arndb.de>
References: <1372949142-8260-1-git-send-email-jonas.jensen@gmail.com>
 <CACmBeS3Ges44HxOGZns+G=jQhSmGjVmZBir2_ZBXT1i2nrNQwg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACmBeS3Ges44HxOGZns+G=jQhSmGjVmZBir2_ZBXT1i2nrNQwg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jonas Jensen <jonas.jensen@gmail.com>
Cc: linux@arm.linux.org.uk, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, arm@kernel.org, olof@lixom.net, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Monday 08 July 2013, Jonas Jensen wrote:
> Arnd suggested removing one (or many) of the options:
> 
> CPU_ABRT_EV4T
> CPU_CACHE_V4WT
> CPU_COPY_V4WB
> CPU_TLB_V4WBI
> 
> However boot is still broken after removing all including CPU_32v4T.
> 
> Selecting CPU_SA1100 instead, it boots normally and init works.
> 
> The idea is, If you can help figure out what exactly breaks boot, the
> patch can be dropped.
> 
> From these tests, I have created two branches ( arch/arm/mm have
> replacements for calls to no longer compiled in ):
> 
> http://code.google.com/p/linux-next-20130703-moxart/source/detail?r=a88f33ad22d3f9a31fe126f1c95568e5b2e8f32d&name=multi_V4_test_arm920t
> http://code.google.com/p/linux-next-20130703-moxart/source/detail?r=9f4c21f1123a122c51792cd374217ce6e426e74a&name=multi_V4_test_sa1100

It looks like you select CPU_ARM926T but change the entry for CPU_ARM920T
instead, which would have no effect then.

	Arnd
