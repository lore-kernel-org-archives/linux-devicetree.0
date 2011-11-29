From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 3/5] ARM: vexpress: Add DT support in v2m
Date: Tue, 29 Nov 2011 21:19:11 +0000
Message-ID: <201111292119.11554.arnd@arndb.de>
References: <1322579473-8804-1-git-send-email-pawel.moll@arm.com>
 <1322579473-8804-4-git-send-email-pawel.moll@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1322579473-8804-4-git-send-email-pawel.moll@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org, Pawel Moll <pawel.moll@arm.com>
List-Id: devicetree@vger.kernel.org

On Tuesday 29 November 2011, Pawel Moll wrote:
> +                       compact-flash@1a000 {
> +                               compatible = "ata-generic";
> +                               reg = <0x1a000 0x100
> +                                      0x1a100 0xf00>;
> +                               reg-shift = <2>;
> +                       };

Shouldn't there also be a more specific "compatible" value, in case we have
to detect this CF slot for some reason?

Is there actually no interrupt?

	Arnd
