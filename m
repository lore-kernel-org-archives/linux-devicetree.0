From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v10 4/5] edac: Add APM X-Gene SoC EDAC driver
Date: Fri, 22 May 2015 10:59:28 +0200
Message-ID: <2097631.G0OFDqxtEt@wuerfel>
References: <1431991481-25684-1-git-send-email-lho@apm.com>
 <1431991481-25684-4-git-send-email-lho@apm.com>
 <1431991481-25684-5-git-send-email-lho@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1431991481-25684-5-git-send-email-lho@apm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Loc Ho <lho@apm.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, ijc+devicetree@hellion.org.uk, jcm@redhat.com, mchehab@osg.samsung.com, patches@apm.com, robh+dt@kernel.org, bp@alien8.de, dougthompson@xmission.com, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Monday 18 May 2015 17:24:40 Loc Ho wrote:
> +       tmp_ctx.mcu_id = ((res.start >> 16) & 0xF) / 4;
> 

Just found this line: you are effectively hardcoding the physical
register layout of the chip in the driver here, to get the index
of the memory controller. This is a very bad idea as it prevents
you from reusing this driver for another chip that puts the
same registers in a different place, don't do that.

	Arnd
