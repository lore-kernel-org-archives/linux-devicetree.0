From: "ivan.khoronzhuk" <ivan.khoronzhuk@ti.com>
Subject: Re: [PATCH v3] ARM: davinci: aemif: get rid of davinci-nand driver
 dependency on aemif
Date: Thu, 26 Dec 2013 14:06:16 +0200
Message-ID: <52BC1BB8.2070007@ti.com>
References: <1386267092-18615-1-git-send-email-ivan.khoronzhuk@ti.com>
 <52B18C44.2000305@ti.com> <52B1915A.7060309@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <52B1915A.7060309@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Brian Norris <computersforpeace@gmail.com>, Sekhar Nori <nsekhar@ti.com>, David Woodhouse <dwmw2@infradead.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, grygorii.strashko@ti.com, linux@arm.linux.org.uk, pawel.moll@arm.com, swarren@wwwdotorg.org, ijc+devicetree@hellion.org.uk, galak@kernel.crashing.org, rob.herring@calxeda.com, linux-kernel@vger.kernel.org, Santosh Shilimkar <santosh.shilimkar@ti.com>, Rob Landley <rob@landley.net>, linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 12/18/2013 02:13 PM, Sekhar Nori wrote:
> On Wednesday 18 December 2013 05:21 PM, ivan.khoronzhuk wrote:
>> Hi, Sekhar
>>
>> This patch is based on "Reuse davinci-nand driver for Keystone arch" series.
>> The series has passed review at https://lkml.org/lkml/2013/12/17/241
>> and can be found at http://git.infradead.org/l2-mtd.git
>>
>> This patch can be still applied on top of the series without conflicts.
>>
>> Can you please pick up the $subject patch if you are OK with it?
>
> I have no problems with the patch and can pick it too, but need ack from
> MTD maintainer (David) as it touches drivers/mtd/ too.
>
> David,
>
> If you do not have the patch, we can resend it.
>
> Thanks,
> Sekhar
>

Hi Brian,

Do you agree if this patch will go through Davinci tree?

This is the last one we need to reuse Davinci Nand driver for Keystone.

-- 
Regards,
Ivan Khoronzhuk

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
